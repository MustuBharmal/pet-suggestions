import 'package:flutter/material.dart';

import '../screen/quiz_screen.dart';
import '../screen/suggestion_screen.dart';
import '../screen/welcome_screen.dart';

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
    case WelcomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (abc) => const WelcomePage(),
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
