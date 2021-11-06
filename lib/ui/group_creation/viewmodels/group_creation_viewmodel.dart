import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class GroupCreationViewModel extends BaseViewModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String emoji = "";
  String title = "";
  String description = "";
  int participentsNumber = 0;
  int distance = 0;

  String? level;

  DateTime? date;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  LatLng? location;

  void validateAndSubmitForm() {
    formKey.currentState?.save();
    print(emoji);
    print(title);
    print(description);
    print(participentsNumber);
    print(distance);
    print(level);
    print(date);
    print(startTime);
    print(endTime);
    print(location);
  }

  void saveLocation(LatLng location) {
    this.location = location;
  }

  void saveEndTime(TimeOfDay time) {
    endTime = time;
    notifyListeners();
  }

  void saveStartTime(TimeOfDay time) {
    startTime = time;
    notifyListeners();
  }

  void saveDate(DateTime pickedDate) {
    date = pickedDate;
  }

  void saveLevel(String level) {
    this.level = level;
  }

  void saveDistance(String distance) {
    this.distance = int.parse(distance);
  }

  void saveParticipentsNumber(String participentsNum) {
    participentsNumber = int.parse(participentsNum);
  }

  void saveDesc(String description) {
    this.description = description;
  }

  void saveTitle(String title) {
    this.title = title;
  }

  void saveEmoji(String emoji) {
    this.emoji = emoji;
  }
}
