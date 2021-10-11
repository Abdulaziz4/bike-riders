import 'package:bike_riders/ui/groups/groups_view.dart';
import 'package:bike_riders/ui/nav_bar/auth_state_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NavigationBarController extends StatelessWidget {
  const NavigationBarController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthStateViewModel>.reactive(
        viewModelBuilder: () => AuthStateViewModel(),
        builder: (context, viewmodel, _) {
          return GroupsView();
        });
  }
}
