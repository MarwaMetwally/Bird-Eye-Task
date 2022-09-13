import 'dart:convert';
import 'package:birdeyes/core/constants.dart';
import 'package:birdeyes/models/customer.dart';
import 'package:http/http.dart' as http;
import '../core/error/exceptions.dart';

class RemoteDataSource {
  final http.Client client;

  RemoteDataSource({required this.client});

  Future<List<Customer>> getAllCustomer() async {
    final response = await client.get(
      Uri.parse(Constants.baseUrl + "/getallcustomers"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body)["customers"];

      final List<Customer> customerList = decodedJson
          .map<Customer>(
              (jsonCustomerModel) => Customer.fromJson(jsonCustomerModel))
          .toList();

      return customerList;
    } else {
      throw ServerException();
    }
  }
}
