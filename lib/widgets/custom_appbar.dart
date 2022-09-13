import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../core/constants.dart';
import '../core/paths.dart';
import '../core/style/colors.dart';
import '../core/style/text_style.dart';

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
          height: 90,
        ),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Material(
            shape: CustomShapeBorder(),
            color: AppColors.mainColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
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
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Mustafa",
                      style: AppTextStyle.displayMedium
                          .copyWith(color: AppColors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "بيرد اي",
                      style: AppTextStyle.displayMedium
                          .copyWith(color: AppColors.white),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      Paths.birdEye,
                      width: 27,
                      height: 27,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SvgPicture.asset(
                      Paths.menu,
                      width: 28,
                      height: 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: deviceWidth * 0.5 - 30,
          child: InkWell(
            onTap: () {
              Constants.showCustomDialog(
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.mainColor)),
                    margin:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16.h),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                  width: 60,
                                ),
                                const SizedBox(
                                  height: 10,
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
                                  width: 60,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("Gallery")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  "اضافة صوره");
            },
            child: CircleAvatar(
                backgroundColor: AppColors.white,
                child: SvgPicture.asset(
                  Paths.notification,
                  width: 20,
                  height: 25,
                )),
          ),
        ),
      ],
    );
  }
}

class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    print("ttt");
    print(rect.center.dx);

    double x = 150, y = 40, r = 0.5;
    Path path = Path()
      ..addRRect(RRect.fromRectAndCorners(rect))
      ..moveTo(rect.center.dx + 65, rect.bottomCenter.dy)
      ..relativeQuadraticBezierTo(
          ((-x / 2) + (x / 6)) * (1 - r), 0, -x / 2 * r, y * r)
      ..relativeQuadraticBezierTo(
          -x / 6 * r, y * (1 - r), -x / 2 * (1 - r), y * (1 - r))
      ..relativeQuadraticBezierTo(
          ((-x / 2) + (x / 6)) * (1 - r), 0, -x / 2 * (1 - r), -y * (1 - r))
      ..relativeQuadraticBezierTo(-x / 6 * r, -y * r, -x / 2 * r, -y * r);
    path.close();
    return path;
  }
}
