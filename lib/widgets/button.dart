import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.backgroundColor = Colors.white,
      this.foregroundColor = Colors.black});

  final String label;
  final Function() onTap;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1, 1), color: Colors.black26, blurRadius: 0.5)
            ]),
        child: Text(
          label,
          style: TextStyle(color: foregroundColor, fontSize: 18),
        ),
      ),
    );
  }
}
