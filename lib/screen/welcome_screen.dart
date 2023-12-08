
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pet_suggestions/screen/quiz_screen.dart';

import '../constants/global_variables.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const String routeName = 'welcome-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/dogs_image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                ' Lets, \n Find you a perfect dog',
                style: welcomeStyle
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, QuizScreen.routeName);
                  },
                child: const Icon(LineIcons.search, size: 75,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
