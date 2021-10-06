import 'package:flutter/material.dart';

import 'package:bike_riders/core/app/constants.dart';

class AuthenticationInstruction extends StatelessWidget {
  final String hintText;
  final String buttonText;
  final void Function() onPressed;
  const AuthenticationInstruction({
    Key? key,
    required this.buttonText,
    required this.hintText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      child: Column(
        children: [
          Text(
            hintText,
            style: kMediumText,
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.only(top: 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: kMediumText.copyWith(
                color: kSecondryColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
