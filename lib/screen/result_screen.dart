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
    // List<String> recommendedBreeds = getRecommendedDogBreeds();

    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Based on your answers, we recommend:',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // if (recommendedBreeds.isNotEmpty)
              Column(
                // children: recommendedBreeds
                //     .map((breed) => Text(
                //   breed,
                //   style: TextStyle(
                //       fontSize: 24, fontWeight: FontWeight.bold),
                //   textAlign: TextAlign.center,
                // ))
                //     .toList(),
              // )
            // else
            //   Text(
            //     'No suitable breeds found.',
            //     style: TextStyle(fontSize: 18),
            //     textAlign: TextAlign.center,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => QuestionnaireScreen()),
                //       (route) => false,
                // );
              },
              child: Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
