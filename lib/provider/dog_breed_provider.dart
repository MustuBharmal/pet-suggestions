// Dogs breed
import 'package:flutter/cupertino.dart';

import '../models/dog_model.dart';

class DogBreedProvider with ChangeNotifier {
  List<DogBreed> dogBreeds = [
    DogBreed('Golden Retriever', [
      'Very active',
      'Big',
      'No',
      'Medium',
      'Yes',
      'Frequently',
      'House',
      'Moderate',
      'Occasionally',
      'Low'
    ]),
    DogBreed('Beagle', [
      'Very active',
      'Small',
      'No',
      'Low',
      'No',
      'Sometimes',
      'House',
      'Low',
      'Occasionally',
      'Medium'
    ]),
    DogBreed('Poodle', [
      'Not active',
      'Small',
      'No',
      'High',
      'Yes',
      'Frequently',
      'Apartment',
      'Low',
      'Occasionally',
      'Low',
    ]),
    DogBreed('German Shepherd', [
      'Very active',
      'Big',
      'Yes',
      'Medium',
      'No',
      'Frequently',
      'House',
      'As much Required',
      'Rarely',
      'High'
    ]),
    DogBreed('Bulldog', [
      'Not active',
      'Medium',
      'Yes',
      'Low',
      'No',
      'Rarely',
      'Apartment',
      'As much Required',
      'Frequently',
      'Medium',
    ])
    // Add more dog breeds as needed
  ];

  List<DogBreed> get dogBreed {
    return [...dogBreeds];
  }
}
