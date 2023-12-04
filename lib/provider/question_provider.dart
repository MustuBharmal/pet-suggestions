import 'package:adv_basics/models/question_model.dart';
import 'package:flutter/material.dart';

import '../models/dog_model.dart';

class QuestionProvider with ChangeNotifier {
  List<Question> questions = [
    Question(
      question: 'How active are you?',
      options: ['Not active', 'Somewhat active', 'Very active'],
      type: '',
    ),
    Question(
        question: 'Do you prefer a big or small dog?',
        options: ['Big', 'Small'],
        type: ''),
    Question(
        question: 'Are you looking for a guard dog?',
        options: ['Yes', 'No'],
        type: ''),
    Question(
        question: 'How much grooming are you willing to do?',
        options: ['Low', 'Medium', 'High'],
        type: ''),
    Question(
        question: 'Do you have children at home?',
        options: ['Yes', 'No'],
        type: ''),
    Question(
        question: 'How often do you have time for walks?',
        options: ['Rarely', 'Sometimes', 'Frequently'],
        type: ''),
    Question(
        question: 'Do you live in an apartment or house?',
        options: ['Apartment', 'House'],
        type: ''),
    Question(
        question: 'How much barking can you tolerate?',
        options: ['Low', 'Medium', 'High'],
        type: ''),
  ];
  List<Question> get question {
    return [...questions];

}}