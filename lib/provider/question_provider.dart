
import 'package:flutter/material.dart';

import '../models/question_model.dart';

class QuestionProvider with ChangeNotifier {
  List<Question> questions = [
    Question(
      question: 'How active are you?',
      options: ['Not active', 'Somewhat active', 'Very active'],
      type: 'radio',
    ),
    Question(
        question: 'Do you prefer a big or small dog?',
        options: ['Big', 'Small'],
        type: 'checkbox'),
    Question(
        question: 'Are you looking for a guard dog?',
        options: ['Yes', 'No'],
        type: 'radio'),
    Question(
        question: 'How much grooming are you willing to do?',
        options: ['Low', 'Medium', 'High'],
        type: 'radio'),
    Question(
        question: 'Do you have children at home?',
        options: ['Yes', 'No'],
        type: 'radio'),
    Question(
        question: 'How often do you have time for walks?',
        options: ['Rarely', 'Sometimes', 'Frequently'],
        type: 'radio'),
    Question(
        question: 'Do you live in an apartment or house?',
        options: ['Apartment', 'House'],
        type: 'radio'),
    Question(
        question: 'How much time are you willing to invest in training?',
        options: ['Low', 'Moderate', 'As much Required'],
        type: 'radio'),
    Question(
        question: 'How frequently do you travel or plan to travel with your dog?',
        options: ['Rarely', 'Occasionally', 'Frequently'],
        type: 'radio'),
    Question(
        question: 'How much barking can you tolerate?',
        options: ['Low', 'Medium', 'High'],
        type: 'slider'),

  ];
  List<Question> get question {
    return [...questions];

}}