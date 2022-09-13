import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../core/constants.dart';
import '../core/paths.dart';
import '../core/style/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  final Function(ImageSource) onSelect;
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    final deviceHeight = MediaQuery.of(context).size.height;
    log(deviceHeight.toString());
    log(60.h.toString());
    return Stack(
      children: [
        Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 70.h),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          color: AppColors.mainColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Paths.menu,
                    width: 28,
                    height: 16,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  SvgPicture.asset(
                    Paths.birdEye,
                    width: 27,
                    height: 27,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text(
                    "Bird Eye",
                    style: TextStyle(color: AppColors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Mustafa",
                    style: TextStyle(color: AppColors.white),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                          color: AppColors.red,
                          borderRadius: BorderRadius.circular(8)),
                      child: SvgPicture.asset(
                        Paths.logout,
                        width: 20,
                        height: 15,
                      )),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: orientation == Orientation.portrait
              ? deviceWidth * 0.41
              : deviceWidth * 0.45,
          child: Container(
            padding: const EdgeInsets.all(12),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.mainColor),
            child: InkWell(
              onTap: () {
                Constants.showCustomDialog(
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.mainColor)),
                      margin: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              onSelect(ImageSource.camera);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Paths.camera,
                                  width: 70.w,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                const Text("Camera")
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              onSelect(ImageSource.gallery);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Paths.gallery,
                                  width: 70.w,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                const Text("Gallery")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    "Upload Image");
              },
              child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 17,
                  child: SvgPicture.asset(
                    Paths.notification,
                    width: 20,
                    height: 25,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
