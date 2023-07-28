import 'package:calculatorr/widgets/button.dart';
import 'package:flutter/widgets.dart';

class OperatorButton extends StatelessWidget {
  const OperatorButton(
      {super.key, required this.operator, required this.onOperatorPressed});

  final String operator;
  final Function(String) onOperatorPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomButton(
          label: operator,
          onTap: () => onOperatorPressed(operator),
          backgroundColor: const Color.fromRGBO(230, 230, 230, 1)),
    );
  }
}
