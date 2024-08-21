import 'package:get/get.dart';

class NavBarController extends GetxController {
  var selectedIndex = 1.obs;


  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}
