import 'package:bike_riders/core/models/group.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:bike_riders/core/app/app.locator.dart';
import 'package:bike_riders/core/app/app.router.dart';
import 'package:bike_riders/core/services/auth_service.dart';
import 'package:bike_riders/core/services/firestore_service.dart';

class GroupsViewModel extends BaseViewModel {
  final _firestoreService = locator<FirestoreService>();
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();

  List<Group> groups = [];

  Future<void> fetchGroups() async {
    setBusy(true);
    groups = await _firestoreService.getAllGroups();
    setBusy(false);
  }

  void logout() {
    _authService.logout();
    _navService.replaceWith(Routes.onBoardingView);
  }
}
