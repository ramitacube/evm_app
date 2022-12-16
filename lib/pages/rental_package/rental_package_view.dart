import 'package:car_rental/pages/rental_package/rental_package_controller.dart';
import 'package:car_rental/shared/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import '../../core.dart';

class PackageView extends GetView<PackageController> {
  // final dealer = Get.arguments as Dealer;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PackageController>(
      builder: (_) => Scaffold(
        key: controller.rentPackScaffoldKey,
        drawer: DrawerWidget(
          controller: controller,
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.white,
              height: 100,
            ),
            SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  // decoration: BoxDecoration(color: Colors.grey[200]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildHeader(context),
                      buildTopBody(context),
                      buildFromToDate(context),
                      buildCarsHatch(),
                      buildDivider(),
                      buildCarsSedan(),
                      buildDivider(),
                      buildCarsSuv()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
              membership: controller.userProfile.membership,
              progress: controller.userProfile.progress,
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

  Widget buildFromTo(BuildContext context) {
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
            Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        height: MediaQuery.of(context).size.height * .17,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.showSheet(context, buildDatePicker("from"), () {
                      final value = DateFormat("dd/MM/yyyy")
                          .format(controller.fromDateTime);
                      print(value);
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "From",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        Text(
                          DateFormat.yMMMd('en_US')
                              .format(controller.fromDateTime),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "${DateFormat('EEEE').format(controller.fromDateTime)}, ${DateFormat.jm().format(controller.fromDateTime)}",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                Dash(
                  direction: Axis.vertical,
                  length: MediaQuery.of(context).size.height * .09,
                  dashLength: 2,
                  dashColor: Colors.grey,
                ),
                GestureDetector(
                  onTap: () {
                    controller.showSheet(context, buildDatePicker("to"), () {
                      final value = DateFormat.yMMMd('en_US')
                          .format(controller.toDateTime);
                      print(value);
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "To",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        Text(
                          DateFormat.yMMMd('en_US')
                              .format(controller.toDateTime),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "${DateFormat('EEEE').format(controller.toDateTime)}, ${DateFormat.jm().format(controller.toDateTime)}",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(" Rent anything for this day "),
                Text(
                  "Go >",
                  style: TextStyle(color: kPrimaryColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildRentalPackage() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GetBuilder<HomeController>(
            // initState: (_)=>controller.getRentalPackage(),
            builder: (_) => Container(
                height: 35,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.rentalPackages.length,
                    itemBuilder: (context, index) {
                      return Theme(
                        data: ThemeData(brightness: Brightness.dark),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: FilterChip(
                            backgroundColor: Colors.grey.shade300,
                            // avatar: CircleAvatar(
                            //   backgroundColor: Colors.cyan,
                            //   child: Text(company.name[0].toUpperCase(),style: TextStyle(color: Colors.white),),
                            // ),
                            label: Text(
                              controller.rentalPackages[index],
                            ),
                            // labelStyle: TextStyle(color: Colors.black),
                            selected: controller.selectedIndex == index
                                ? controller.selectRent
                                : !controller.selectRent,
                            selectedColor: kPrimaryColor,
                            onSelected: (bool val) {
                              controller.selectRent = val;
                              controller.selectedIndex = index;
                              controller.update();
                            },
                          ),
                        ),
                      );
                    })
                // !controller.isLoading
                //     ? ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     shrinkWrap: true,
                //     itemCount:
                //     controller.rentalPackage.rentalPackages.data.length,
                //     itemBuilder: (context, index) {
                //       return GestureDetector(
                //         onTap: () {
                //           controller.indexPackage = index;
                //           controller.update();
                //           print("Index==$index");
                //         },
                //         child: buildRentalPackageWidget(
                //             controller
                //                 .rentalPackage.rentalPackages.data[index],
                //             controller.indexPackage,
                //             index),
                //       );
                //     })
                //
                //     : Container(
                //   child: Center(
                //     child: SpinKitThreeBounce(
                //       color: kPrimaryColor,
                //       size: 20.0,
                //       //controller: AnimationController(vsync: this,duration: const Duration(milliseconds: 1200)),
                //
                //     ),
                //   ),
                // ),
                ),
          ),
        ),
      ],
    );
  }

  // Widget buildCategories() {
  //   return Column(
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.all(16),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               "Categories",
  //               style: TextStyle(
  //                 fontSize: 22,
  //                 fontWeight: FontWeight.w400,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(left: 8.0),
  //         child: Container(
  //           height: 110,
  //           child: ListView(
  //             physics: BouncingScrollPhysics(),
  //             scrollDirection: Axis.horizontal,
  //             children: controller.dealers
  //                 .map((dealer) => GestureDetector(
  //                 onTap: () {
  //                   controller.selectTime = true;
  //                   controller.update();
  //                   //Get.toNamed(Routes.BOOK_CAR, );
  //                 },
  //                 child: buildDealer(dealer, controller.selectTime,
  //                     controller.dealers.indexOf(dealer))))
  //                 .toList(),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget buildCarsListing() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Deals",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Container(
            height: 190,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: controller.cars
                  .map((car) => GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.BOOK_CAR, arguments: car);
                      },
                      child: buildCar(car, controller.cars.indexOf(car))))
                  .toList(),
            ),
          ),
        ),
      ],
    );
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

  Widget buildTopBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                controller.selected1 = !controller.selected1;
                controller.update();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: controller.selected1 ? kPrimaryColor : Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                //padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(right: 12, left: 12),
                width: 70,
                height: 70,
                child: Column(
                  children: [
                    Icon(
                      LineIcons.car,
                      size: 48,
                      color: controller.selected1 ? Colors.white : Colors.black,
                    ),
                    Text(
                      'Rent a Cab',
                      style: TextStyle(
                          color: controller.selected1
                              ? Colors.white
                              : Colors.black),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.selected2 = !controller.selected2;
                controller.update();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: controller.selected2 ? kPrimaryColor : Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                //padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(right: 12, left: 12),
                width: 70,
                height: 70,
                child: Column(
                  children: [
                    Icon(
                      LineIcons.biking,
                      size: 48,
                      color: controller.selected2 ? Colors.white : Colors.black,
                    ),
                    Text(
                      'Rent a Bike',
                      style: TextStyle(
                          color: controller.selected2
                              ? Colors.white
                              : Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(child: buildCarRentalPackage()),
        Container(child: buildBikeRentalPackage())
      ],
    );
  }

  Widget buildCarRentalPackage() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GetBuilder<HomeController>(
            // initState: (_)=>controller.getRentalPackage(),
            builder: (_) => Container(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.carRentalPackages.length,
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
                                        horizontal: 8.0, vertical: 5),
                                    decoration: BoxDecoration(
                                        color:
                                            controller.selectedCarType == index
                                                ? kPrimaryColor
                                                : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(
                                      LineIcons.car,
                                      size: 48,
                                      color: controller.selectedCarType == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '${controller.carRentalPackages[index]}',
                                    style: TextStyle(
                                      color: controller.selectedCarType == index
                                          ? kPrimaryColor
                                          : Colors.black,
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

  Widget buildBikeRentalPackage() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GetBuilder<HomeController>(
            // initState: (_)=>controller.getRentalPackage(),
            builder: (_) => Container(
                height: 35,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.rentalPackages.length,
                    itemBuilder: (context, index) {
                      return Theme(
                        data: ThemeData(brightness: Brightness.dark),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: FilterChip(
                            backgroundColor: Colors.grey.shade300,
                            label: Text(
                              controller.rentalPackages[index],
                            ),
                            selected: controller.selectedIndex == index
                                ? controller.selectRent
                                : !controller.selectRent,
                            selectedColor: kPrimaryColor,
                            onSelected: (bool val) {
                              controller.selectRent = val;
                              controller.selectedIndex = index;
                              controller.update();
                            },
                          ),
                        ),
                      );
                    })),
          ),
        ),
      ],
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
            Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        height: MediaQuery.of(context).size.height * .17,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.showSheet(context, buildDatePicker("from"), () {
                      final value = DateFormat("dd/MM/yyyy")
                          .format(controller.fromDateTime);
                      print(value);
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "From",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        Text(
                          DateFormat.yMMMd('en_US')
                              .format(controller.fromDateTime),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "${DateFormat('EEEE').format(controller.fromDateTime)}, ${DateFormat.jm().format(controller.fromDateTime)}",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                Dash(
                  direction: Axis.vertical,
                  length: MediaQuery.of(context).size.height * .09,
                  dashLength: 2,
                  dashColor: Colors.grey,
                ),
                GestureDetector(
                  onTap: () {
                    controller.showSheet(context, buildDatePicker("to"), () {
                      final value = DateFormat.yMMMd('en_US')
                          .format(controller.toDateTime);
                      print(value);
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "To",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        Text(
                          DateFormat.yMMMd('en_US')
                              .format(controller.toDateTime),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "${DateFormat('EEEE').format(controller.toDateTime)}, ${DateFormat.jm().format(controller.toDateTime)}",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(" Rent anything for this day "),
                Text(
                  "Go >",
                  style: TextStyle(color: kPrimaryColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildCarsHatch() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Most Moving Hatchbacks",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.AVAILABLE_CARS, arguments: "Hatchbacks");
                },
                child: Text(
                  "View more >",
                  style: TextStyle(
                    fontSize: 10,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w400,
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
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              //   crossAxisSpacing: 5.0,
              //   mainAxisSpacing: 10.0,
              // ),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: controller.cars
                  .map((car) => GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.BOOK_CAR, arguments: car);
                      },
                      child: buildCar(car, controller.cars.indexOf(car))))
                  .toList(),
            ),
            // GridView(
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     crossAxisSpacing: 5.0,
            //     mainAxisSpacing: 10.0,
            //   ),
            //   physics: BouncingScrollPhysics(),
            //   scrollDirection: Axis.vertical,
            //   children: controller.cars
            //       .map((car) => GestureDetector(
            //           onTap: () {
            //             Get.toNamed(Routes.BOOK_CAR, arguments: car);
            //           },
            //           child: buildCar(car, controller.cars.indexOf(car))))
            //       .toList(),
            // ),
          ),
        ),
      ],
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
                  "Most Moving Sedan",
                  style: TextStyle(
                    fontSize: 22,
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
                  "Most Moving SUV",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.AVAILABLE_CARS, arguments: "SUV");
                    },
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
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2,
                //   crossAxisSpacing: 5.0,
                //   mainAxisSpacing: 10.0,
                // ),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: controller.cars
                    .map((car) => GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.BOOK_CAR, arguments: car);
                        },
                        child: buildCar(car, controller.cars.indexOf(car))))
                    .toList(),
              ),
              // GridView(
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 5.0,
              //     mainAxisSpacing: 10.0,
              //   ),
              //   physics: BouncingScrollPhysics(),
              //   scrollDirection: Axis.vertical,
              //   children: controller.cars
              //       .map((car) => GestureDetector(
              //           onTap: () {
              //             Get.toNamed(Routes.BOOK_CAR, arguments: car);
              //           },
              //           child: buildCar(car, controller.cars.indexOf(car))))
              //       .toList(),
              // ),
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
}
