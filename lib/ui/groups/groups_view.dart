import 'package:bike_riders/core/app/constants.dart';
import 'package:flutter/material.dart';

class GroupsView extends StatelessWidget {
  const GroupsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome Rider",
          style: kLargeText,
        ),
      ),
    );
  }
}
