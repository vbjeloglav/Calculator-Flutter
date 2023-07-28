import 'package:calculatorr/widgets/button.dart';
import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  const NumberButton(
      {super.key, required this.number, required this.onNumberPressed});

  final int number;
  final Function(int) onNumberPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomButton(
        label: number.toString(),
        onTap: () => onNumberPressed(number),
      ),
    );
  }
}
