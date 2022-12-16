import 'dart:convert';

import 'package:car_rental/core.dart';
import 'package:car_rental/graphql_config/graphql_provider.dart';
import 'package:car_rental/models/district_model.dart';
import 'package:car_rental/models/hub_model.dart';
import 'package:car_rental/models/user.dart';
import 'package:car_rental/queryMutation/query_class.dart';
import 'package:car_rental/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AvailabilityController extends GetxController
    with SingleGetTickerProviderMixin {
  String dataBaseToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI0IiwianRpIjoiMDE4NzlmNmZiNTFjZWJiNTMyZjUyM2Y4Yzk3MGQxNjY5ODRlZDMzY2I4MWYzYTc3ZWU2YjM3OWJhODg5ZjI2MjYwYWY1OGMyZDMyNGNhY2IiLCJpYXQiOjE2MzY3MTUzMTAuODk4OTE0LCJuYmYiOjE2MzY3MTUzMTAuODk4OTE4LCJleHAiOjE2NjgyNTEzMTAuODg0MDE4LCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.A36RceEnyEtodN_bLCssxIuFDDQPib_TzXJYlCdA5zJq3McHov7SXSklQ6nVo3VstqeygpRkVEwLLFGdQuRNag7vUjyaNZu8ogx078ZnHA5Y5VCp4MdHJuA8cogNXpmQSDIHlh0RPgvtJiPMnLrVYk76033Strk3hZCk23eK5Z6XAK8aA1NT3Z-fd4d1dnp5KuVrfNIvze12KKH4WmtObHz-GXlepIFgZsk_aMPnW3reCQeexlcmibh7WufYbiSab9U3kyblc_JIjBbJJvioctfqRm4aq9iZp0V8tCHlZx19UFNpSyvEAjVFMVlhPSo6sCthxBY5I6E0T8R1CutVemgaLeYcNFzgLO32gYT_8fcX9W0OxwvzA0hiWCPkXoPc_eAMDTNWvHR9593rt4en9EkZ3GNfOXuU811SD0SytUXYoPhna4abpMIfHgnN1zDd-OksW6MCcfmq7nxYf_gkPxwPl-6ATnnMHgK_Fj5ItZcDf7oooSbeRM-aubRec_XM9N6Qvb2DHaxWJGxJtuWMH43V53s-WfON3LObmp-O98weE1uhpQtfzbdcT8JUBJ5J-i529KQJbAJzSzRBfaa-7xa_YZX-DV28b2TP2w7_AVaCSaPZJwsV22EBVbNX62Io53ykSmO4xK9gUeOA5IjqZjfoZF_H0NmgQLxp-WN3sB4';
  String strapiToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjM4NzcwNDYyLCJleHAiOjE2NDEzNjI0NjJ9.eMCq_swpAAdWCFF9n86yv0FCTIsZXq_VXZkAjR54M4Y';

  final GlobalKey<ScaffoldState> availScaffoldKey =
      new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  final TextEditingController typeAheadController = TextEditingController();
  TabController availableTabController;

  DistrictData districtData = DistrictData();
  HubData hubData = HubData();

  int tabIndex = 0;
  bool isChecked = false;
  bool locationSelected = true;
  bool isLoading = false;
  var city;
  GraphqlClass graphqlClass = new GraphqlClass();
  int selectedIndex;
  User userProfile;

  DateTime fromDateTime = DateTime.now();
  DateTime toDateTime = DateTime.now();

  String selectedCity;

  @override
  void onInit() async {
    super.onInit();

    userProfile = UserService().getProfile();
  }

  void getController() {
    availableTabController =
        TabController(length: 3, initialIndex: tabIndex, vsync: this);
    availableTabController.addListener(_handleTabSelection);
  }

  Future<void> getDistrict() async {
    isLoading = true;
    update();
    GraphQLClient client = graphqlClass.clientToQuery();

    try {
      QueryResult result = await client.query(
        QueryOptions(documentNode: gql(QueryClass().queryDistrict), context: {
          'headers': {'Authorization': 'Bearer $dataBaseToken'}
        }),
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
        QueryOptions(documentNode: gql(QueryClass().queryHub), variables: {
          "districtId": districtId
        }, context: {
          'headers': {'Authorization': 'Bearer $dataBaseToken'}
        }),
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

  _handleTabSelection() {
    if (availableTabController.indexIsChanging) {
      //_controller.myCat = _controller.getMyCategory();
      tabIndex = availableTabController.index;
      update();
    }
  }

  void openDrawer() {
    availScaffoldKey.currentState.openDrawer();
  }

  void closeDrawer() {
    availScaffoldKey.currentState.openEndDrawer();
  }

  List<Cities> getSuggestions(String query) {
    List<Cities> matches = [];
    matches.addAll(districtData.cities);

    matches
        .retainWhere((s) => s.name.toLowerCase().contains(query.toLowerCase()));
    return matches;
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
}
