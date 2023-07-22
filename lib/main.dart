import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controller/gender_selection_controller.dart';
import 'package:getx_project/view/commponent/mytheme.dart';
import 'package:getx_project/view/commponent/welcome_Page.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  GenderSelectionController genderSelectionController =
      Get.put(GenderSelectionController());
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkThem(context),
      title: 'Flutter Demo',
      home: welcomePage(),
    );
  }
}
