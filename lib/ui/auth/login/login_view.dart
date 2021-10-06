import 'package:bike_riders/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextFormField(),
            CustomButton(
              text: "Login",
              onPress: () {},
              size: const Size(120, 40),
            ),
          ],
        ),
      ),
    );
  }
}
