import 'dart:convert';

import 'package:car_rental/graphql_config/graphql_provider.dart';
import 'package:car_rental/models/RentTime.dart';
import 'package:car_rental/models/rental_package_model.dart';
import 'package:car_rental/queryMutation/query_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../core.dart';

class PackageController extends GetxController {
  static PackageController to = Get.find();

  final GlobalKey<ScaffoldState> rentPackScaffoldKey =
      new GlobalKey<ScaffoldState>();
  User userProfile;
  List<Car> cars = [];
  List<Dealer> dealers = [];
  List<RentTime> rentTime = [];
  List<String> rentalPackages = [
    "Hourly",
    "Daily",
    "Weekly",
    "Monthly",
    "Quarterly",
    "Half-year"
  ];
  RentalPackageModel rentalPackage;
  Car displayCar;
  bool selectTime = false;
  bool selectRent = true;
  int indexPackage = 0;
  int selectedIndex;
  GraphqlClass graphqlClass = new GraphqlClass();
  bool isLoading = false;
  DateTime fromDateTime = DateTime.now();
  DateTime toDateTime = DateTime.now();
  bool selected1 = true;
  bool selected2 = false;
  int selectedCarType = 0;
  List<String> carRentalPackages = [
    "HatchBack",
    "Sedan",
    "SUV",
    "MUV",
    "Compact Sedan"
  ];

  @override
  void onInit() async {
    super.onInit();
    loadData();
    // await getRentalPackage();
  }

  loadData() {
    userProfile = UserService().getProfile();
    cars = CarService().getCarList();
    dealers = DealerService().getDealerList();
    displayCar = cars[2];
  }

  static String getPrettyJSONString(Object jsonObject) {
    String response = JsonEncoder.withIndent(' ').convert(jsonObject);
    return response;
  }

  void openDrawer() {
    rentPackScaffoldKey.currentState.openDrawer();
  }

  void closeDrawer() {
    rentPackScaffoldKey.currentState.openEndDrawer();
  }

  Future<void> getRentalPackage() async {
    isLoading = true;
    update();

    GraphQLClient client = graphqlClass.clientToQuery();

    try {
      QueryResult result = await client.query(
        QueryOptions(documentNode: gql(QueryClass().queryRentalPackage)),
      );
      print("Data===${result.data}");
      String responseDetails = getPrettyJSONString(result.data);

      var response = json.decode(responseDetails);
      rentalPackage = RentalPackageModel.fromJson(response);

      print("result length==${rentalPackage.rentalPackages.data.length}");

      isLoading = false;
      update();
    } on NetworkException catch (e) {
      print(e);
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

  @override
  void onReady() async {
    super.onReady();
    // await getRentalPackage();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
