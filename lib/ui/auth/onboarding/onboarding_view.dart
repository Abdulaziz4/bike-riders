import 'package:bike_riders/core/app/app.locator.dart';
import 'package:bike_riders/core/app/app.router.dart';
import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/auth/login/login_view.dart';
import 'package:bike_riders/ui/shared/authentication_instructions.dart';
import 'package:bike_riders/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _navService = locator<NavigationService>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding, horizontal: kDefaultPadding * 2),
        child: Column(
          children: [
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/moving_bike.gif"),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Text(
                  "Improve your\nride",
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Spacer(
              flex: 2,
            ),
            CustomButton(
              onPress: () {
                _navService.replaceWith(Routes.signupView);
              },
              text: "Create Account",
              size: Size(220, 50),
              textStyle: kLargeText,
            ),
            AuthenticationInstructions(
              buttonText: "Log in",
              hintText: "Already have an account ?",
              onPressed: () {
                _navService.replaceWith(Routes.loginView);
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
