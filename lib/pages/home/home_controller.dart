import 'dart:convert';

import 'package:car_rental/graphql_config/graphql_provider.dart';
import 'package:car_rental/models/RentTime.dart';
import 'package:car_rental/models/offer_model.dart';
import 'package:car_rental/models/rental_category_model.dart';
import 'package:car_rental/models/rental_package_model.dart';
import 'package:car_rental/queryMutation/query_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:line_icons/line_icons.dart';

import '../../core.dart';

class HomeController extends GetxController {
  String dataBaseToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI0IiwianRpIjoiMDE4NzlmNmZiNTFjZWJiNTMyZjUyM2Y4Yzk3MGQxNjY5ODRlZDMzY2I4MWYzYTc3ZWU2YjM3OWJhODg5ZjI2MjYwYWY1OGMyZDMyNGNhY2IiLCJpYXQiOjE2MzY3MTUzMTAuODk4OTE0LCJuYmYiOjE2MzY3MTUzMTAuODk4OTE4LCJleHAiOjE2NjgyNTEzMTAuODg0MDE4LCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.A36RceEnyEtodN_bLCssxIuFDDQPib_TzXJYlCdA5zJq3McHov7SXSklQ6nVo3VstqeygpRkVEwLLFGdQuRNag7vUjyaNZu8ogx078ZnHA5Y5VCp4MdHJuA8cogNXpmQSDIHlh0RPgvtJiPMnLrVYk76033Strk3hZCk23eK5Z6XAK8aA1NT3Z-fd4d1dnp5KuVrfNIvze12KKH4WmtObHz-GXlepIFgZsk_aMPnW3reCQeexlcmibh7WufYbiSab9U3kyblc_JIjBbJJvioctfqRm4aq9iZp0V8tCHlZx19UFNpSyvEAjVFMVlhPSo6sCthxBY5I6E0T8R1CutVemgaLeYcNFzgLO32gYT_8fcX9W0OxwvzA0hiWCPkXoPc_eAMDTNWvHR9593rt4en9EkZ3GNfOXuU811SD0SytUXYoPhna4abpMIfHgnN1zDd-OksW6MCcfmq7nxYf_gkPxwPl-6ATnnMHgK_Fj5ItZcDf7oooSbeRM-aubRec_XM9N6Qvb2DHaxWJGxJtuWMH43V53s-WfON3LObmp-O98weE1uhpQtfzbdcT8JUBJ5J-i529KQJbAJzSzRBfaa-7xa_YZX-DV28b2TP2w7_AVaCSaPZJwsV22EBVbNX62Io53ykSmO4xK9gUeOA5IjqZjfoZF_H0NmgQLxp-WN3sB4';
  String strapiToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjM4NzcwNDYyLCJleHAiOjE2NDEzNjI0NjJ9.eMCq_swpAAdWCFF9n86yv0FCTIsZXq_VXZkAjR54M4Y';

  ScrollController catScrollController = ScrollController();
  ScrollController offScrollController = ScrollController();

  static HomeController to = Get.find();
  final GlobalKey<ScaffoldState> homeScaffoldKey =
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
  List<GetCompaniesCategories> rentalCategory = [];
  List<Media> offerData = [];
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
    await getRentalCategory();
    await getRentalOffer();
  }

  void openDrawer() {
    homeScaffoldKey.currentState.openDrawer();
  }

  void closeDrawer() {
    homeScaffoldKey.currentState.openEndDrawer();
  }

  Future<void> getRentalCategory() async {
    isLoading = true;
    update();
    GraphQLClient client = graphqlClass.clientToQuery();
    try {
      QueryResult result = await client.query(
        QueryOptions(
          documentNode: gql(QueryClass().queryRentalCategory),
        ),
      );
      String responseDetails = getPrettyJSONString(result.data);
      var response = json.decode(responseDetails);
      rentalCategory = CategoryModel.fromJson(response).getCompaniesCategories;
      print("result sss length==$rentalCategory");
      isLoading = false;
      update();
    } on NetworkException catch (e) {
      print(e);
    }
  }

  Future<void> getRentalOffer() async {
    isLoading = true;
    update();
    GraphQLClient client = graphqlClass.clientToQuery();
    try {
      QueryResult result = await client.query(
        QueryOptions(
            documentNode: gql(QueryClass().queryRentalOffer),
            context: {
              'headers': {'Authorization': 'Bearer $strapiToken'}
            }),
      );
      print("Data=ass==${result.data}");
      String responseDetails = getPrettyJSONString(result.data);
      var response = json.decode(responseDetails);
      offerData = OfferData.fromJson(response).offer.media;
      print("result length==${offerData.length}");
      isLoading = false;
      update();
    } on NetworkException catch (e) {
      print(e);
    }
  }

  Future<void> getRentalPackage() async {
    isLoading = true;
    update();
    GraphQLClient client = graphqlClass.clientToQuery();

    try {
      QueryResult result = await client.query(
        QueryOptions(
            documentNode: gql(QueryClass().queryRentalPackage),
            context: {
              'headers': {'Authorization': 'Bearer $dataBaseToken'}
            }),
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

  static String getPrettyJSONString(Object jsonObject) {
    String response = JsonEncoder.withIndent(' ').convert(jsonObject);
    return response;
  }

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
