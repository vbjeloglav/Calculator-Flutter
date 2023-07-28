import 'package:calculatorr/widgets/calculate_result_button.dart';
import 'package:calculatorr/widgets/clear_button.dart';
import 'package:calculatorr/widgets/keypad_row.dart';
import 'package:calculatorr/widgets/number_button.dart';
import 'package:calculatorr/widgets/operator_button.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int? firstOperand;
  int? secondOperand;
  String? operator;
  int? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Align(
          alignment: Alignment.bottomRight,
          child: Text(_buildDisplayText()),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            KeypadRow(
              children: [
                NumberButton(number: 7, onNumberPressed: numberPressed),
                NumberButton(number: 8, onNumberPressed: numberPressed),
                NumberButton(number: 9, onNumberPressed: numberPressed),
                OperatorButton(
                    operator: '*', onOperatorPressed: operatorPressed)
              ],
            ),
            KeypadRow(
              children: [
                NumberButton(number: 4, onNumberPressed: numberPressed),
                NumberButton(number: 5, onNumberPressed: numberPressed),
                NumberButton(number: 6, onNumberPressed: numberPressed),
                OperatorButton(
                    operator: '/', onOperatorPressed: operatorPressed)
              ],
            ),
            KeypadRow(
              children: [
                NumberButton(number: 1, onNumberPressed: numberPressed),
                NumberButton(number: 2, onNumberPressed: numberPressed),
                NumberButton(number: 3, onNumberPressed: numberPressed),
                OperatorButton(
                    operator: '+', onOperatorPressed: operatorPressed)
              ],
            ),
            KeypadRow(
              children: [
                CalculateResultButton(onCalculateResult: calculateResult),
                NumberButton(number: 0, onNumberPressed: numberPressed),
                ClearButton(onClear: clearCalculation),
                OperatorButton(
                    operator: '-', onOperatorPressed: operatorPressed)
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _buildDisplayText() {
    if (result != null) return '$result';
    if (secondOperand != null) return '$firstOperand$operator$secondOperand';
    if (operator != null) return '$firstOperand$operator';
    if (firstOperand != null) return '$firstOperand';
    return '0';
  }

  void numberPressed(int numberBeingPressed) {
    if (firstOperand == null) {
      setState(() {
        firstOperand = numberBeingPressed;
      });
      return;
    }

    if (operator == null) {
      setState(() {
        firstOperand = int.parse('$firstOperand$numberBeingPressed');
      });
      return;
    }

    if (secondOperand == null) {
      setState(() {
        secondOperand = numberBeingPressed;
      });
      return;
    }

    setState(() {
      secondOperand = int.parse('$secondOperand$numberBeingPressed');
    });
  }

  void operatorPressed(String operator) {
    setState(() {
      this.operator = operator;
    });
  }

  void calculateResult() {
    if (secondOperand == null) return;
    switch (operator) {
      case '+':
        add();
        break;
      case '-':
        subtract();
        break;
      case '*':
        multiply();
        break;
      case '/':
        divide();
        break;
    }
  }

  void add() {
    setState(() {
      result = firstOperand! + secondOperand!;
    });
  }

  void subtract() {
    setState(() {
      result = firstOperand! - secondOperand!;
    });
  }

  void divide() {
    setState(() {
      result = firstOperand! ~/ secondOperand!;
    });
  }

  void multiply() {
    setState(() {
      result = firstOperand! * secondOperand!;
    });
  }

  void clearCalculation() {
    setState(() {
      firstOperand = null;
      secondOperand = null;
      operator = null;
    });
  }
}
