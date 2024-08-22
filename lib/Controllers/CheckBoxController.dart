import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  final RxBool isDisabilityChecked = false.obs;

  void toggleDisability() {
    isDisabilityChecked.toggle();
  }
}
