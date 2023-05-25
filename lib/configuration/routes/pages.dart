import 'package:get/route_manager.dart';
import 'package:keep_word/bindings/home/home_binding.dart';
import 'package:keep_word/bindings/initial/initial_binding.dart';
import 'package:keep_word/configuration/routes/routes.dart';

import 'package:keep_word/views/home/home_page.dart';
import 'package:keep_word/views/initial/initial_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: (() => const InitialPage()),
      binding: InitialBinding(),
    ),
    GetPage(
        name: Routes.HOME,
        page: (() => const HomePage()),
        binding: HomeBinding(),
        transition: Transition.noTransition)
  ];
}
