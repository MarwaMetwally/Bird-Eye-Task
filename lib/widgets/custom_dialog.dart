// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/style/colors.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.child,
    required this.title,
  }) : super(key: key);
  final Widget child;
  final String title;
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final deviceHeight = MediaQuery.of(context).size.height;
    log(orientation.toString());
    return Stack(
      children: [
        Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Stack(
            children: [
              Container(
                height: orientation == Orientation.portrait
                    ? deviceHeight * 0.48
                    : deviceHeight * 0.82,
                color: Colors.transparent,
              ),
              Positioned(
                top: 12.h,
                left: 0,
                right: 0,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        color: AppColors.white,
                        height: orientation == Orientation.portrait
                            ? deviceHeight * 0.45
                            : deviceHeight * 0.72,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                color: AppColors.greyLight,
                                child: Text(
                                  title,
                                  textAlign: TextAlign.center,
                                )),
                            Flexible(child: child),
                            TextButton(
                                onPressed: () {},
                                child: const Text("Add"),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.mainColor),
                                  foregroundColor: MaterialStateProperty.all(
                                      AppColors.white),
                                )),
                            SizedBox(
                              height: 5.h,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: AppColors.red,
                  radius: 16,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
