import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/group_creation/components/emoji_picker.dart';
import 'package:bike_riders/ui/group_creation/components/date_time_picking_section.dart';
import 'package:bike_riders/ui/group_creation/components/location_picking_section.dart';
import 'package:bike_riders/ui/shared/input_field.dart';

import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  EmojiPicker(),
                  SizedBox(
                    width: kDefaultPadding / 2,
                  ),
                  Expanded(
                    child: InputField(
                      validator: (_) {},
                      onSave: (_) {},
                      hint: "Title",
                    ),
                  ),
                ],
              ),
              InputField(
                validator: (_) {},
                onSave: (_) {},
                hint: "Describe the ride",
                numOfLines: 3,
              ),
              InputField(
                validator: (_) {},
                onSave: (_) {},
                hint: "Number of participents",
              ),
              InputField(
                validator: (_) {},
                onSave: (_) {},
                hint: "Distance in KM",
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(enabledBorder: InputBorder.none),
                  hint: Text(
                    "Level",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  // value: "Beginner",
                  dropdownColor: kAltColor,
                  onSaved: (_) {},
                  onChanged: (_) {},
                  items: const [
                    DropdownMenuItem(
                      child: Text("Beginner"),
                      value: "Beginner",
                    ),
                    DropdownMenuItem(
                      child: Text("Intermediate"),
                      value: "Intermediate",
                    ),
                    DropdownMenuItem(
                      child: Text("Hardcore"),
                      value: "Hardcore",
                    ),
                  ],
                ),
              ),
              RideDateTimePickingSection(),
              LocationPickingSection(),
            ],
          ),
        ),
      ),
    );
  }
}
