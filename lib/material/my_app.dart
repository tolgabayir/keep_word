import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:keep_word/routes/pages.dart';
import 'package:keep_word/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
    );
  }
}
