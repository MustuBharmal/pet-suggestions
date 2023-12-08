import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pet_suggestions/screen/welcome_screen.dart';
import 'package:provider/provider.dart';

import '../constants/global_variables.dart';
import '../models/dog_model.dart';
import '../provider/dog_breed_provider.dart';

class SuggestionsScreen extends StatefulWidget {
  const SuggestionsScreen({super.key});

  static const String routeName = 'suggestions-screen';

  @override
  State<SuggestionsScreen> createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  List<dynamic>? answers;
  dynamic dogBreeds;
  bool dataFetched = false;

  List<Result> getRecommendedDogBreeds() {
    List<Result> recommendedBreeds = [];

    dogBreeds.forEach((dogBreed) {
      int point = 0;
      String breed = dogBreed.breed;
      List<String> character = dogBreed.characteristics;
      for (int i = 0; i < character.length; i++) {
        if (character[i] == answers![i]) {
          print(answers![i]);
          point = point + 1;
        }
      }
      if (point >= 5) {
        print(point);
        Result result = Result(breed, (point * 100) / 8);
        print(result.percent);
        recommendedBreeds.add(result);
      }
    });

    return recommendedBreeds
        .take(5)
        .toList(); // Show up to 5 recommended breeds
  }

  @override
  void didChangeDependencies() {
    answers = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    if (!dataFetched) {
      dogBreeds = Provider.of<DogBreedProvider>(context).dogBreed;
    }
    dataFetched = true;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<Result> recommendedBreeds = getRecommendedDogBreeds();
    recommendedBreeds.reversed;
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 10,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            WelcomePage.routeName,
            (route) => false,
          );
        },
        label: const Padding(
          padding: EdgeInsets.all(70.0),
          child: Text(
            'Retry',
            style: titleStyle,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg_image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            recommendedBreeds.isEmpty
                ? const Center(
                    child: Text(
                    'No suitable breeds found.',
                    style: headerStyle,
                  ))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 36.0,
                          left: 24,
                        ),
                        child: Text(
                          'Suggestions:- ',
                          style: headerStyle,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (ctx, i) => SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: (deviceSize.width),
                                    height: (deviceSize.height / 4.0),
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0xFFFCC89E),
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                            offset: Offset(0, 5),
                                          )
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: SizedBox(
                                      width: 70,
                                      height: 35,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              recommendedBreeds[i].dogBreed,
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis,
                                              style: titleStyle,
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Flexible(
                                              child: CircularPercentIndicator(
                                                animation: false,
                                                radius: 50.0,
                                                lineWidth: 10.0,
                                                percent: recommendedBreeds[i]
                                                        .percent /
                                                    100,
                                                footer:
                                                    const Text("Compatibility"),
                                                center: Text(
                                                    recommendedBreeds[i]
                                                        .percent
                                                        .toString()),
                                                backgroundColor: Colors.black87,
                                                progressColor:
                                                    const Color(0xFFFAA452),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          itemCount: recommendedBreeds.length,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
