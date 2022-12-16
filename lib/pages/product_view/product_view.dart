import 'package:car_rental/models/filter.dart';
import 'package:car_rental/models/head_model.dart';
import 'package:car_rental/models/search_model.dart';
import 'package:car_rental/pages/product_view/product_controller.dart';
import 'package:car_rental/routes/app_pages.dart';
import 'package:car_rental/services/filter_service.dart';
import 'package:car_rental/shared/styles/colors.dart';
import 'package:car_rental/shared/widgets/avatar_widget.dart';
import 'package:car_rental/shared/widgets/drawer_widget.dart';
import 'package:car_rental/shared/widgets/productGridViewWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ProductView extends GetView<ProductController> {
  final productDetails = Get.arguments;

  final filters = FilterService().getFilterList();
  //final categoryName=Get.arguments as String;
  @override
  Widget build(BuildContext context) {
    controller.products = productDetails[0];
    controller.days = DateTime.parse(productDetails[2])
        .difference(DateTime.parse(productDetails[1]))
        .inDays;
    controller.pickUpDate = productDetails[1];
    controller.pickUpId = productDetails[3];
    controller.dropDate = productDetails[2];
    controller.dropId = productDetails[4];
    controller.categoryId = productDetails[5];
    controller.bundlId = productDetails[6];
    controller.pickupCity = productDetails[7];
    controller.dropCity = productDetails[8];
    controller.bundleName = productDetails[9];

    return GetBuilder<ProductController>(
        initState: (_) async {
          await controller.getSearch();
          await controller.getHeadValue();
        },
        builder: (_) => Scaffold(
              key: controller.prodScaffoldKey,
              backgroundColor: Colors.grey[100],
              drawer: DrawerWidget(
                controller: controller,
              ),
              body: SafeArea(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildHeader(context),
                      buildModifySearch(context),
                      // SizedBox(height: 10),
                      Expanded(
                        child: !controller.isLoading
                            ? ListView.builder(
                                itemCount: controller
                                    .searchData.getFilteredProducts.length,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index1) {
                                  controller.categoryAttribute = controller
                                      .searchData
                                      .getFilteredProducts[index1]
                                      .name;

                                  return controller
                                          .searchData
                                          .getFilteredProducts[index1]
                                          .products
                                          .isNotEmpty
                                      ? Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0, top: 10),
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Row(
                                                    children: [
                                                      Text(controller
                                                          .searchData
                                                          .getFilteredProducts[
                                                              index1]
                                                          .name),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Text(controller
                                                            .bundleName),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(height: 10),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                              child: GridView.builder(
                                                  shrinkWrap: true,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: MediaQuery
                                                                    .of(context)
                                                                .orientation ==
                                                            Orientation
                                                                .landscape
                                                        ? 5
                                                        : 2,
                                                    crossAxisSpacing: 5,
                                                    mainAxisSpacing: 5,
                                                    childAspectRatio: (2 / 2.3),
                                                  ),
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: controller
                                                      .searchData
                                                      .getFilteredProducts[
                                                          index1]
                                                      .products
                                                      .length,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemBuilder:
                                                      (contextList, index) {
                                                    controller.product =
                                                        controller
                                                            .searchData
                                                            .getFilteredProducts[
                                                                index1]
                                                            .products[index];
                                                    // controller.sortToHighest("Highest Price");
                                                    return productViewWidget(
                                                        controller.product,
                                                        (Products product) {
                                                      Get.toNamed(
                                                          Routes.BOOK_CAR,
                                                          arguments: [
                                                            product,
                                                            controller.days,
                                                            controller
                                                                .pickUpDate,
                                                            controller.pickUpId,
                                                            controller.dropDate,
                                                            controller.dropId,
                                                            controller
                                                                .pickupCity,
                                                            controller.dropCity,
                                                            controller
                                                                .categoryAttribute,
                                                            controller
                                                                .bundleName,
                                                            controller.bundlId
                                                          ]);
                                                    });
                                                  }),
                                            ),
                                          ],
                                        )
                                      : Container();
                                  // controller.update();
                                })
                            : buildLoading(context),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                height: 70,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                decoration: BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildFilterIcon(context),
                      buildFilters(),
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAppBar(context),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5, left: 0),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: IconButton(
                onPressed: () => controller.openDrawer(),
                icon: Icon(
                  Icons.menu,
                  size: 40,
                  color: kPrimaryColor,
                )),
          ),
          Container(
            child: AvatarWidget(
              //photoURL: controller.userProfile.photoURL,
              membership: 'Gold',
              progress: 70,
            ),
          ),
          Container(
            // width: MediaQuery.of(context).size.width * 0.1,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Kochi",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Palarivattom",
                          style: TextStyle(
                            fontSize: 10,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        // TitleWidget(
                        //   title: "Kochi",
                        //   fontSizeTitle: 14,
                        //   subtitle2: "Palarivattom",
                        //   fontSizesubtitle2: 10,
                        // ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.AVAILABILITY);
                  },
                  child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 23,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildModifySearch(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Modify Search",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFilterIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.toNamed(Routes.FILTER);
        filterPopUp(context);
      },
      child: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.only(left: 14),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Center(
          child: Icon(
            LineIcons.filter,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }

  Widget buildFilters() {
    return GetBuilder<ProductController>(
        builder: (_) => ValueBuilder<Filter>(
              initialValue: filters[1],
              builder: (value, updateFn) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: filters
                    .map((filter) => buildFilter(value, filter, updateFn))
                    .toList(),
              ),
            ));
  }

  Widget buildFilter(Filter value, Filter filter, Function(Filter) updateFn) {
    return GetBuilder<ProductController>(
        builder: (_) => GestureDetector(
              onTap: () {
                updateFn(filter);
                print(value.name);
                if (value.name == "Highest Price") {
                  controller.sortOrder = "DESC";
                  controller.selectedHead.isEmpty
                      ? controller.getSearch()
                      : controller.getFilterSearch();
                } else {
                  controller.sortOrder = "ASC";
                  controller.selectedHead.isEmpty
                      ? controller.getSearch()
                      : controller.getFilterSearch();
                }
              },
              child: Padding(
                padding: EdgeInsets.only(right: 17),
                child: Text(
                  filter.name,
                  style: TextStyle(
                    color: value.name == filter.name
                        ? kPrimaryColor
                        : Colors.grey[500],
                    fontSize: 16,
                    fontWeight: value.name == filter.name
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ));
  }

  filterPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return GetBuilder<ProductController>(
              builder: (_) => Dialog(
                    insetPadding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          // padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                child: ListTile(
                                  leading: InkResponse(
                                      onTap: () => Navigator.of(context).pop(),
                                      child: Icon(
                                        Icons.arrow_back_sharp,
                                        color: Colors.white,
                                      )),
                                  title: Text(
                                    "Filters",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .apply(
                                            color: Colors.white,
                                            fontSizeDelta: 6),
                                  ),
                                  trailing: TextButton(
                                    onPressed: () async {
                                      await controller.getSearch();
                                      // for(int i=0 ; i<=controller.headData.length ; i++){
                                      //   for(int j=0 ; j<=controller.headData[i].headValue.length ; j++){
                                      //     controller.headData[i].headValue[j].check=false;
                                      //   }
                                      // }
                                      Get.back();
                                    },
                                    child: Text(
                                      "Clear filter",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .apply(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: controller.headData.length,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index0) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  controller
                                                      .headData[index0].name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          ),
                                          new GridView.builder(
                                              shrinkWrap: true,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount:
                                                    MediaQuery.of(context)
                                                                .orientation ==
                                                            Orientation
                                                                .landscape
                                                        ? 5
                                                        : 2,
                                                crossAxisSpacing: 2,
                                                mainAxisSpacing: 2,
                                                childAspectRatio: (4 / 1),
                                              ),
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: controller
                                                  .headData[index0]
                                                  .headValue
                                                  .length,
                                              scrollDirection: Axis.vertical,
                                              itemBuilder:
                                                  (contextList, index1) {
                                                var headValue = controller
                                                    .headData[index0]
                                                    .headValue[index1];

                                                List<List<bool>> heads = [];
                                                for (int i = 0;
                                                    i <
                                                        controller
                                                            .headData.length;
                                                    i++) {
                                                  controller.isChecked =
                                                      List<bool>.filled(
                                                          controller.headData[i]
                                                              .headValue.length,
                                                          false);
                                                  heads.add(
                                                      controller.isChecked);
                                                }

                                                return Container(
                                                  child: CheckboxListTile(
                                                    value: headValue.check,
                                                    selected: headValue.check,
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading,
                                                    title: Text(
                                                      headValue.name,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10),
                                                    ),
                                                    onChanged: (val) {
                                                      headValue.check = val;
                                                      val
                                                          ? controller.addHeads(
                                                              int.parse(
                                                                  headValue.id))
                                                          : controller
                                                              .removeHeads(
                                                                  int.parse(
                                                                      headValue
                                                                          .id));
                                                      controller.update();
                                                      print(heads);
                                                    },
                                                  ),
                                                );
                                              }),
                                        ],
                                      );
                                    }),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, bottom: 10),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: 45.0,
                                  child: new RawMaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    fillColor: kPrimaryColor,
                                    elevation: 0.0,
                                    child: Center(
                                        child: Text(
                                      "Apply Filter ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    onPressed: () async {
                                      await controller.getFilterSearch();
                                      Get.back();
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ));
        });
  }

  Widget checkBoxWidget(int index1, HeadValue headValue, bool check) {
    return GetBuilder<ProductController>(
        builder: (_) => Container(
              child: CheckboxListTile(
                value: controller.isChecked[index1],
                selected: controller.isChecked[index1],
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  headValue.name,
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
                onChanged: (val) {
                  // isChecked[index]=va

                  check = val;
                  controller.update();
                  print(check);
                },
              ),
            ));
  }

  Widget buildLoading(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: SpinKitWave(
        size: 20,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
          );
        },
      ),
    );
  }
}
