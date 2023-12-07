import 'package:adv_basics/screen/suggestion_screen.dart';
import 'package:flutter/material.dart';

import '../screen/quiz_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case QuizScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (abc) => const QuizScreen(),
      );
    case SuggestionsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (abc) => const SuggestionsScreen(),
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
