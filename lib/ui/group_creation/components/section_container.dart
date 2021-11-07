import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/core/app/utils/colors_helper.dart';
import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final EdgeInsetsGeometry? margin;
  const SectionContainer(
      {Key? key, required this.child, required this.height, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      margin: margin ?? EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: brighten(kPrimaryColor, 8),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          width: 0.2,
          color: Colors.white,
        ),
      ),
      child: child,
    );
  }
}
