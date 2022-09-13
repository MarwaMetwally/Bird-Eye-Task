import 'dart:io';
import 'package:birdeyes/core/constants.dart';
import 'package:birdeyes/core/theme.dart';
import 'package:birdeyes/pages/all_customers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dependency_injection.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1200),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bird Eye',
        theme: AppTheme.appThemeData,
        navigatorKey: Constants.navigatorKey,
        initialBinding: CustomerBinding(),
        home: const SafeArea(child: ALlCustomersScreen()),
      ),
    );
  }
}
