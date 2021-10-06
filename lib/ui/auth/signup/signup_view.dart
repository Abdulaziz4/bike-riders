import 'package:flutter/material.dart';

import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/shared/authentication_header.dart';
import 'package:bike_riders/ui/shared/authentication_instructions.dart';
import 'package:bike_riders/ui/shared/custom_button.dart';
import 'package:bike_riders/ui/shared/input_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthenticationHeader(text: "Create\nAccount"),
          Spacer(),
          InputField(
            hint: "Email",
            validator: (_) {},
          ),
          InputField(
            hint: "Password",
            validator: (_) {},
            obscureText: true,
          ),
          InputField(
            hint: "Confirm Password",
            validator: (_) {},
            obscureText: true,
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          CustomButton(
            text: "Create Account",
            onPress: () {},
            size: const Size(200, 50),
            textStyle: TextStyle(fontSize: 19.5),
          ),
          Spacer(),
          AuthenticationInstruction(
            buttonText: "Create Account",
            hintText: "Don't have an account ?",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
