import 'package:flutter/material.dart';

import '../screen/question_screen.dart';

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
