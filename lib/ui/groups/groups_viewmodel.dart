import 'package:bike_riders/core/app/app.locator.dart';
import 'package:bike_riders/core/app/app.router.dart';
import 'package:bike_riders/core/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GroupsViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();

  void logout() {
    _authService.logout();
    _navService.replaceWith(Routes.onBoardingView);
  }
}
