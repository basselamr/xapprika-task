import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Controllers/CheckBoxController.dart';

class CustomCheckboxTile extends StatelessWidget {
  final String text;
  final Color activeBorderColor;
  final bool checkBoxValue;
  final double height;
  final double width;
  final bool isAvailable;
  final Function(bool) onTap;

  const CustomCheckboxTile({
    super.key,
    required this.isAvailable,
    required this.onTap,
    required this.text,
    required this.height,
    required this.width,
    required this.checkBoxValue,
    required this.activeBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: activeBorderColor,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Checkbox.adaptive(
                            value: checkBoxValue,
                            activeColor: Colors.pink[100],
                            checkColor: Colors.pink,
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            tristate: true,
                            onChanged: (x) {
                              onTap(false);
                            })
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
