import 'dart:developer';

import 'package:birdeyes/datasource/remote_data_source.dart';
import 'package:birdeyes/models/customer.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:birdeyes/core/constants.dart';
import '../core/constants.dart';
import '../core/error/exceptions.dart';

class CustomerController extends GetxController {
  RemoteDataSource remoteDataSource = RemoteDataSource(client: http.Client());
  List<Customer> allCustomersList = [];

  var isDataLoading = false.obs;
  allCustomers() async {
    isDataLoading(true);
    try {
      allCustomersList = await remoteDataSource.getAllCustomer();
      log(allCustomersList.length.toString());
    } on ServerException {
      Constants.snackBar("An error has occured please try again!");
    }

    isDataLoading(false);
  }
}
