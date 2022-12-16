import 'dart:convert';

import 'package:car_rental/graphql_config/graphql_provider.dart';
import 'package:car_rental/models/bundle_model.dart';
import 'package:car_rental/models/district_model.dart';
import 'package:car_rental/models/hub_model.dart';
import 'package:car_rental/models/rental_atribute_model.dart';
import 'package:car_rental/models/rental_category_model.dart';
import 'package:car_rental/models/rental_package_model.dart';
import 'package:car_rental/models/search_model.dart';
import 'package:car_rental/queryMutation/mutation_class.dart';
import 'package:car_rental/queryMutation/query_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';

import '../../core.dart';

class SearchController extends GetxController {
  String dataBaseToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI0IiwianRpIjoiMDE4NzlmNmZiNTFjZWJiNTMyZjUyM2Y4Yzk3MGQxNjY5ODRlZDMzY2I4MWYzYTc3ZWU2YjM3OWJhODg5ZjI2MjYwYWY1OGMyZDMyNGNhY2IiLCJpYXQiOjE2MzY3MTUzMTAuODk4OTE0LCJuYmYiOjE2MzY3MTUzMTAuODk4OTE4LCJleHAiOjE2NjgyNTEzMTAuODg0MDE4LCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.A36RceEnyEtodN_bLCssxIuFDDQPib_TzXJYlCdA5zJq3McHov7SXSklQ6nVo3VstqeygpRkVEwLLFGdQuRNag7vUjyaNZu8ogx078ZnHA5Y5VCp4MdHJuA8cogNXpmQSDIHlh0RPgvtJiPMnLrVYk76033Strk3hZCk23eK5Z6XAK8aA1NT3Z-fd4d1dnp5KuVrfNIvze12KKH4WmtObHz-GXlepIFgZsk_aMPnW3reCQeexlcmibh7WufYbiSab9U3kyblc_JIjBbJJvioctfqRm4aq9iZp0V8tCHlZx19UFNpSyvEAjVFMVlhPSo6sCthxBY5I6E0T8R1CutVemgaLeYcNFzgLO32gYT_8fcX9W0OxwvzA0hiWCPkXoPc_eAMDTNWvHR9593rt4en9EkZ3GNfOXuU811SD0SytUXYoPhna4abpMIfHgnN1zDd-OksW6MCcfmq7nxYf_gkPxwPl-6ATnnMHgK_Fj5ItZcDf7oooSbeRM-aubRec_XM9N6Qvb2DHaxWJGxJtuWMH43V53s-WfON3LObmp-O98weE1uhpQtfzbdcT8JUBJ5J-i529KQJbAJzSzRBfaa-7xa_YZX-DV28b2TP2w7_AVaCSaPZJwsV22EBVbNX62Io53ykSmO4xK9gUeOA5IjqZjfoZF_H0NmgQLxp-WN3sB4';
  String strapiToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjM4NzcwNDYyLCJleHAiOjE2NDEzNjI0NjJ9.eMCq_swpAAdWCFF9n86yv0FCTIsZXq_VXZkAjR54M4Y';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> searchScaffoldKey =
      new GlobalKey<ScaffoldState>();

  List<Car> cars = [];
  List<Dealer> dealers = [];
  BundleData bundleData = BundleData();
  bool selected1 = true;
  bool selected2 = false;
  int selectedCarType = 0;
  int selectedCategory = 0;
  int selectedIndex;
  int hubIndex;
  int passingIndex;
  bool selectTime = false;
  bool selectRent = true;
  RentalPackageModel rentalPackage;
  CategoryModel rentalCategory;
  List<CategoryAttrBasedoncategory> categoryAttrData = [];
  List<PackagebundlesCategory> packageBundle = [];
  SearchData searchData = SearchData();

  PersistentBottomSheetController bottomController;

  var city;
  DistrictData districtData = DistrictData();
  HubData hubData = HubData();
  bool locationSelected = true;
  String pickupCity;
  String pickupHub;
  var pickupHubId;

  String dropCity;
  var dropCityId;
  String dropHub;
  var dropHubId;

  String bundleName;

  String categoryId;
  String categoryName;
  String bundleId;
  var companyId;

  Car displayCar;
  GraphqlClass graphqlClass = new GraphqlClass();
  bool isLoading = false;
  DateTime fromDateTime = DateTime.now();
  String fromDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  DateTime toDateTime = DateTime.now().add(const Duration(days: 1));
  String toDate = DateFormat("yyyy-MM-dd")
      .format(DateTime.now().add(const Duration(days: 1)));

  void openDrawer() {
    searchScaffoldKey.currentState.openDrawer();
  }

  void closeDrawer() {
    searchScaffoldKey.currentState.openEndDrawer();
  }

  @override
  void onInit() {
    super.onInit();
    cars = CarService().getCarList();
    dealers = DealerService().getDealerList();
  }

  Future<void> getRentalCategory() async {
    isLoading = true;
    update();
    GraphQLClient client = graphqlClass.clientToQuery();
    try {
      QueryResult result = await client.query(
        QueryOptions(
            documentNode: gql(QueryClass().queryRentalCategory),
            context: {
              'headers': {'Authorization': 'Bearer $strapiToken'}
            }),
      );
      print("Data===${result.data}");
      String responseDetails = getPrettyJSONString(result.data);
      var response = json.decode(responseDetails);
      rentalCategory = CategoryModel.fromJson(response);
      print("result length==${rentalCategory.getCompaniesCategories.length}");
      isLoading = false;
      update();
    } on NetworkException catch (e) {
      print(e);
    }
  }

  Future<void> getCategoryAttribute(String catgoryId) async {
    isLoading = true;
    update();
    GraphQLClient client = graphqlClass.clientToQuery();
    try {
      QueryResult result = await client.query(
        QueryOptions(
            documentNode: gql(QueryClass().queryCategoryAttribute),
            variables: {
              "categoryId": catgoryId
            },
            context: {
              'headers': {'Authorization': 'Bearer $dataBaseToken'}
            }),
      );
      print("Data===${result.data}");
      String responseDetails = getPrettyJSONString(result.data);
      var response = json.decode(responseDetails);
      categoryAttrData =
          CategoryAttrData.fromJson(response).categoryAttrBasedoncategory;
      print("result length==${categoryAttrData.length}");
      await getRentalBundle(catgoryId);
      isLoading = false;
      update();
    } on NetworkException catch (e) {
      print(e);
    }
  }

  Future<void> getRentalBundle(String catgoryId) async {
    isLoading = true;
    update();
    GraphQLClient client = graphqlClass.clientToQuery();
    try {
      QueryResult result = await client.query(
        QueryOptions(
            documentNode: gql(QueryClass().queryBundle),
            variables: {"categoryId": catgoryId}),
      );
      print("Data===${result.data}");
      String responseDetails = getPrettyJSONString(result.data);
      var response = json.decode(responseDetails);
      packageBundle = BundleData.fromJson(response).packagebundlesCategory;
      print("result length==${packageBundle.length}");
      isLoading = false;
      update();
    } on NetworkException catch (e) {
      print(e);
    }
  }

  Future<void> getDistrict() async {
    isLoading = true;
    update();
    GraphQLClient client = graphqlClass.clientToQuery();

    try {
      QueryResult result = await client.query(
        QueryOptions(
          documentNode: gql(QueryClass().queryDistrict),
          // context: {
          //   'headers': {
          //     'Authorization': 'Bearer $dataBaseToken'
          //   }
          // }
        ),
      );
      print("Data===${result.data}");
      String responseDetails = getPrettyJSONString(result.data);
      var response = json.decode(responseDetails);
      districtData = DistrictData.fromJson(response);
      print("result length==${districtData.cities.length}");
      isLoading = false;
      update();
    } on NetworkException catch (e) {
      print(e);
    }
  }

  Future<void> getHub(int districtId) async {
    isLoading = true;
    update();
    GraphQLClient client = graphqlClass.clientToQuery();

    try {
      QueryResult result = await client.query(
        QueryOptions(
          documentNode: gql(QueryClass().queryHub),
          variables: {"cityId": districtId},
          // context: {
          //   'headers': {
          //     'Authorization': 'Bearer $dataBaseToken'
          //   }
          // }
        ),
      );
      print("Data===${result.data}");
      String responseDetails = getPrettyJSONString(result.data);
      var response = json.decode(responseDetails);
      hubData = HubData.fromJson(response);
      print("result length==${hubData.locationoncity.length}");
      isLoading = false;
      update();
    } on NetworkException catch (e) {
      print(e);
    }
  }

  Future<bool> getSearch() async {
    searchData = null;
    isLoading = true;
    GraphQLClient client = graphqlClass.clientToQuery();
    try {
      QueryResult result = await client.mutate(MutationOptions(
          documentNode: gql(MutationClass().search),
          variables: {
            "input": {
              "category_id": int.parse(categoryId),
              "location_from": int.parse(pickupHubId),
              "location_to": int.parse(dropHubId),
              "date_from": fromDate,
              "date_to": toDate
            }
          }));

      print("Data===${result.data}");
      String responseDetails = getPrettyJSONString(result.data);
      var response = json.decode(responseDetails);
      searchData = SearchData.fromJson(response);
      print("result length==${searchData.getFilteredProducts.length}");
      isLoading = false;
      return true;
    } on NetworkException catch (e) {
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

  static String getPrettyJSONString(Object jsonObject) {
    String response = JsonEncoder.withIndent(' ').convert(jsonObject);
    return response;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
