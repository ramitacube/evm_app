import 'package:car_rental/graphql_config/graphql_provider.dart';
import 'package:car_rental/models/RentTime.dart';
import 'package:car_rental/models/car.dart';
import 'package:car_rental/models/dealer.dart';
import 'package:car_rental/models/rental_package_model.dart';
import 'package:car_rental/models/user.dart';
import 'package:car_rental/services/car_service.dart';
import 'package:car_rental/services/dealer_service.dart';
import 'package:car_rental/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:line_icons/line_icons.dart';

class DocumentController extends GetxController {
  final GlobalKey<ScaffoldState> docScaffoldKey =
      new GlobalKey<ScaffoldState>();
  User userProfile;
  List<Car> cars = [];
  List<Dealer> dealers = [];
  List<String> catName = ["Rent a Cab", "Rent a Bike"];
  List<Icon> catIcon = [
    Icon(
      LineIcons.car,
      size: 48,
    ),
    Icon(
      LineIcons.biking,
      size: 48,
    ),
  ];
  List<RentTime> rentTime = [];
  List<String> rentalPackages = ["Hourly", "Daily", "Weekly", "Monthly"];
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

  void openDrawer() {
    docScaffoldKey.currentState.openDrawer();
  }

  void closeDrawer() {
    docScaffoldKey.currentState.openEndDrawer();
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
