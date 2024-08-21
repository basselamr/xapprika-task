import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:untitled/Controllers/StepperController.dart';
import 'package:untitled/Models/CustomIcons.dart';
import 'package:untitled/Widgets/BackArrow.dart';
import 'package:untitled/Widgets/CheckBoxListile.dart';

class AddReviewScreen extends StatelessWidget {
  AddReviewScreen({Key? key}) : super(key: key);

  final stepperController = Get.put(StepperController());

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
      body: Obx(
            () {
          int currentStep = stepperController.currentStep.value;

          // Define a map of icons and questions for each step
          Map<int, IconData> stepIcons = {
            1: CustomIcons.group_57572,
            2: Icons.star,
            3: Icons.thumb_up,
          };

          Map<int, List<String>> stepQuestions = {
            1: ["Question 1 for Step 1", "Question 2 for Step 1"],
            2: ["Question 1 for Step 2", "Question 2 for Step 2"],
            3: ["Question 1 for Step 3", "Question 2 for Step 3"],
          };

          return Stack(
            children: [
              Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 7,
                    currentStep: currentStep,
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
                        stepIcons[currentStep] ?? Icons.help, // Default icon if not found
                        color: Theme.of(context).colorScheme.primary,
                        size: 200,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: stepQuestions[currentStep]
                          ?.map(
                            (question) => CustomCheckboxTile(
                          isAvailable: true,
                          onTap: () {

                          },
                        ),
                      )
                          .toList() ??
                          [],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: FloatingActionButton(
                  onPressed: () {
                    stepperController.previousStep();
                  },
                  mini: true,
                  backgroundColor: const Color(0xFFF8FAFF),
                  child: const Icon(Icons.arrow_back, color: Color(0xFF797F96)),
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: FloatingActionButton(
                  onPressed: () {
                    stepperController.nextStep();
                  },
                  mini: true,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: const Icon(Icons.arrow_forward),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
