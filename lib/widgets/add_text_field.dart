import 'package:birdeyes/core/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/style/colors.dart';

class AddTextField extends StatelessWidget {
  const AddTextField({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.h,
      child: Row(
        children: [
          const Expanded(
            child: Material(
                elevation: 10.0,
                shadowColor: AppColors.greyLight,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.white,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.greyLight))),
                )),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              width: 246.w,
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: AppTextStyle.bodyTextLight,
              )),
          const SizedBox(
            height: 5,
          ),
          CircleAvatar(
              backgroundColor: AppColors.mainColor,
              radius: 16,
              child: Icon(
                icon,
                color: AppColors.white,
                size: 20,
              )),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
