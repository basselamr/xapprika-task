import 'package:flutter/material.dart';

class CustomCheckboxTile extends StatelessWidget {
  final String text;
  final bool checkBoxValue;
  final Function(bool) onTap;

  const CustomCheckboxTile({
    super.key,
    required this.text,
    required this.checkBoxValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15,left: 15,top: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: checkBoxValue ? const Color(0xFFDA035F) : Colors.transparent,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF3A3E50),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Checkbox(
            value: checkBoxValue,
            fillColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.pink[50]!;
                }
                return const Color(0xFFF0F2FA);
              },
            ),
            checkColor: Theme.of(context).colorScheme.primary,
            side: WidgetStateBorderSide.resolveWith(
                  (Set<WidgetState> states) {
                return const BorderSide(color: Colors.transparent);
              },
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            onChanged: (bool? value) {
              onTap(value!);
            },
          )
        ],
      ),
    );
  }
}
