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
    return Row(
      children: [
        CircleAvatar(
            backgroundColor: AppColors.mainColor,
            radius: 16,
            child: Icon(
              icon,
              color: AppColors.white,
            )),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            width: 70.w,
            child: Text(title)),
        const Expanded(
          child: Material(
              elevation: 10.0,
              shadowColor: AppColors.greyLight,
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    // focusedBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(color: AppColors.greyLight)),
                    // enabledBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(color: AppColors.greyLight)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.greyLight))),
              )),
        ),
      ],
    );
  }
}
