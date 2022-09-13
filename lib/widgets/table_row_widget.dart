// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:birdeyes/models/customer.dart';

import '../controllers/customer_controller.dart';
import '../core/paths.dart';
import '../core/style/colors.dart';

class TableRowWidget extends StatelessWidget {
  const TableRowWidget({
    Key? key,
    required this.customer,
    required this.index,
    required this.onDismissed,
  }) : super(key: key);
  final Customer customer;
  final int index;
  final void Function(DismissDirection)? onDismissed;
  @override
  Widget build(BuildContext context) {
    CustomerController customerController = Get.put(CustomerController());

    return index == 0
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: AutoSizeText(
                      "Name",
                      textAlign: TextAlign.center,
                      maxFontSize: 21,
                      minFontSize: 18,
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: AutoSizeText("Email",
                        maxFontSize: 21,
                        minFontSize: 18,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: AutoSizeText("Phone",
                        maxFontSize: 21,
                        minFontSize: 18,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.bold)),
                  ),
                ]),
          )
        : Dismissible(
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: AlignmentDirectional.centerEnd,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Paths.delete,
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const Text(
                    "delete",
                    style: TextStyle(color: AppColors.mainColor),
                  )
                ],
              ),
            ),
            key: Key(customerController.allCustomersList[index].id.toString()),
            onDismissed: onDismissed,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: index.isEven ? AppColors.mainColor : AppColors.greyLight,
              ),
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        customer.username ?? "user name",
                        textAlign: TextAlign.center,
                        minFontSize: 15,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: index.isEven
                                ? AppColors.greyLight
                                : AppColors.mainColor),
                      ),
                    ),
                    Expanded(
                      child: AutoSizeText(customer.email ?? "email.com",
                          minFontSize: 15,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: index.isEven
                                  ? AppColors.greyLight
                                  : AppColors.mainColor)),
                    ),
                    Expanded(
                      child: AutoSizeText(
                          customer.shippingAddress == null
                              ? "012345***"
                              : customer.shippingAddress!.phoneNumber!
                                  .replaceRange(
                                      6,
                                      customer
                                          .shippingAddress!.phoneNumber!.length,
                                      "***")
                                  .toString(),
                          minFontSize: 15,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: index.isEven
                                  ? AppColors.greyLight
                                  : AppColors.mainColor)),
                    ),
                  ]),
            ),
          );
  }
}
