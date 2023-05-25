import 'package:get/route_manager.dart';
import 'package:keep_word/base/controller/base_controller.dart';
import 'package:keep_word/configuration/routes/routes.dart';
import 'package:keep_word/services/auth/local_auth_service.dart';

class InitialPageController extends BaseController {
  final LocalAuthService _authService = LocalAuthService();
  @override
  void onInit() async {
    super.onInit();
    await _authService.authenticateUser()
        ? Get.offNamed(
            Routes.HOME,
          )
        : Get.toNamed(Routes.INITIAL);
  }
}
