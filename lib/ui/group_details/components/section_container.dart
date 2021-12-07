import 'package:flutter/material.dart';

import 'package:bike_riders/core/app/constants.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  const SectionContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          width: 1,
          color: kAltColor,
        ),
      ),
      height: 200,
      width: double.infinity,
      child: child,
    );
  }
}
