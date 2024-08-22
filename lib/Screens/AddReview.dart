import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:untitled/Controllers/CheckBoxController.dart';
import 'package:untitled/Controllers/StepperController.dart';
import 'package:untitled/Models/CustomIcons.dart';
import 'package:untitled/Screens/NavBar.dart';
import 'package:untitled/Widgets/BackArrow.dart';
import 'package:untitled/Widgets/CheckBoxListile.dart';

class AddReviewScreen extends StatelessWidget {
  AddReviewScreen({super.key});

  final stepperController = Get.find<StepperController>();
  final _checkBoxController = Get.put(CheckBoxController());

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
      body: Obx(() => Stack(
            children: [
              Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 7,
                    currentStep: stepperController.currentStep(),
                    size: 10,
                    padding: 0,
                    selectedColor: Theme.of(context).colorScheme.secondary,
                    unselectedColor: const Color(0xFFF0F2FA),
                  ),
                  Center(
                    heightFactor: 2,
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      width: 97,
                      height: 97,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: stepperController.isLastStep()
                            ? Colors.green[50]
                            : Colors.pink[50],
                      ),
                      child: Center(
                        child: stepperController.isLastStep()
                            ? const Icon(
                                CustomIcons.vuesax_bulk_tick_circle,
                                color: Colors.green,
                                size: 48,
                              )
                            : Icon(
                                stepIcons[stepperController.currentStep()] ??
                                    Icons.help,
                                color: Theme.of(context).colorScheme.primary,
                                size: 48,
                              ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: stepperController.isLastStep()
                          ? [
                              Center(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    const Text(
                                      'Thanks',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF06B58D),
                                      ),
                                    ),
                                    Text(
                                      'Your review submitted successfully',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondaryContainer,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.off(() => NavBar());
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                      ),
                                      child: const Text(
                                        'Go to home',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                          : stepQuestions[stepperController.currentStep()]
                                  ?.map(
                                    (question) => CustomCheckboxTile(
                                      height: 75,
                                      width: 300,
                                      text:
                                          'Disability parking space available\n(private or public parking)',
                                      isAvailable: true,
                                      onTap: (fsd) {
                                        Get.find<CheckBoxController>()
                                            .toggleDisability();
                                      },
                                      checkBoxValue: _checkBoxController
                                          .isDisabilityChecked(),
                                      activeBorderColor: _checkBoxController
                                              .isDisabilityChecked()
                                          ? Colors.pink
                                          : Colors.grey,
                                    ),
                                  )
                                  .toList() ??
                              [],
                    ),
                  ),
                ],
              ),
              if (stepperController.currentStep() != 7)
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: FloatingActionButton(
                    onPressed: () {
                      stepperController.previousStep();
                    },
                    mini: true,
                    backgroundColor: const Color(0xFFF8FAFF),
                    child:
                        const Icon(Icons.arrow_back, color: Color(0xFF797F96)),
                  ),
                ),
              if (stepperController.currentStep() != 7)
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
              if (stepperController.currentStep() == 6)
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: ElevatedButton(
                    onPressed: () {
                      stepperController.nextStep();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'Send Review',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
          )),
    );
  }
}
