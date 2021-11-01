import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/group_creation/components/emoji_picker.dart';
import 'package:bike_riders/ui/group_creation/components/date_time_picking_section.dart';
import 'package:bike_riders/ui/shared/input_field.dart';

import 'package:flutter/material.dart';

class GroupCreationView extends StatefulWidget {
  const GroupCreationView({Key? key}) : super(key: key);

  @override
  State<GroupCreationView> createState() => _GroupCreationViewState();
}

class _GroupCreationViewState extends State<GroupCreationView> {
  late TextEditingController _emojiController;
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _emojiController = TextEditingController();
    _focusNode = FocusNode()
      ..addListener(() {
        _focusNode.unfocus();
      });
  }

  bool _showEmojiPicker = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Group"),
      ),
      body: Padding(
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
            RideDateTimePickingSection(),
          ],
        ),
      ),
    );
  }

  void toggleEmojiPicker() {
    setState(() {
      _showEmojiPicker = !_showEmojiPicker;
    });
  }
}
