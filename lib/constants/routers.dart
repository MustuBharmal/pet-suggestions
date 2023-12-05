import 'package:adv_basics/screen/result_screen.dart';
import 'package:flutter/material.dart';

import '../screen/question_screen.dart';
import '../screen/quiz_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case QuestionScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (abc) => const QuestionScreen(),
      );
    case ResultsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (abc) => const ResultsScreen(),
      );
    case QuizScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (abc) => const QuizScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
