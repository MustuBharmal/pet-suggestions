// Model for the questionnaire

class Question {
  String? question;
  List<String> options;
  String type;

  Question({required this.question,required this.options,required this.type});
}
