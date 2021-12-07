import 'dart:async';

import 'package:bike_riders/core/app/utils/logger.dart';
import 'package:bike_riders/core/models/group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class FirestoreService {
  final Logger _logger = getLogger("FirestoreService");

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createGroup(Group group) async {
    await _firestore.collection("groups").add(group.toJson());
  }

  StreamController<List<Group>> groupsController =
      BehaviorSubject<List<Group>>();

  Stream<List<Group>> groupsStream() {
    final snapshot = _firestore.collection("groups").snapshots();

    snapshot.listen((list) {
      List<Group> groups = list.docs
          .map((group) => Group.fromMap(group.data(), group.id))
          .toList();
      groupsController.add(groups);
    });
    return groupsController.stream;
    // return groupsDoc.docs.map((group) => Group.fromMap(group.data())).toList();
  }

  StreamController<List<Group>> userGroups = BehaviorSubject<List<Group>>();

  Stream<List<Group>> userGroupsStream(String userId) {
    final snapshot = _firestore
        .collection("groups")
        .where("uid", isEqualTo: userId)
        .snapshots();

    snapshot.listen((list) {
      List<Group> groups = list.docs
          .map((group) => Group.fromMap(group.data(), group.id))
          .toList();
      groupsController.add(groups);
    });
    return groupsController.stream;
    // return groupsDoc.docs.map((group) => Group.fromMap(group.data())).toList();
  }

  Future<List<Group>> getAllGroups() async {
    final groupsDoc = await _firestore.collection("groups").get();

    return groupsDoc.docs
        .map((group) => Group.fromMap(group.data(), group.id))
        .toList();
  }

  Future<List<Group>> getUserGroups(String userId) async {
    final groupsDoc = await _firestore
        .collection("groups")
        .where("uid", isEqualTo: userId)
        .get();

    return groupsDoc.docs
        .map((group) => Group.fromMap(group.data(), group.id))
        .toList();
  }

  Future<void> deleteGroup(String id) async {
    await _firestore.collection("groups").doc(id).delete();
  }
}
