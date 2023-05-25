import 'package:keep_word/base/service/base_service.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthService extends BaseService {
  Future<bool> authenticateUser() async {
    //initialize Local Authentication plugin.
    final LocalAuthentication localAuthentication = LocalAuthentication();
    //status of authentication.
    bool isAuthenticated = false;
    //check if device supports biometrics authentication.
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    //check if user has enabled biometrics.
    //check
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    //if device supports biometrics and user has enabled biometrics, then authenticate.
    if (isBiometricSupported && canCheckBiometrics) {
      try {
        isAuthenticated = await localAuthentication.authenticate(
            localizedReason: 'Scan your fingerprint to authenticate',
            options: const AuthenticationOptions(
                biometricOnly: true, useErrorDialogs: true, stickyAuth: true));
      } catch (e) {
        print(e);
      }
    }
    return isAuthenticated;
  }
}
