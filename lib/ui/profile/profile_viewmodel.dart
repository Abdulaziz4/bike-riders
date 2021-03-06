import 'package:bike_riders/core/app/app.locator.dart';
import 'package:bike_riders/core/app/app.router.dart';
import 'package:bike_riders/core/models/group.dart';
import 'package:bike_riders/core/services/auth_service.dart';
import 'package:bike_riders/core/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// class ProfileViewModel extends BaseViewModel {
//   final _firestoreService = locator<FirestoreService>();
//   final _authService = locator<AuthService>();

//   List<Group> groups = [];
//   Future<void> fetchUserGroups() async {
//     setBusy(true);
//     final uid = _authService.user!.uid;
//     groups = await _firestoreService.getUserGroups(uid);
//     setBusy(false);
//   }

//   String getUserEmail() => _authService.user!.email!;
// }

class ProfileViewModel extends StreamViewModel<List<Group>> {
  late String userId;

  final _firestoreService = locator<FirestoreService>();
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();
  List<Group> groups = [];

  String getUserEmail() => _authService.user!.email!;

  Future<void> deleteGroup(String id) async {
    setBusy(true);
    await _firestoreService.deleteGroup(id);
    setBusy(false);
  }

  void logout() {
    _authService.logout();
    _navService.replaceWith(Routes.onBoardingView);
  }

  @override
  void onData(List<Group>? newGroups) {
    super.onData(data);
    setBusy(false);
    if (newGroups != null) {
      groups = newGroups;
    }
  }

  @override
  void onSubscribed() {
    setBusy(true);
    super.onSubscribed();
  }

  @override
  Stream<List<Group>> get stream =>
      _firestoreService.userGroupsStream(_authService.user!.uid);
}
