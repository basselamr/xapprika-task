import 'package:get/get.dart';

class StepperController extends GetxController {
  var complete = false.obs;
  var currentStep = 1.obs;

  bool isLastStep() {
    return currentStep.value == 7;
  }

  nextStep() {
    currentStep++;
  }

  previousStep() {
    currentStep--;
    if (currentStep.value == 0) {
      currentStep++;
    }
  }
}
