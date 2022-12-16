import 'dart:convert';

import 'package:car_rental/graphql_config/graphql_provider.dart';
import 'package:car_rental/models/create_rental_model.dart';
import 'package:car_rental/models/customer_model.dart';
import 'package:car_rental/models/rental_details_model.dart';
import 'package:car_rental/models/search_model.dart';
import 'package:car_rental/queryMutation/mutation_class.dart';
import 'package:car_rental/view_models/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

import '../../core.dart';

class BookCarController extends GetxController {
  final interstitialAd =
      InterstitialAd(unitId: AdSetUnitId.interstitialAdUnitId);

  bool selectTime = false;
  DateTime fromDateTime = DateTime.now();
  DateTime toDateTime = DateTime.now();
  Products product;
  GraphqlClass graphqlClass = GraphqlClass();
  bool isLoading = false;
  CreateRentalData createRentalData = CreateRentalData();
  RentalDetailsData rentalDetailsData = RentalDetailsData();
  CustomerData customerData;
  UserViewModel model;

  String pickUpDate;
  var pickUpId;
  String dropDate;
  var dropId;
  var days;
  String pickupCity;
  String dropCity;
  String categoryAttribute;
  String categoryName;
  String bundleName;
  String bundleId;

  final GlobalKey<ScaffoldState> bookScaffoldKey =
      new GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> createRentals() async {
    var rentalDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    isLoading = true;
    var client = graphqlClass.clientToQuery();

    try {
      QueryResult result = await client.mutate(MutationOptions(
          documentNode: gql(MutationClass().createRental),
          variables: {
            "input": {
              "company_id": 1,
              "product_id": int.parse(product.id),
              "customer_id": int.parse(customerData.login.user.id),
              "rental_date": rentalDate.toString()
            }
          }));
      if (result.data != null) {
        String responseDetails = getPrettyJSONString(result.data);
        var response = json.decode(responseDetails);
        createRentalData = CreateRentalData.fromJson(response);
        var reuslt = await createRentalsDetails(
            int.parse(createRentalData.createRental.id));

        if (reuslt == true) {
          return true;
        }
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> createRentalsDetails(int rentalId) async {
    isLoading = true;
    var client = graphqlClass.clientToQuery();

    try {
      QueryResult result = await client.mutate(MutationOptions(
          documentNode: gql(MutationClass().getRentalDetails),
          variables: {
            "input": {
              "rental_id": rentalId,
              "customer_id": int.parse(customerData.login.user.id),
              "pickup_date": pickUpDate,
              "pickup_location_id": int.parse(pickUpId),
              "drop_date": dropDate,
              "drop_location_id": int.parse(dropId),
              "bundle_id": int.parse(bundleId),
              "package_id": product.packageId,
              "product_id": int.parse(product.id),
            }
          }));
      if (result.data != null) {
        String responseDetails = getPrettyJSONString(result.data);
        var response = json.decode(responseDetails);
        rentalDetailsData = RentalDetailsData.fromJson(response);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  void showSheet(BuildContext context, Widget child, VoidCallback onClicked) =>
      showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  child,
                ],
                cancelButton: CupertinoActionSheetAction(
                  child: Text("Submit"),
                  onPressed: onClicked,
                ),
              ));

  void openDrawer() {
    bookScaffoldKey.currentState.openDrawer();
  }

  void closeDrawer() {
    bookScaffoldKey.currentState.openEndDrawer();
  }

  static String getPrettyJSONString(Object jsonObject) {
    String response = JsonEncoder.withIndent(' ').convert(jsonObject);
    return response;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
  }
}
