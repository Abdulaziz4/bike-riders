import 'package:bike_riders/core/app/utils/location_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:bike_riders/core/app/app.locator.dart';
import 'package:bike_riders/core/models/group.dart';
import 'package:bike_riders/core/services/firestore_service.dart';
import 'package:flutter/material.dart';

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
  final _navService = locator<NavigationService>();

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

  Future<void> submit() async {
    setBusy(true);
    String lcoationPreview =
        LocationHelper.generateLocationPreviewImage(location: location!);
    String address = await LocationHelper.addressFromLatLong(location!);
    final group = Group(
        emoji: emoji,
        title: title,
        description: description,
        level: level!,
        participents: participentsNumber,
        distance: distance,
        date: date!,
        startTime: startTime,
        endTime: endTime,
        location: location!,
        address: address,
        locationPreview: lcoationPreview);
    await _firestoreService.createGroup(group);
    _navService.back();
    setBusy(false);
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
