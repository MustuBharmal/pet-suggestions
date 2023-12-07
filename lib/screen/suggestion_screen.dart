import 'package:adv_basics/screen/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dog_breed_provider.dart';
class Result{
  final String dogBreed;
  final double percent;
  Result(this.dogBreed, this.percent);
}
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
          point = point + 1;
        }
      }
      if (point >= 4) {
        recommendedBreeds.add();
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
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 10,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            QuizScreen.routeName,
            (route) => false,
          );
        },
        backgroundColor: Colors.lightGreen,
        label: const Padding(
          padding: EdgeInsets.all(70.0),
          child: Text(
            'Retry',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: Stack(
        children: [
          recommendedBreeds.isEmpty
              ? const Center(
                  child: Text(
                  'No suitable breeds found.',
                  style: TextStyle(fontSize: 20),
                ))
              : ListView.builder(
                  itemBuilder: (ctx, i) => SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: (deviceSize.width),
                            height: (deviceSize.height / 4.5),
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10,
                                    spreadRadius: 0.1,
                                    offset: Offset(0, 10),
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: SizedBox(
                              width: 70,
                              height: 35,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      recommendedBreeds[i],
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Flexible(
                                      child: Text(
                                        'Problem Description :- ',
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(fontSize: 15),
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
        ],
      ),
    );
  }
}
