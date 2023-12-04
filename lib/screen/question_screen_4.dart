import 'package:flutter/material.dart';

import '../widgets/question_widget.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
static const String routeName = 'question-screen';
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const QuestionWidget(),
      ),
    );
  }
}
