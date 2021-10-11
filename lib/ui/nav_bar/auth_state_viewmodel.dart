import 'package:bike_riders/core/app/app.locator.dart';
import 'package:bike_riders/core/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class AuthStateViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_authService];
}
