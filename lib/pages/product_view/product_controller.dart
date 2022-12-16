import 'dart:convert';

import 'package:car_rental/graphql_config/graphql_provider.dart';
import 'package:car_rental/models/create_rental_model.dart';
import 'package:car_rental/models/head_model.dart';
import 'package:car_rental/models/search_model.dart';
import 'package:car_rental/queryMutation/mutation_class.dart';
import 'package:car_rental/queryMutation/query_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductController extends GetxController {
  GraphqlClass graphqlClass = GraphqlClass();
  bool isLoading = false;
  CreateRentalData createRentalData = CreateRentalData();
  String pickUpDate;
  var pickUpId;
  String dropDate;
  var dropId;
  var days;
  SearchData products;
  Products product = Products();
  SearchData searchData = SearchData();
  List<ProductAttrHeadWithValue> headData = [];
  int selectedIndex = 0;

  List<bool> isChecked;
  List<int> selectedHead = [];
  var sortBY = 'price';
  var sortOrder = "ASC";

  final GlobalKey<ScaffoldState> prodScaffoldKey =
      new GlobalKey<ScaffoldState>();

  String categoryId;
  String categoryAttribute;
  String categoryName;
  String bundlId;
  String pickupHubId;
  String dropHubId;
  String fromDate;
  String toDate;
  String pickupCity;
  String dropCity;
  String bundleName;

  @override
  void onInit() {
    super.onInit();
  }

  void openDrawer() {
    prodScaffoldKey.currentState.openDrawer();
  }

  void closeDrawer() {
    prodScaffoldKey.currentState.openEndDrawer();
  }

  Future<bool> getSearch() async {
    searchData = null;
    isLoading = true;
    update();
    GraphQLClient client = graphqlClass.clientToQuery();
    try {
      QueryResult result = await client.mutate(MutationOptions(
          documentNode: gql(MutationClass().search),
          variables: {
            "input": {
              "category_id": int.parse(categoryId),
              "location_from": int.parse(pickUpId),
              "location_to": int.parse(dropId),
              "date_from": pickUpDate,
              "date_to": dropDate,
              "bundle_id": int.parse(bundlId),
              "sortby": sortBY,
              "order": sortOrder,
            }
          }));

      print("Data===${result.data}");
      String responseDetails = getPrettyJSONString(result.data);
      var response = json.decode(responseDetails);
      searchData = SearchData.fromJson(response);
      print("result length==${searchData.getFilteredProducts.length}");
      isLoading = false;
      update();
      return true;
    } on NetworkException catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getFilterSearch() async {
    searchData = null;
    isLoading = true;
    update();
    GraphQLClient client = graphqlClass.clientToQuery();
    try {
      QueryResult result = await client.mutate(MutationOptions(
          documentNode: gql(MutationClass().search),
          variables: {
            "input": {
              "category_id": int.parse(categoryId),
              "location_from": int.parse(pickUpId),
              "location_to": int.parse(dropId),
              "date_from": pickUpDate,
              "date_to": dropDate,
              "bundle_id": int.parse(bundlId),
              "sortby": sortBY,
              "order": sortOrder,
              "heads": selectedHead
            }
          }));

      print("Data===${result.data}");
      String responseDetails = getPrettyJSONString(result.data);
      var response = json.decode(responseDetails);
      searchData = SearchData.fromJson(response);
      print("result length==${searchData.getFilteredProducts.length}");
      isLoading = false;
      update();
      return true;
    } on NetworkException catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> getHeadValue() async {
    isLoading = true;
    update();
    GraphQLClient client = graphqlClass.clientToQuery();
    try {
      QueryResult result = await client.query(
        QueryOptions(
          documentNode: gql(QueryClass().getHeader),
        ),
      );
      print("Data===${result.data}");
      String responseDetails = getPrettyJSONString(result.data);
      var response = json.decode(responseDetails);
      headData = HeadData.fromJson(response).productAttrHeadWithValue;
      print("result length==${headData.length}");
      isLoading = false;
      update();
    } on NetworkException catch (e) {
      print(e);
    }
  }

  void addHeads(int headId) {
    selectedHead.add(headId);
    print(selectedHead);
  }

  void removeHeads(int headId) {
    selectedHead.forEach((element) {
      if (element == headId) {
        selectedHead.remove(headId);
        print("Removed element is $headId");
      }
    });
  }

  static String getPrettyJSONString(Object jsonObject) {
    String response = JsonEncoder.withIndent(' ').convert(jsonObject);
    return response;
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
  }
}
