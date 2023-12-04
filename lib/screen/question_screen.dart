import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Matcher'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Question',
                    // questions[questionIndex].question,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  // buildOptions(questions[questionIndex]),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (questionIndex > 0) {
                      questionIndex--;
                    }
                  });
                },
                child: Text('Previous'),
              ),
              ElevatedButton(
                onPressed: () {
                  // setState(() {
                  //   if (questionIndex < questions.length - 1) {
                  //     questionIndex++;
                  //   } else {
                  //     // Navigate to results screen when all questions are answered
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) =>
                  //             ResultsScreen(List.from(answers)),
                  //       ),
                  //     );
                  //   }
                  // });
                },
                // child: Text(questionIndex < questions.length - 1
                //     ? 'Next'
                //     : 'See Results'),
                child: Text('See Results'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
