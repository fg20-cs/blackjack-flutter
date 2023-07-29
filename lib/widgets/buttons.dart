import 'package:flutter/material.dart';
import '../styles/styles.dart';

class CustomButton extends StatelessWidget {

  final void Function() onPressed;
  final String label;

  const CustomButton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color(0XFFEC625F),
      child: Text(label, style: buttonStyle),

    );
  }
}
