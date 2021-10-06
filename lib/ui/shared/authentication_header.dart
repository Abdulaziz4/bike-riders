import 'package:bike_riders/core/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class AuthenticationHeader extends StatelessWidget {
  final String text;
  const AuthenticationHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset("assets/shapes/top_curve.svg"),
        ),
        Positioned(
          left: kDefaultPadding * 2,
          bottom: 100,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
