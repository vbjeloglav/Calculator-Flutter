import 'package:flutter/material.dart';
import 'package:calculatorr/widgets/button.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({required this.onClear, super.key});

  final Function() onClear;

  @override
  Widget build(context) {
    return Expanded(
      child: CustomButton(
        label: 'C',
        onTap: onClear,
      ),
    );
  }
}
