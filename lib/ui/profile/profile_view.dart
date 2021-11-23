import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/groups/components/group_item.dart';
import 'package:bike_riders/ui/profile/components/user_info.dart';
import 'package:bike_riders/ui/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      onModelReady: (model) => model.fetchUserGroups(),
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
