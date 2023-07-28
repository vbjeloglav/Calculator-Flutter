import 'package:flutter/material.dart';
import 'package:calculatorr/widgets/button.dart';

class CalculateResultButton extends StatelessWidget {
  const CalculateResultButton({required this.onCalculateResult, super.key});
  final Function() onCalculateResult;

  @override
  Widget build(context) {
    return Expanded(
      child: CustomButton(
        label: '=',
        onTap: onCalculateResult,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
    );
  }
}
