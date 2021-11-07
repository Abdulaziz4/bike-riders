import 'package:bike_riders/core/app/app.locator.dart';
import 'package:bike_riders/core/models/group.dart';
import 'package:bike_riders/core/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class GroupCreationViewModel extends BaseViewModel {
  GroupCreationViewModel() {
    startTime = TimeOfDay.now();
    // Add one hour to start time
    endTime = startTime.replacing(
      hour: startTime.hour + 1,
      minute: startTime.minute,
    );
  }
  final _firestoreService = locator<FirestoreService>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String emoji = "";
  String title = "";
  String description = "";
  int participentsNumber = 10;
  double distance = 50;

  String? level;

  DateTime? date;
  late TimeOfDay startTime;
  late TimeOfDay endTime;

  LatLng? location;

  bool showLocationError = false;

  void submit() {
    final group = Group(
      id: "",
      title: title,
      description: description,
      level: level!,
      participents: participentsNumber,
      distance: distance,
      date: date!,
      startTime: startTime,
      endTime: endTime,
      location: location!,
    );
    _firestoreService.createGroup(group);
  }

  void validateAndSubmitForm() {
    showLocationError = false; // reset error
    notifyListeners();
    bool isValid = formKey.currentState?.validate() ?? true;
    if (location == null) {
      showLocationError = true;
      notifyListeners();
    }
    if (isValid && !showLocationError) {
      formKey.currentState?.save();
      submit();
    }

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
    notifyListeners();
  }

  void saveDistance(double distance) {
    this.distance = distance;
    notifyListeners();
  }

  void saveParticipentsNumber(int participentsNum) {
    participentsNumber = participentsNum;
    notifyListeners();
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

  TimeOfDay addHour(int hour) {
    TimeOfDay currentTime = TimeOfDay.now();
    return currentTime.replacing(
      hour: currentTime.hour + hour,
      minute: currentTime.minute,
    );
  }
}
