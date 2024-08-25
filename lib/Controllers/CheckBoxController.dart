import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  // Map to store checkbox states for each step
  Map<int, RxList<RxBool>> stepCheckBoxStates = {};

  // Scores
  var parkingScore = 0.0.obs;
  var pavementsScore = 0.0.obs;
  var servicesScore = 0.0.obs;
  var toiletScore = 0.0.obs;

  void initialize(int step, int length) {
    if (!stepCheckBoxStates.containsKey(step)) {
      stepCheckBoxStates[step] = RxList.generate(length, (_) => false.obs);
    }
  }

  void toggleCheckBox(int step, int index, double score, String questionId) {
    if (stepCheckBoxStates.containsKey(step)) {
      var checkBoxList = stepCheckBoxStates[step]!;
      if (index >= 0 && index < checkBoxList.length) {
        if (checkBoxList[index].isFalse) {
          checkBoxList[index].toggle();
          _updateScore(questionId, score, true);
        } else {
          checkBoxList[index].toggle();
          _updateScore(questionId, score, false);
        }
      }
    }
  }

  void _updateScore(String questionId, double score, bool isChecked) {
    switch (questionId) {
      case "1":
        if (isChecked) {
          parkingScore.value += score;
        } else {
          parkingScore.value -= score;
        }
        break;
      case "2":
        if (isChecked) {
          pavementsScore.value += score;
        } else {
          pavementsScore.value -= score;
        }
        break;
      case "3":
        if (isChecked) {
          servicesScore.value += score;
        } else {
          servicesScore.value -= score;
        }
        break;
      case "4":
        if (isChecked) {
          toiletScore.value += score;
        } else {
          toiletScore.value -= score;
        }
        break;
      default:
        break;
    }
  }

  RxList<RxBool>? getCheckBoxStates(int step) {
    return stepCheckBoxStates[step];
  }
}
