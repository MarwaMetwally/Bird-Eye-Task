// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:birdeyes/core/helper_functions.dart';
import 'package:birdeyes/core/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:birdeyes/core/constants.dart';
import 'package:birdeyes/core/style/colors.dart';
import 'package:birdeyes/widgets/custom_appbar.dart';
import '../controllers/customer_controller.dart';
import '../core/paths.dart';
import '../widgets/add_text_field.dart';
import '../widgets/table_row_widget.dart';

class ALlCustomersScreen extends StatefulWidget {
  const ALlCustomersScreen({Key? key}) : super(key: key);

  @override
  State<ALlCustomersScreen> createState() => _ALlCustomersScreenState();
}

class _ALlCustomersScreenState extends State<ALlCustomersScreen> {
  CustomerController customerController = Get.put(CustomerController());
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    customerController.allCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          CustomAppBar(onSelect: (imagesrc) {
            HelperFunctions.onImageButtonPressed(imagesrc, _picker);
          }),
          Positioned(
            left: 0,
            right: 0,
            top: 60,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: AppColors.mainColor,
                              child: SvgPicture.asset(
                                Paths.search,
                                width: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: AppColors.mainColor,
                              child: InkWell(
                                onTap: addButtonOnTap,
                                child: SvgPicture.asset(
                                  Paths.add,
                                  width: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "العملاء",
                          style: AppTextStyle.displaySemiBold,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(
                              bottom: 16, right: 16, left: 16, top: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.mainColor)),
                          child: Obx(
                            () => customerController.isDataLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            TableRowWidget(
                                              customer: customerController
                                                  .allCustomersList[index],
                                              index: index,
                                              onDismissed: (direction) {
                                                customerController
                                                    .allCustomersList
                                                    .removeAt(index);
                                                setState(() {});
                                                Constants.snackBar(
                                                    "Item Deleted Succeccfully");
                                              },
                                            ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              height: 10,
                                            ),
                                        itemCount: customerController
                                            .allCustomersList.length),
                                  ),
                          ))),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  void addButtonOnTap() {
    Constants.showCustomDialog(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AddTextField(icon: Icons.person, title: "اسم العميل"),
              AddTextField(icon: Icons.email, title: "البريد الالكتروني"),
              AddTextField(icon: Icons.phone, title: "رقم الجوال"),
            ],
          ),
        ),
        "اضافة عميل");
  }
}
