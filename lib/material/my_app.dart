import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:keep_word/configuration/routes/pages.dart';
import 'package:keep_word/configuration/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
    );
  }
}
