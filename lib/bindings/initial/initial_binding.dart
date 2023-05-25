import 'package:get/instance_manager.dart';
import 'package:keep_word/controllers/initial/initial_page_controller.dart';
import 'package:keep_word/services/auth/local_auth_service.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InitialPageController());
    Get.put<LocalAuthService>(LocalAuthService());
    // TODO: implement dependencies
  }
}
