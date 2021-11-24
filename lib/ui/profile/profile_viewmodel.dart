import 'package:bike_riders/core/app/app.locator.dart';
import 'package:bike_riders/core/models/group.dart';
import 'package:bike_riders/core/services/auth_service.dart';
import 'package:bike_riders/core/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  final _firestoreService = locator<FirestoreService>();
  final _authService = locator<AuthService>();

  List<Group> groups = [];
  Future<void> fetchUserGroups() async {
    setBusy(true);
    final uid = _authService.user!.uid;
    groups = await _firestoreService.getUserGroups(uid);
    print(uid);
    setBusy(false);
  }

  String getUserEmail() => _authService.user!.email!;
}
