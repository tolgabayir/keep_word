import 'package:get/route_manager.dart';
import 'package:keep_word/routes/routes.dart';
import 'package:keep_word/view/home/home_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: (() => const HomePage()))
  ];
}
