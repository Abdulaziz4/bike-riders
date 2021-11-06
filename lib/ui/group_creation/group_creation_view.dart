import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/group_creation/components/emoji_picker.dart';
import 'package:bike_riders/ui/group_creation/components/date_time_picking_section.dart';
import 'package:bike_riders/ui/group_creation/components/location_picking_section.dart';
import 'package:bike_riders/ui/group_creation/components/ride_level_dropdown.dart';
import 'package:bike_riders/ui/group_creation/viewmodels/group_creation_viewmodel.dart';
import 'package:bike_riders/ui/shared/custom_button.dart';
import 'package:bike_riders/ui/shared/input_field.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class GroupCreationView extends StatefulWidget {
  const GroupCreationView({Key? key}) : super(key: key);

  @override
  State<GroupCreationView> createState() => _GroupCreationViewState();
}

class _GroupCreationViewState extends State<GroupCreationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Group"),
      ),
      body: ViewModelBuilder<GroupCreationViewModel>.reactive(
          viewModelBuilder: () => GroupCreationViewModel(),
          builder: (context, viewmodel, _) {
            return Form(
              key: viewmodel.formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          EmojiPicker(onSave: viewmodel.saveEmoji),
                          SizedBox(
                            width: kDefaultPadding / 2,
                          ),
                          Expanded(
                            child: InputField(
                              validator: (_) {},
                              onSave: viewmodel.saveTitle,
                              hint: "Title",
                            ),
                          ),
                        ],
                      ),
                      InputField(
                        validator: (_) {},
                        onSave: viewmodel.saveDesc,
                        hint: "Describe the ride",
                        numOfLines: 3,
                      ),
                      InputField(
                        validator: (_) {},
                        onSave: viewmodel.saveParticipentsNumber,
                        hint: "Number of participents",
                      ),
                      InputField(
                        validator: (_) {},
                        onSave: viewmodel.saveDistance,
                        hint: "Distance in KM",
                      ),
                      RideLevelDropdown(onSave: viewmodel.saveLevel),
                      RideDateTimePickingSection(
                        startTime: viewmodel.startTime,
                        endTime: viewmodel.endTime,
                        saveDate: viewmodel.saveDate,
                        saveEndTime: viewmodel.saveEndTime,
                        saveStartTime: viewmodel.saveStartTime,
                      ),
                      LocationPickingSection(
                        saveLocation: viewmodel.saveLocation,
                      ),
                      CustomButton(
                          onPress: viewmodel.validateAndSubmitForm,
                          text: "Submit")
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
