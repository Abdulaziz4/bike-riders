import 'package:flutter/material.dart';

import 'package:bike_riders/core/app/constants.dart';

class NoGroupsWarning extends StatelessWidget {
  const NoGroupsWarning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: MediaQuery.of(context).size.width),
        Icon(
          Icons.report_problem_rounded,
          color: Colors.yellow[300],
          size: 65,
        ),
        Text(
          "No groups created yet!",
          style: kVeryLargeText,
        ),
      ],
    );
  }
}
