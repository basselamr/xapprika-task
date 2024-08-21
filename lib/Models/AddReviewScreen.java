import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:untitled/Models/CustomIcons.dart';
import 'package:untitled/Widgets/BackArrow.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackArrow(),
        centerTitle: true,
        title: const Text(
          "Add Review",
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Column(
        children: [
          StepProgressIndicator(
            totalSteps: 7,
            currentStep: 1,
            size: 10,
            padding: 0,
            selectedColor: Theme.of(context).colorScheme.secondary,
            unselectedColor: const Color(0xFFF0F2FA),
          ),
          Center(
            heightFactor: 2,
            child: Container(
              padding: const EdgeInsets.all(25),
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink[50],
              ),
              child: Icon(
                CustomIcons.group_57572,
                color: Theme.of(context).colorScheme.primary,
                size: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
