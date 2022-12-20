import 'package:car_rental/models/district_model.dart';
import 'package:car_rental/pages/search/search_controller.dart';
import 'package:car_rental/shared/widgets/category_widget.dart';
import 'package:car_rental/shared/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import '../../core.dart';

class SearchView extends GetView<SearchController> {
  final int index;
  int selectCategoryId;
  SearchView([this.index, this.selectCategoryId]);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        initState: (_) async {
          await controller.getRentalCategory();
          // await controller.getRentalBundle();
          await controller.getDistrict();
          if (index != null) {
            await controller.getCategoryAttribute(selectCategoryId.toString());

            controller.categoryId = selectCategoryId.toString();
            controller.update();
          }
          controller.passingIndex = index == null ? null : index;
          print("index== $index");
        },
        builder: (_) => Scaffold(
              key: controller.searchScaffoldKey,
              drawer: DrawerWidget(
                controller: controller,
              ),
              body: Container(
                color: Colors.grey[200],
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildHeader(context),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.only(
                      //       bottomLeft: Radius.circular(15),
                      //       bottomRight: Radius.circular(15),
                      //     ),
                      //   ),
                      //   padding: EdgeInsets.only(bottom: 10),
                      //   child: Padding(
                      //     padding: EdgeInsets.all(16),
                      //     child: TextField(
                      //       decoration: InputDecoration(
                      //         hintText: 'Search for rentals...',
                      //         hintStyle: TextStyle(fontSize: 16),
                      //         border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(15),
                      //           borderSide: BorderSide(
                      //             width: 0,
                      //             style: BorderStyle.none,
                      //           ),
                      //         ),
                      //         filled: true,
                      //         fillColor: Colors.grey[200],
                      //         contentPadding: EdgeInsets.only(
                      //           left: 30,
                      //         ),
                      //         suffixIcon: Padding(
                      //           padding:
                      //               EdgeInsets.only(right: 24.0, left: 16.0),
                      //           child: Icon(
                      //             Icons.search,
                      //             color: Colors.black,
                      //             size: 24,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                // buildCategories(context),
                                buildTopBody(context),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 20.0),
                                      child: Text(
                                        'Select Travel Period You Want To Ride',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                buildFromToDate(context),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 20.0),
                                      child: Text(
                                        'Select Your Nearest Pickup/Drop Hub',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                buildPickupDrop(context),

                                buildSearch(context),

                                buildCarsSedan(),
                                buildCarsHatch(),
                                buildCarsSuv(),
                                SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ),
                      ),
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
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(15),
        //   bottomRight: Radius.circular(15),
        // ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAppBar(context),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5, left: 0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

  Widget buildTopBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Select Your Prefered Vehicle Type',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          !controller.isLoading
              ? GetBuilder<SearchController>(
                  builder: (_) => Container(
                      height: 110,
                      child: ListView.builder(
                          itemCount: controller
                              .rentalCategory.getCompaniesCategories.length,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            controller.selectTime = true;
                            // controller.update();

                            return InkWell(
                              onTap: () async {
                                await controller.getCategoryAttribute(controller
                                    .rentalCategory
                                    .getCompaniesCategories[index]
                                    .id);

                                print(controller.rentalCategory
                                    .getCompaniesCategories[index].companyId);
                                controller.categoryId = controller
                                    .rentalCategory
                                    .getCompaniesCategories[index]
                                    .id;
                                controller.categoryName = controller
                                    .rentalCategory
                                    .getCompaniesCategories[index]
                                    .name;

                                controller.passingIndex = index;
                                controller.companyId = controller.rentalCategory
                                    .getCompaniesCategories[index].companyId;

                                controller.update();
                              },
                              child: categoryWidget(
                                controller.passingIndex,
                                index,
                                controller.rentalCategory
                                    .getCompaniesCategories[index],
                                context,
                                controller.selectTime,
                              ),
                            );
                          })))
              : buildLoading(context),
          Container(
            child:
                !controller.isLoading && controller.categoryAttrData.isNotEmpty
                    ? buildCategoryAttribute()
                    : controller.categoryAttrData.isNotEmpty
                        ? buildLoading(context)
                        : Container(),
          ),
          Container(
              child:
                  !controller.isLoading && controller.packageBundle.isNotEmpty
                      ? buildBundlePackage()
                      : controller.packageBundle.isNotEmpty
                          ? buildLoading(context)
                          : Container())
        ],
      ),
    );
  }

  Widget buildFromToDate(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6.0,
              spreadRadius: 0.0,
              offset: Offset(0.0, 2.0),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        height: MediaQuery.of(context).size.height * .12,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.showSheet(context, buildDatePicker("from"),
                          () {
                        final value = DateFormat("yyyy-MM-dd")
                            .format(controller.fromDateTime);
                        controller.fromDate = value;
                        print(value);
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "From Date",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
                          Text(
                            DateFormat.yMMMd('en_US')
                                .format(controller.fromDateTime),
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            "${DateFormat('EEEE').format(controller.fromDateTime)}, ${DateFormat.jm().format(controller.fromDateTime)}",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Dash(
                    direction: Axis.vertical,
                    length: MediaQuery.of(context).size.height * .08,
                    dashLength: 2,
                    dashColor: Colors.grey,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.showSheet(context, buildDatePicker("to"), () {
                        final value = DateFormat("yyyy-MM-dd")
                            .format(controller.toDateTime);
                        controller.toDate = value;
                        print(value);
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "To Date",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
                          Text(
                            DateFormat.yMMMd('en_US')
                                .format(controller.toDateTime),
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            "${DateFormat('EEEE').format(controller.toDateTime)}, ${DateFormat.jm().format(controller.toDateTime)}",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPickupDrop(BuildContext context) {
    return GetBuilder<SearchController>(
        initState: (_) async {},
        builder: (_) => Padding(
              padding: EdgeInsets.only(top: 20, right: 20, left: 20),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 6.0,
                      spreadRadius: 0.0,
                      offset: Offset(0.0, 2.0),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                height: MediaQuery.of(context).size.height * .15,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              buildBottomSheet(context, "pickup");
                            },
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pickup Hub",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .01,
                                  ),
                                  Text(
                                    controller.pickupCity == null
                                        ? "Select pickup city"
                                        : controller.pickupCity,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .05,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      controller.pickupHub == null
                                          ? "Select pickup location"
                                          : controller.pickupHub,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Dash(
                            direction: Axis.vertical,
                            length: MediaQuery.of(context).size.height * .08,
                            dashLength: 2,
                            dashColor: Colors.grey,
                          ),
                          InkWell(
                            onTap: () {
                              buildBottomSheet(context, "drop");
                            },
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Return Hub",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .01,
                                  ),
                                  Text(
                                    controller.dropCity == null
                                        ? "Select drop city"
                                        : controller.dropCity,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .05,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      controller.dropHub == null
                                          ? "Select drop location"
                                          : controller.dropHub,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget buildDatePicker(String type) {
    return SizedBox(
      height: 180,
      child: CupertinoDatePicker(
          //initialDateTime: controller.dateTime,
          // minimumYear: ,
          // maximumYear: ,
          minimumDate: DateTime.now(),
          mode: CupertinoDatePickerMode.dateAndTime,
          onDateTimeChanged: (dateTime) {
            // _dobController.text=DateFormat("dd/MM/yyyy").format(dateTime).toString();
            print(dateTime);
            if (type == "from") {
              controller.fromDateTime = dateTime;
              controller.update();
            } else if (type == "to") {
              controller.toDateTime = dateTime;
              controller.update();
            }
          }),
    );
  }

  Future<void> buildBottomSheet(BuildContext context, String type) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return GetBuilder<SearchController>(
          builder: (_) => Container(
            height: 500,
            color: Colors.grey.shade300,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        type == "pickup"
                            ? "Select pickup locatoin"
                            : "Select drop locatoin",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.AVAILABILITY, arguments: 1);
                        },
                        child: Text(
                          "Home Delivery",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .apply(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                buildDropDown(context, type),
                controller.hubData.locationoncity != null
                    ? buildLocation(context, type)
                    : Container(),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 140, vertical: 10),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildDropDown(BuildContext context, String type) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.0, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton<Cities>(
                        underline: SizedBox(),
                        isExpanded: true,
                        hint: Text("Please select your  city"),
                        items:
                            controller.districtData.cities.map((Cities value) {
                          return DropdownMenuItem<Cities>(
                            value: value,
                            child: Text(
                              value.name,
                              textAlign: TextAlign.center,
                            ),
                          );
                        }).toList(),
                        value: controller.city,
                        onChanged: (val) async {
                          controller.city = val;
                          if (type == "pickup") {
                            controller.pickupCity = val.name;
                            controller.dropCity = val.name;

                            ///Select same as drop city
                          } else {
                            controller.dropCity = val.name;
                          }
                          controller.update();
                          await controller.getHub(int.parse(val.id));
                          print(val.name);
                        }),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLocation(BuildContext context, String type) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Select your nearest pick-up hub",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount: MediaQuery.of(context).orientation ==
                  //           Orientation.landscape
                  //       ? 5
                  //       : 3,
                  //   crossAxisSpacing: 8,
                  //   mainAxisSpacing: 1,
                  //   childAspectRatio: (5 / 2),
                  // ),
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.hubData.locationoncity.length,
                  itemBuilder: (contextList, index) {
                    return ChoiceChip(
                      label: Container(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Center(
                                child: Text(
                              controller
                                  .hubData.locationoncity[index].locationName,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: controller.selectedIndex == index
                                      ? Colors.white
                                      : Colors.black),
                            )),
                          )),
                      selectedShadowColor: Colors.black54,
                      selected: controller.selectedIndex == index
                          ? controller.locationSelected
                          : !controller.locationSelected,
                      onSelected: (bool value) {
                        controller.locationSelected = value;
                        controller.selectedIndex = index;
                        controller.update();
                        if (type == "pickup") {
                          controller.pickupHub = controller
                              .hubData.locationoncity[index].locationName;
                          controller.pickupHubId =
                              controller.hubData.locationoncity[index].id;
                          controller.pickupHub = controller
                              .hubData.locationoncity[index].locationName;
                          controller.dropHub = controller
                              .hubData.locationoncity[index].locationName;

                          ///setting same as drop location
                          controller.dropHubId =
                              controller.hubData.locationoncity[index].id;
                        } else {
                          controller.dropHub = controller
                              .hubData.locationoncity[index].locationName;
                          controller.dropHubId =
                              controller.hubData.locationoncity[index].id;
                        }
                        print(controller
                            .hubData
                            .locationoncity[controller.selectedIndex]
                            .locationName);
                      },
                      pressElevation: 8,
                      selectedColor: kPrimaryColor,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSearch(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50.0,
        child: new RawMaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          fillColor: kPrimaryColor,
          elevation: 0.0,
          child: Center(
              child: Text(
            "Search Rentals",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )),
          onPressed: () async {
            // Navigator.pop(context);
            print("From Date:${controller.fromDate}\n"
                " To date:${controller.toDate}\n"
                "pickup Hub:${controller.pickupHubId}\n"
                "drop Hub:${controller.dropHubId}\n"
                "Category Id :${controller.categoryId}\n"
                "Company ID:${controller.companyId}");

            // if (controller.fromDate != null &&
            //     controller.pickupHubId != null &&
            //     controller.categoryId != null &&
            //     controller.bundleId != null) {
            //   // await controller.getSearch();
            //   Get.toNamed(Routes.PRODUCTSEARCH, arguments: [
            //     controller.searchData,
            //     controller.fromDate,
            //     controller.toDate,
            //     controller.pickupHubId,
            //     controller.dropHubId,
            //     controller.categoryId,
            //     controller.bundleId,
            //     controller.pickupCity,
            //     controller.dropCity,
            //     controller.bundleName
            //   ]);

            ///   Product page calling
            // } else {
            //   Get.snackbar(
            //     "Missing !",
            //     "Some required fields are missing.",
            //     colorText: Colors.white,
            //     icon: Icon(Icons.assignment_late_outlined, color: Colors.white),
            //     snackPosition: SnackPosition.BOTTOM,
            //     backgroundColor: kPrimaryColor,
            //   );
            // }
          },
        ),
      ),
    );
  }

  Widget buildCarsHatch() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select Our Most Moving Hatchback",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.AVAILABLE_CARS, arguments: "Hatchback");
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      "View more >",
                      style: TextStyle(
                        fontSize: 10,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Container(
              height: 180,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: controller.cars
                    .map((car) => GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.BOOK_CAR, arguments: car);
                        },
                        child: buildCar(car, controller.cars.indexOf(car))))
                    .toList()
                    .reversed
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCarsSedan() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select Our Most Moving Sedan",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.AVAILABLE_CARS, arguments: "Sedan");
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      "View more >",
                      style: TextStyle(
                        fontSize: 10,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Container(
              height: 180,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: controller.cars
                    .map((car) => GestureDetector(
                        onTap: () {
                          // Get.toNamed(Routes.BOOK_CAR, arguments: car);
                        },
                        child: buildCar(car, controller.cars.indexOf(car))))
                    .toList()
                    .reversed
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCarsSuv() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select Our Most Moving SUV",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.AVAILABLE_CARS, arguments: "SUV");
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      "View more >",
                      style: TextStyle(
                        fontSize: 10,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Container(
              height: 180,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: controller.cars
                    .map((car) => GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.BOOK_CAR, arguments: car);
                        },
                        child: buildCar(car, controller.cars.indexOf(car))))
                    .toList()
                    .reversed
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2),
      child: Divider(
        color: Colors.grey.shade300,
      ),
    );
  }

  Widget buildCategoryAttribute() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Select a Type Of Your Prefered Vehicle',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: GetBuilder<HomeController>(
            builder: (_) => Container(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.categoryAttrData.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.selectedCarType = index;
                          controller.update();
                        },
                        child: Container(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0, vertical: 14),
                                    decoration: BoxDecoration(
                                        color:
                                            controller.selectedCarType == index
                                                ? kPrimaryColor
                                                : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(
                                      LineIcons.car,
                                      size: 40,
                                      color: controller.selectedCarType == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '${controller.categoryAttrData[index].name}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .apply(
                                            color: controller.selectedCarType ==
                                                    index
                                                ? kPrimaryColor
                                                : Colors.black,
                                          ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      );
                    })),
          ),
        ),
      ],
    );
  }

  Widget buildBundlePackage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Select KM Required As Per The Bundle Package',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              height: 35,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: controller.packageBundle.length,
                  itemBuilder: (context, index) {
                    return Theme(
                      data: ThemeData(brightness: Brightness.dark),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(width: 1, color: kPrimaryColor)),
                          child: FilterChip(
                            backgroundColor: Colors.grey.shade300,
                            label: Text(
                              controller.packageBundle[index].bundleName,
                            ),
                            labelStyle: TextStyle(
                                color: controller.hubIndex == index
                                    ? Colors.white
                                    : Colors.grey.shade700),
                            selected: controller.hubIndex == index ??
                                controller.selectRent,
                            selectedColor: kPrimaryColor,
                            onSelected: (bool val) {
                              controller.bundleId =
                                  controller.packageBundle[index].id;
                              controller.bundleName =
                                  controller.packageBundle[index].bundleName;
                              controller.selectRent = val;
                              controller.hubIndex = index;
                              controller.update();
                            },
                          ),
                        ),
                      ),
                    );
                  })),
        ),
      ],
    );
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
