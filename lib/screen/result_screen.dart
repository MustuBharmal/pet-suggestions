import 'package:adv_basics/provider/dog_breed_provider.dart';
import 'package:adv_basics/screen/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsScreen extends StatefulWidget {
  final List<dynamic> answers;

  const ResultsScreen(this.answers, {super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late final dogBreeds;
  bool dataFetched = false;

  List<String> getRecommendedDogBreeds() {
    List<String> recommendedBreeds = [];

    dogBreeds.forEach((dogBreed) {
      int point = 0;
      String breed = dogBreed.breed;
      List<String> character = dogBreed.characteristics;
      for (int i = 0; i < character.length; i++) {
        if (character[i] == widget.answers[i]) {
          point = point + 1;
        }
      }
      print(point);
      if (point >= 5) {
        recommendedBreeds.add(breed);
      }
    });

    return recommendedBreeds
        .take(5)
        .toList(); // Show up to 5 recommended breeds
  }

  @override
  void didChangeDependencies() {
    if (!dataFetched) {
      dogBreeds = Provider.of<DogBreedProvider>(context).dogBreed;
    }
    print(dogBreeds[0].characteristics);
    dataFetched = true;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<String> recommendedBreeds = getRecommendedDogBreeds();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Based on your answers, we recommend:',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            if (recommendedBreeds.isNotEmpty)
              Column(
                children: recommendedBreeds
                    .map((breed) => Text(
                          breed,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ))
                    .toList(),
              )
            else
              const Text(
                'No suitable breeds found.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuestionScreen()),
                  (route) => false,
                );
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
