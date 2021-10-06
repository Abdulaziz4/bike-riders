import 'package:bike_riders/core/app/utils/auth_exception.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  Future<void> login(String email, String password) async {
    try {
      setBusy(true);
    } on AuthException catch (exp) {
    } catch (e) {
    } finally {
      setBusy(false);
    }
  }
}
