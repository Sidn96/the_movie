import 'package:flutter/material.dart';

class AppRadioButton extends StatelessWidget {
  final String label;
  final int value;
  final int? groupValue;
  final ValueChanged<int> onChanged;

  const AppRadioButton({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 20, end: 20),
        // tween: Tween<double>(begin: 20, end: isSelected ? 30 : 20),
        duration: const Duration(milliseconds: 300),
        builder: (context, size, child) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? Colors.blue : Colors.grey[300],
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: size * 0.6,
                        )
                      : null,
                ),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
