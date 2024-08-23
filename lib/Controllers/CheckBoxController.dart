import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  late RxList<RxBool> isCheckedList;
  var totalScore = 0.0.obs;

  void initialize(int size) {
    isCheckedList = RxList<RxBool>.generate(size, (_) => false.obs);
  }

  void toggleCheckBox(int index) {
    isCheckedList[index].toggle();
  }
}
