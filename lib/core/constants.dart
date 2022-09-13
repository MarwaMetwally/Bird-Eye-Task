import 'package:birdeyes/core/style/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_dialog.dart';

class Constants {
  static const String imagePath = "assets/svg_icons/";

  static const baseUrl = "https://birdeyesa.com:1030/api";
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static snackBar(String message) {
    ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
        SnackBar(backgroundColor: AppColors.mainColor, content: Text(message)));
  }

  static showCustomDialog(Widget child, String title) {
    return showDialog(
        context: navigatorKey.currentState!.context,
        builder: (ctx) {
          return CustomDialog(child: child, title: title);
        });
  }
}
