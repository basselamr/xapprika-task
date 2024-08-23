import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:untitled/Models/questionsData.dart';
import '../Controllers/CheckBoxController.dart';
import '../Controllers/StepperController.dart';
import '../Models/CustomIcons.dart';
import '../Widgets/BackArrow.dart';
import '../Widgets/CheckBoxListile.dart';
import 'NavBar.dart';

class AddReviewScreen extends StatelessWidget {
  AddReviewScreen({super.key});

  final stepperController = Get.find<StepperController>();
  final _checkBoxController = Get.put(CheckBoxController());

  Map<int, IconData> stepIcons = {
    1: CustomIcons.group_57572,
    2: CustomIcons.pavementIcon,
    3: CustomIcons.group_57577,
    4: CustomIcons.group_57580,
    5: CustomIcons.service,
    6: CustomIcons.wc
  };

  Map<int, List<String>> stepQuestions = {
    1: ["Question 1 for Step 1", "Question 2 for Step 1"],
    2: ["Question 1 for Step 2", "Question 2 for Step 2"],
    3: ["Question 1 for Step 3", "Question 2 for Step 3"],
  };

  @override
  Widget build(BuildContext context) {
    _checkBoxController.initialize(
        stepQuestions[stepperController.currentStep()]?.length ?? 0);

    // Retrieve the current step index
    int currentStep =
        stepperController.currentStep() - 1; // Adjust for 0-based index
    // Retrieve the step title for the current step
    String? stepTitle;

    // Find the appropriate step title from questionsArray
    if (currentStep < questionsArray.length) {
      final steps = questionsArray[currentStep]['steps'];
      if (steps != null && steps is List && steps.isNotEmpty) {
        stepTitle = steps[0][
            'stepTitle']; // Assuming you're showing the title of the first step in the list
      }
    }

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
                                Icons.check,
                                color: Colors.green,
                                size: 48,
                              )
                            : Icon(
                                stepIcons[stepperController.currentStep()],
                                color: Theme.of(context).colorScheme.primary,
                                size: 48,
                              ),
                      ),
                    ),
                  ),
                  if (!stepperController.isLastStep() && stepTitle != null)
                    // const SizedBox(
                    //   height: 2,
                    // ),
                  Text(
                    stepTitle!,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondaryContainer,
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
                                        fontWeight: FontWeight.normal,
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
                                  ?.asMap()
                                  .entries
                                  .map(
                                    (entry) => CustomCheckboxTile(
                                      text: entry.value,
                                      onTap: (bool value) {
                                        _checkBoxController
                                            .toggleCheckBox(entry.key);
                                      },
                                      checkBoxValue: _checkBoxController
                                              .isCheckedList[entry.key].value ??
                                          false,
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
                          horizontal: 10, vertical: 10),
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
