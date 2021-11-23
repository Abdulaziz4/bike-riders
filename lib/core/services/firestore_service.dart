import 'package:bike_riders/core/app/utils/logger.dart';
import 'package:bike_riders/core/models/group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class FirestoreService {
  final Logger _logger = getLogger("FirestoreService");

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createGroup(Group group) async {
    await _firestore.collection("groups").add(group.toJson());
  }

  Future<List<Group>> getAllGroups() async {
    final groupsDoc = await _firestore.collection("groups").get();

    return groupsDoc.docs.map((group) => Group.fromMap(group.data())).toList();
  }

  Future<List<Group>> getUserGroups(String userId) async {
    final groupsDoc = await _firestore
        .collection("groups")
        .where("uid", isEqualTo: userId)
        .get();

    return groupsDoc.docs.map((group) => Group.fromMap(group.data())).toList();
  }
}
