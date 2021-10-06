import 'package:flutter/material.dart';

import 'package:bike_riders/core/app/constants.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPress;
  final String text;
  final TextStyle textStyle;
  final Color backgroundColor;
  final Size? size;

  const CustomButton({
    Key? key,
    required this.onPress,
    required this.text,
    this.backgroundColor = kSecondryColor,
    this.size,
    this.textStyle = kMediumText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        fixedSize: size,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle,
      ),
    );
  }
}
