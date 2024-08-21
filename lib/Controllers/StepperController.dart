import 'package:get/get.dart';

class StepperController extends GetxController{
  var complete = false.obs;
  var currentStep=1.obs;

  nextStep(){
    currentStep++;
  }
  previousStep(){

    currentStep--;
    if(currentStep==0){
      currentStep++;
    }
  }
}