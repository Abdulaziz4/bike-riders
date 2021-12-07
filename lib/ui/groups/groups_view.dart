import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/groups/components/group_item.dart';
import 'package:bike_riders/ui/groups/groups_viewmodel.dart';
import 'package:bike_riders/ui/shared/custom_progress_indicator.dart';
import 'package:bike_riders/ui/shared/no_groups_warning.dart';

// add stram to groups view and profile groups and check notifications and android layout
class GroupsView extends StatelessWidget {
  const GroupsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GroupsViewModel>.reactive(
        viewModelBuilder: () => GroupsViewModel(),
        builder: (context, viewmodel, _) {
          return SafeArea(
            child: Scaffold(
              body: viewmodel.isBusy
                  ? Center(
                      child: CustomProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                        top: kDefaultPadding,
                        left: kDefaultPadding,
                        right: kDefaultPadding,
                      ),
                      child: viewmodel.groups.isEmpty
                          ? NoGroupsWarning()
                          : SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: viewmodel.groups
                                    .map((group) => GroupItem(group: group))
                                    .toList(),
                              ),
                            ),
                    ),
            ),
          );
        });
  }
}
