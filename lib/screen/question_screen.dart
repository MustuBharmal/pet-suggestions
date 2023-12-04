import 'package:adv_basics/provider/question_provider.dart';
import 'package:adv_basics/screen/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../models/question_model.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  static const String routeName = 'question-screen';

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
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

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Matcher'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      questions[questionIndex].question,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 15),
                  buildOptions(questions[questionIndex]),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (questionIndex > 0) {
                          questionIndex--;
                        }
                      });
                    },
                    icon: const Icon(LineIcons.backward),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (questionIndex < questions.length - 1) {
                        questionIndex++;
                      } else {
                        // Navigate to results screen when all questions are answered
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ResultsScreen(List.from(answers)),
                          ),
                        );
                      }
                    });
                  },
                  icon: questionIndex < questions.length - 1
                      ? const Icon(LineIcons.forward)
                      : const Text('See Results'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOptions(Question question) {
    switch (question.type) {
      case 'radio':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: question.options.map((option) {
              return RadioListTile(
                title: Text(option),
                value: option,
                groupValue: answers[questionIndex],
                onChanged: (value) {
                  setState(() {
                    answers[questionIndex] = value;
                  });
                },
              );
            }).toList(),
          ),
        );
      case 'checkbox':
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: question.options.map((option) {
            return CheckboxListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Text(option),
              ),
              value: answers[questionIndex]?.contains(option) ?? false,
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    answers[questionIndex] =
                        List.from(answers[questionIndex] ?? [])..add(option);
                  } else {
                    answers[questionIndex]?.remove(option);
                  }
                });
              },
            );
          }).toList(),
        );
      case 'slider':
        return Column(
          children: [
            Text('Select the tolerance level: ${answers[questionIndex]}'),
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
        );
      default:
        return Container();
    }
  }
}
