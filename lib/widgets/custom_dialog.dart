import 'dart:developer';

import 'package:birdeyes/core/style/text_style.dart';
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
    final deviceWidth = MediaQuery.of(context).size.width;
    log(orientation.toString());
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  orientation == Orientation.landscape ? deviceWidth * 0.2 : 16,
              vertical: deviceHeight * 0.19),
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned(
                  top: 15.h,
                  left: 0,
                  right: 0,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          color: AppColors.white,
                          height: 555.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 15.h),
                                  color: AppColors.greyLight,
                                  child: Text(
                                    title,
                                    style: AppTextStyle.heaerTextBold,
                                    textAlign: TextAlign.center,
                                  )),
                              Flexible(child: child),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "حفظ",
                                    style: AppTextStyle.bodyTextLight,
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.mainColor),
                                    foregroundColor: MaterialStateProperty.all(
                                        AppColors.white),
                                  )),
                              const SizedBox(
                                height: 16,
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
        ),
      ],
    );
  }
}
