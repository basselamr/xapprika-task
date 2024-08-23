import 'step.dart';

class Question {
  String questionId;
  String questionValue;
  double question1StarScore;
  double question2StarsScore;
  double question3StarsScore;
  double totalScore;
  double starRating;
  List<Step> steps;

  Question({
    required this.questionId,
    required this.questionValue,
    required this.starRating,
    required this.steps,
    required this.totalScore,
    required this.question1StarScore,
    required this.question2StarsScore,
    required this.question3StarsScore,
  });
}
