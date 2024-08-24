import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  RxList<RxBool> isCheckedList = <RxBool>[].obs;
  var parkingScore = 0.0.obs;
  var pavementsScore = 0.0.obs;
  var servicesScore = 0.0.obs;
  var toiletScore = 0.0.obs;

  void initialize(int length) {
    isCheckedList.clear();
    isCheckedList.addAll(List.generate(length, (_) => false.obs));
  }

  void toggleCheckBox(int index) {
    isCheckedList[index].value = !isCheckedList[index].value;
  }
}
