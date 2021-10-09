import 'package:flutter/material.dart';

import 'package:bike_riders/core/app/constants.dart';

class AuthErrorMessage extends StatelessWidget {
  final String? message;
  const AuthErrorMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message == null) {
      return SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        message ?? "",
        style: kSmallText.copyWith(color: Colors.red),
      ),
    );
  }
}
