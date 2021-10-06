import 'package:flutter/material.dart';

import 'package:bike_riders/core/app/constants.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPress;
  final String text;
  final Color backgroundColor;
  final Size? size;
  const CustomButton({
    Key? key,
    required this.onPress,
    required this.text,
    this.backgroundColor = kSecondryColor,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        fixedSize: size,
      ),
      child: const Text(
        "Login",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
