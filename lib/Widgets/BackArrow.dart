import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/imgs/Ellipse 1.png',  // The border image
            width: 35,  // Adjusted size for the border image
            height: 35,
          ),
          Image.asset(
            'assets/imgs/vuesax-outline-arrow-left.png',  // The arrow image
            width: 20,  // Adjusted size for the arrow image
            height: 20,
          ),
        ],
      ),
    );
  }
}
