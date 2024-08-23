import 'Response.dart';

class Step {
  String stepId;
  String stepTitle;
  String stepTitleAr;
  String iconPath;
  List<Response> responses;

  Step({
    required this.stepId,
    required this.stepTitle,
    required this.stepTitleAr,
    required this.iconPath,
    required this.responses,
  });
}
