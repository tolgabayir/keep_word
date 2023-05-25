import 'package:get/instance_manager.dart';
import 'package:keep_word/controllers/home/home_page_controller.dart';
import 'package:keep_word/services/storage/shared_preferences_storage_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
    Get.put<LocalStorageManager>(LocalStorageManager.instance);
  }
}
