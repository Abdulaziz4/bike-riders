import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Group {
  final String title;
  final String emoji;
  final String description;
  final String level;
  final int participents;
  final double distance;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final LatLng location;

  Group({
    required this.title,
    required this.emoji,
    required this.description,
    required this.level,
    required this.participents,
    required this.distance,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'emoji': emoji,
      'description': description,
      'level': level,
      'participents': participents,
      'distance': distance,
      'date': date.millisecondsSinceEpoch,
      'startTime': timeOfDayToString(startTime),
      'endTime': timeOfDayToString(endTime),
      'location': location.toJson(),
    };
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      title: map['title'],
      emoji: map["emoji"],
      description: map['description'],
      level: map['level'],
      participents: map['participents'],
      distance: map['distance'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      startTime: stringToTimeOfDay(map['startTime']),
      endTime: stringToTimeOfDay(map['endTime']),
      location: LatLng.fromJson(map['location'])!,
    );
  }

  factory Group.fromJson(String source) => Group.fromMap(json.decode(source));

  static TimeOfDay stringToTimeOfDay(String tod) {
    return TimeOfDay(
        hour: int.parse(tod.split(":")[0]),
        minute: int.parse(tod.split(":")[1]));
  }

  String timeOfDayToString(TimeOfDay time) {
    return "${time.hour}:${time.minute}";
  }
}
