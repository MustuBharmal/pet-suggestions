import 'package:adv_basics/screen/suggestion_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/question_model.dart';
import '../provider/question_provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  static const String routeName = 'quiz-screen';

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionIndex = 0;
  late List<dynamic> answers;
  bool dataFetched = false;
  late final questions;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!dataFetched) {
      questions =
          Provider.of<QuestionProvider>(context, listen: false).question;

      answers = List.generate(questions.length, (index) => null);
    }

    dataFetched = true;
    super.didChangeDependencies();
  }

  bool isQuestionAnswered() {
    return answers[questionIndex] != null;
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 10,
        onPressed: () {
          if (isQuestionAnswered()) {
            setState(() {
              if (questionIndex < questions.length - 1) {
                questionIndex++;
              } else {
                // Navigate to results screen when all questions are answered
                Navigator.pushNamed(
                  context,
                  SuggestionsScreen.routeName,
                  arguments: List.from(answers),
                );
              }
            });
          } else {
            // Show a message or alert indicating that the question needs to be answered
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please select an option before proceeding.'),
              ),
            );
          }
        },
        backgroundColor: Colors.lightGreen,
        label: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Text(
            questionIndex < questions.length - 1 ? 'Next' : 'Result',
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  questionIndex != 0
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              if (questionIndex > 0) {
                                questionIndex--;
                              }
                            });
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.black,
                              ),
                              Text('Previous'),
                            ],
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.0),
                          child: Text(''),
                        ),
                  SizedBox(
                    width: deviceSize.width / 4.5,
                  ),
                  Text(
                    "${(questionIndex + 1)} / ${questions.length}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: deviceSize.width * 0.85,
              height: deviceSize.height / 4,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 0.1,
                  offset: Offset(0, 10),
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    questions[questionIndex].question,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(child: buildOptions(questions[questionIndex])),
          ],
        ),
      ),
    );
  }

  Widget buildOptions(Question question) {
    switch (question.type) {
      case 'radio':
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: question.options.map((option) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 0.1,
                          offset: Offset(0, 10),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: RadioListTile.adaptive(
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text(option),
                    value: option,
                    groupValue: answers[questionIndex],
                    onChanged: (value) {
                      setState(() {
                        answers[questionIndex] = value;
                      });
                    },
                  ),
                ),
              );
            }).toList(),
          ),
        );
      case 'checkbox':
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: question.options.map((option) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 0.1,
                          offset: Offset(0, 10),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: CheckboxListTile(
                    title: Text(option),
                    value: answers[questionIndex]?.contains(option) ?? false,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          answers[questionIndex] =
                              List.from(answers[questionIndex] ?? [])
                                ..add(option);
                        } else {
                          answers[questionIndex]?.remove(option);
                        }
                      });
                    },
                  ),
                ),
              );
            }).toList(),
          ),
        );
      case 'slider':
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 0.1,
                offset: Offset(0, 10),
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Select the tolerance level: ${answers[questionIndex]}',
                    style: const TextStyle(fontSize: 21),
                  ),
                  Slider(
                    value: (answers[questionIndex] ?? 0).toDouble(),
                    min: 0,
                    max: 2,
                    divisions: 2,
                    onChanged: (value) {
                      setState(() {
                        answers[questionIndex] = value.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      default:
        return Container();
    }
  }
}
