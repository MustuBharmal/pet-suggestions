import 'package:adv_basics/screen/question_screen_4.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case QuestionScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (abc) => const QuestionScreen(),
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
