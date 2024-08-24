import 'package:get/get.dart';

class StepperController extends GetxController {
  var complete = false.obs;
  var currentStep = 1.obs;

  bool isLastStep() {
    return currentStep.value == 7;
  }

  nextStep() {
    if (currentStep.value < 7) {
      currentStep.value += 1;
    }
  }

  previousStep() {
    if (currentStep.value > 1) {
      currentStep.value -= 1;
    }
  }

}
