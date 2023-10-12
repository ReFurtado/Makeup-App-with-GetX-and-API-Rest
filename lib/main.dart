// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeup_app/data/repository/http_bindings.dart';
import 'package:makeup_app/screens/home_page.dart';
import 'package:makeup_app/screens/welcome_page.dart';

import 'data/repository/http_controller.dart';
import 'data/repository/http_repository.dart';

void main() {
  final _httpRepository = HttpRepository();
  Get.put(HttpController(_httpRepository));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => WelcomePage()),
        GetPage(
          name: '/home/', 
          page: () => HomePage(),
          binding: HttpBindings(),
        ),
        
      ],
    );
  }
}
