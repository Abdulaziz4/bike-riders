import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/groups/components/group_item.dart';
import 'package:bike_riders/ui/profile/components/user_info.dart';
import 'package:bike_riders/ui/profile/profile_viewmodel.dart';
import 'package:bike_riders/ui/shared/custom_progress_indicator.dart';
import 'package:bike_riders/ui/shared/no_groups_warning.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, viewmodel, _) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: kDefaultPadding,
            left: kDefaultPadding,
            right: kDefaultPadding,
          ),
          child: Column(
            children: [
              UserInfo(
                email: viewmodel.getUserEmail(),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Row(
                children: [
                  Text(
                    "My Groups",
                    style: kVeryLargeText.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              if (viewmodel.isBusy) CustomProgressIndicator(),
              if (viewmodel.groups.isEmpty && !viewmodel.isBusy)
                Expanded(
                  child: NoGroupsWarning(),
                ),
              if (viewmodel.groups.isNotEmpty)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: kDefaultPadding / 1.5),
                    child: SingleChildScrollView(
                      child: Column(
                        children: viewmodel.groups
                            .map((group) => GroupItem(group: group))
                            .toList(),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
