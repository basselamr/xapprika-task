import 'package:flutter/material.dart';

class CustomCheckboxTile extends StatelessWidget {
  final bool isAvailable;
  final VoidCallback onTap;

  const CustomCheckboxTile({
    Key? key,
    required this.isAvailable,
    required this.onTap,
  }) : super(key: key);

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
                Text(
                  'Disability parking space available',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                 Text(
                  '(private or public parking)',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Transform.scale(
            scale: 1.4,
            child: Checkbox(
              value: !isAvailable,
              onChanged: (value) {
                if (value != null) {
                  onTap();
                }
              },
              checkColor: Theme.of(context).colorScheme.primary,
              activeColor: Colors.pink[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              side: const BorderSide(
                color: Color(0xFFF8FAFF),
                width: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
