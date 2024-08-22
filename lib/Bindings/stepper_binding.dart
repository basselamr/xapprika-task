import 'package:get/get.dart';
import 'package:untitled/Controllers/StepperController.dart';

class StepperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StepperController());
  }
}
