import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/groups/groups_viewmodel.dart';
import 'package:bike_riders/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class GroupsView extends StatelessWidget {
  const GroupsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GroupsViewModel>.reactive(
        viewModelBuilder: () => GroupsViewModel(),
        builder: (context, viewmodel, _) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Rider",
                    style: kLargeText,
                  ),
                  CustomButton(onPress: viewmodel.logout, text: "Log out"),
                ],
              ),
            ),
          );
        });
  }
}
