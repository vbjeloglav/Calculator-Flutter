import 'package:flutter/material.dart';

class KeypadRow extends StatelessWidget {
  const KeypadRow({required this.children, super.key});

  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: children,
      ),
    );
  }
}
