import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../Controllers/CheckBoxController.dart';
import '../Controllers/NewPlaceController.dart';
import '../Controllers/StepperController.dart';
import '../Models/CustomIcons.dart';
import '../Widgets/BackArrow.dart';
import '../Widgets/CheckBoxListile.dart';
import 'NavBar.dart';
import '../Models/questionsData.dart';

class AddReviewScreen extends StatelessWidget {
  AddReviewScreen({super.key});

  final stepperController = Get.find<StepperController>();
  final _checkBoxController = Get.put(CheckBoxController());
  final newPlaceController = Get.find<NewPlaceController>();

  Map<int, IconData> stepIcons = {
    1: CustomIcons.group_57572,
    2: CustomIcons.pavementIcon,
    3: CustomIcons.group_57577,
    4: CustomIcons.group_57580,
    5: CustomIcons.service,
    6: CustomIcons.wc
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
      body: Obx(() {
        int currentStep = stepperController.currentStep();
        String? stepTitle;

        final steps = questionsArray
            .expand((question) => question['steps'] as List)
            .toList();

        if (steps.isNotEmpty && steps.length >= currentStep) {
          stepTitle = steps[currentStep - 1]['stepTitle'];
          final questions = steps[currentStep - 1]['responses'] as List?;
          _checkBoxController.initialize(questions?.length ?? 0);
        }

        return Stack(
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
                  heightFactor: 1.5,
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
                        stepIcons[currentStep] ?? Icons.error,
                        color: Theme.of(context).colorScheme.primary,
                        size: 48,
                      ),
                    ),
                  ),
                ),
                if (!stepperController.isLastStep() && stepTitle != null)
                  Text(
                    stepTitle,
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
                                backgroundColor:
                                Theme.of(context).colorScheme.primary,
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
                        : (steps[currentStep - 1]['responses'] as List?)
                        ?.asMap()
                        .entries
                        .map(
                          (entry) => Obx(
                            () => CustomCheckboxTile(
                          text: entry.value['responseTitle'],
                          onTap: (bool value) {
                            print(entry.value['score']);
                            _checkBoxController.toggleCheckBox(entry.key);
                          },
                          checkBoxValue: _checkBoxController
                              .isCheckedList[entry.key].value,
                        ),
                      ),
                    )
                        .toList() ?? [],
                  ),
                ),
              ],
            ),
            if (!stepperController.isLastStep())
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
            if (!stepperController.isLastStep())
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
            if (stepperController.currentStep == 6)
              Positioned(
                bottom: 16,
                right: 16,
                child: ElevatedButton(
                  onPressed: () {
                    stepperController.nextStep();
                    newPlaceController.addPlaceToDatabase();
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
        );
      }),
    );
  }
}
