// Dogs breed
import 'package:flutter/cupertino.dart';

import '../models/dog_model.dart';

class DogBreedProvider with ChangeNotifier {
  List<DogBreed> dogBreeds = [
    DogBreed('Golden Retriever', [
      'Very active',
      'Big',
      'No',
      'Low',
      'No',
      'Frequently',
      'House',
      'Low'
    ]),
    DogBreed('Beagle', [
      'Somewhat active',
      'Small',
      'No',
      'Low',
      'Yes',
      'Sometimes',
      'House',
      'Medium'
    ]),
    DogBreed('Poodle', [
      'Somewhat active',
      'Small',
      'No',
      'High',
      'Yes',
      'Frequently',
      'Apartment',
      'Low'
    ]),
    DogBreed('German Shepherd', [
      'Very active',
      'Big',
      'Yes',
      'Medium',
      'Yes',
      'Frequently',
      'House',
      'High'
    ]),
    DogBreed('Bulldog', [
      'Not active',
      'Medium',
      'No',
      'Low',
      'Yes',
      'Rarely',
      'Apartment',
      'Medium'
    ])
    // Add more dog breeds as needed
  ];

  List<DogBreed> get dogBreed {
    return [...dogBreeds];
  }
}
