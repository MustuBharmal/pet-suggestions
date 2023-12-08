
import 'package:flutter/material.dart';
import 'package:pet_suggestions/provider/dog_breed_provider.dart';
import 'package:pet_suggestions/provider/question_provider.dart';
import 'package:pet_suggestions/screen/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'constants/custom_theme.dart';
import 'constants/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => DogBreedProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => QuestionProvider(),
        ),
      ],
      child: MaterialApp(
        theme: customTheme,

        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const WelcomePage(),
      ),
    );
  }
}
