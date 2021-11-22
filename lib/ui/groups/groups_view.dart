import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/groups/components/group_item.dart';
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
        onModelReady: (model) => model.fetchGroups(),
        builder: (context, viewmodel, _) {
          return SafeArea(
            child: Scaffold(
              body: viewmodel.isBusy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: SingleChildScrollView(
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
