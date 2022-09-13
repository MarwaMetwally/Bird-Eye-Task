// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:birdeyes/core/helper_functions.dart';
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
          body: Column(
        children: [
          CustomAppBar(onSelect: (imagesrc) {
            HelperFunctions.onImageButtonPressed(imagesrc, _picker);
          }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Customer"),
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
                    SizedBox(
                      width: 10.w,
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
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Container(
                  margin:
                      EdgeInsets.only(bottom: 24.h, right: 16.w, left: 16.w),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.mainColor)),
                  child: Obx(
                    () => customerController.isDataLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => TableRowWidget(
                                  customer: customerController
                                      .allCustomersList[index],
                                  index: index,
                                  onDismissed: (direction) {
                                    customerController.allCustomersList
                                        .removeAt(index);
                                    setState(() {});
                                    Constants.snackBar(
                                        "Item Deleted Succeccfully");
                                  },
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 10.h,
                                ),
                            itemCount:
                                customerController.allCustomersList.length),
                  ))),
        ],
      )),
    );
  }

  void addButtonOnTap() {
    Constants.showCustomDialog(
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AddTextField(icon: Icons.person, title: "Name : "),
              AddTextField(icon: Icons.email, title: "Email : "),
              AddTextField(icon: Icons.phone, title: "Phone : "),
            ],
          ),
        ),
        "Add Customer");
  }
}
