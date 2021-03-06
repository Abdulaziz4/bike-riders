import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/group_creation/components/emoji_picker.dart';
import 'package:bike_riders/ui/group_creation/components/date_time_picking_section.dart';
import 'package:bike_riders/ui/group_creation/components/location_picking_section.dart';
import 'package:bike_riders/ui/group_creation/components/ride_level_dropdown.dart';
import 'package:bike_riders/ui/group_creation/viewmodels/group_creation_viewmodel.dart';
import 'package:bike_riders/ui/shared/custom_button.dart';
import 'package:bike_riders/ui/shared/input_field.dart';
import 'package:bike_riders/ui/group_creation/components/distance_slider.dart';
import 'package:bike_riders/ui/group_creation/components/participents_slider.dart';
import 'package:bike_riders/ui/shared/busy_overlay.dart';

class GroupCreationView extends StatefulWidget {
  const GroupCreationView({Key? key}) : super(key: key);

  @override
  State<GroupCreationView> createState() => _GroupCreationViewState();
}

class _GroupCreationViewState extends State<GroupCreationView> {
  double value = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Group"),
      ),
      body: ViewModelBuilder<GroupCreationViewModel>.reactive(
          viewModelBuilder: () => GroupCreationViewModel(),
          builder: (context, viewmodel, _) {
            return BusyOverlay(
              isBusy: viewmodel.isBusy,
              child: Form(
                key: viewmodel.formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            EmojiPicker(
                              onSave: viewmodel.saveEmoji,
                            ),
                            SizedBox(
                              width: kDefaultPadding / 2,
                            ),
                            Expanded(
                              child: InputField(
                                label: "Title",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter a title.";
                                  }
                                  return null;
                                },
                                onSave: viewmodel.saveTitle,
                                hint: "Enter the title",
                              ),
                            ),
                          ],
                        ),
                        InputField(
                          validator: (_) {},
                          onSave: viewmodel.saveDesc,
                          label: "Description",
                          hint: "Describe the ride",
                          numOfLines: 3,
                        ),
                        RideLevelDropdown(onSave: viewmodel.saveLevel),
                        ParticipentsSlider(
                          value: viewmodel.participentsNumber,
                          onChange: viewmodel.saveParticipentsNumber,
                        ),
                        DistanceSlider(
                          value: viewmodel.distance,
                          onChange: viewmodel.saveDistance,
                        ),
                        RideDateTimePickingSection(
                          startTime: viewmodel.startTime,
                          endTime: viewmodel.endTime,
                          saveDate: viewmodel.saveDate,
                          saveEndTime: viewmodel.saveEndTime,
                          saveStartTime: viewmodel.saveStartTime,
                        ),
                        LocationPickingSection(
                          saveLocation: viewmodel.saveLocation,
                          showLocationNotPickedError:
                              viewmodel.showLocationError,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomButton(
                            size: Size(300, 40),
                            onPress: viewmodel.validateAndSubmitForm,
                            text: "Create Group",
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
