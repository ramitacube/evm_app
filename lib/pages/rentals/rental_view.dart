import 'package:car_rental/models/booking_rental_model.dart';
import 'package:car_rental/pages/rentals/rental_controller.dart';
import 'package:car_rental/shared/widgets/drawer_widget.dart';
import 'package:car_rental/shared/widgets/loadingWidget.dart';
import 'package:car_rental/view_models/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../core.dart';

class RentalView extends GetView<RentalController> {
  const RentalView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        initState: (_) async {
          controller.model = Provider.of<UserViewModel>(context, listen: false);
          WidgetsBinding.instance.addPostFrameCallback(
              (_) async => await controller.model.getUser());
          controller.customerData = controller.model.customerData;
          print(controller.customerData.login.user.name);
          controller.customerData.login.user.id != null
              ? await controller
                  .getRental(controller.customerData.login.user.id)
              : null;
        },
        builder: (_) => Scaffold(
              key: controller.rentalScaffoldKey,
              backgroundColor: Colors.grey[200],
              drawer: DrawerWidget(
                controller: controller,
              ),
              body: Container(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.white,
                        height: 100,
                      ),
                      SafeArea(
                          child: SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          color: Colors.grey[200],
                          child: Column(
                            children: [
                              buildHeader(context),
                              buildBody(context),
                              GetBuilder<RentalController>(
                                init: RentalController(),
                                builder: (_) => buildActiveBody(),
                                // RAMIT COMMENT
                                // builder: (_) => controller.tabIndex == 0
                                //     ? !controller.isLoading &&
                                //             controller.rentalData.rental != null
                                //         ? controller.rentalData.rental != null
                                //             ? buildActiveBody()
                                //             : Container(
                                //                 child: Padding(
                                //                   padding:
                                //                       const EdgeInsets.only(
                                //                           top: 100.0),
                                //                   child: Text("No items found"),
                                //                 ),
                                //               )
                                //         // buildActiveBody()
                                //         //       : controller.rentalData.rental!=null
                                //         //         ? Container(
                                //         //   child: Padding(
                                //         //     padding: const EdgeInsets.only(top: 100.0),
                                //         //     child: Text("No items found"),
                                //         //   ),
                                //         // )
                                //         : buildLoading(context)
                                //     : buildCompleteBody(context),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ],
                  )),
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

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 10, bottom: 10),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "My Booking",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBar(
              indicatorColor: Colors.amber,
              controller: controller.tabController,
              isScrollable: false,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: EdgeInsets.only(
                  left: controller.tabIndex == 0 ? 5 : 0,
                  right: controller.tabIndex == 0 ? 0 : 5),
              indicatorPadding: EdgeInsets.all(0),
              indicatorWeight: 0,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: kPrimaryColor),
              tabs: [
                Container(
                  width: MediaQuery.of(context).size.height * .25,
                  height: MediaQuery.of(context).size.height * .05,
                  child: Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(12, 13, 52, 0.05),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Active Booking"),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.height * .25,
                  height: MediaQuery.of(context).size.height * .05,
                  child: Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(12, 13, 52, 0.05),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Completed Trip"),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ],
    );
  }

  Widget buildActiveBody() {
    return Column(
      children: [
        ListView.builder(
            itemCount: 1,
            // itemCount: controller.rentalData.rental.length,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              // controller.update();
              return buildBookingWidget(context
                  // imageUrl:
                  //     'https://www.evmwheels.com/evm_wheels_backend/assets/images/vehicle_variant/redigo.jpeg',
                  // name: "controller.rentalData.rental[index].products.name",
                  // rentals: controller.rentalData.rental[index],
                  // // rentals: controller.rentalData.rental[index],
                  // context: context
                  );
              // return Text("No Active Booking");
            }),
      ],
    );
  }

  Widget buildCompleteBody(context) {
    var noComplete = true;
    return noComplete
        ? Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No Completed Trip",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [],
            ),
          );
  }

  Widget buildBookingWidget(BuildContext context
      // {String name, String imageUrl, Rentals rentals, BuildContext context}) {
      ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 0, right: 8),
                      // color: Colors.blue,
                      child: Image.network(
                        // '$imageUrl',
                        'https://evm-backend.s3.ap-south-1.amazonaws.com/product/1641799872558WagonR%28MT%29.png',
                        height: 150,
                        width: 150,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            "Maruti Suzuki Wagon R (MT)",
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15),
                          ),
                        ),
                        Container(
                          // color: Colors.red,
                          margin: EdgeInsets.only(bottom: 10, top: 5),
                          width: 150,
                          child: SmoothStarRating(
                              allowHalfRating: false,
                              onRated: (v) {
                                controller.rating = v;
                                controller.update();
                              },
                              starCount: 5,
                              rating: controller.rating,
                              size: 30.0,
                              isReadOnly: false,
                              // fullRatedIconData: Icons.blur_off,
                              // halfRatedIconData: Icons.blur_on,
                              color: Colors.yellow[600],
                              borderColor: Colors.yellow[600],
                              spacing: 0.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                    height: 15,
                                    width: 15,
                                    child: Image.asset(
                                      "assets/images/icons/seat.png",
                                      fit: BoxFit.fill,
                                    )),
                                Text("5 seater",
                                    // rentals.products.productAttrs.length > 1
                                    //     ? rentals.products.productAttrs[1]
                                    //         .headValue.name
                                    //     : "null",
                                    style: TextStyle(fontSize: 10)),
                              ],
                            ),
                            SizedBox(width: 15),
                            Column(
                              children: [
                                Container(
                                    height: 15,
                                    width: 15,
                                    child: Image.asset(
                                      "assets/images/icons/gearbox.png",
                                      fit: BoxFit.fill,
                                    )),
                                Text("Manual",
                                    // rentals.products.productAttrs.length == 4
                                    //     ? rentals.products.productAttrs.length >
                                    //             3
                                    //         ? rentals.products.productAttrs[3]
                                    //             .headValue.name
                                    //         : "null"
                                    //     : rentals.products.productAttrs.length >
                                    //             2
                                    //         ? rentals.products.productAttrs[2]
                                    //             .headValue.name
                                    //         : "null",
                                    style: TextStyle(fontSize: 10)),
                              ],
                            ),
                            SizedBox(width: 15),
                            Column(
                              children: [
                                Container(
                                    height: 15,
                                    width: 15,
                                    child: Image.asset(
                                      "assets/images/icons/fuel.png",
                                      fit: BoxFit.fill,
                                    )),
                                Text(
                                  "Petrol",
                                  // rentals.products.productAttrs.isNotEmpty
                                  //     ? rentals.products.productAttrs[0]
                                  //         .headValue.name
                                  //     : "null",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // SizedBox(height: 17),
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kochi",
                        // rentals.rentalDetails != null
                        //     ? rentals
                        //         .rentalDetails.pickupLocationId.locationName
                        //     : "null",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "Maradu/EVM Volkswagon",
                        // rentals.rentalDetails != null
                        //     ? rentals
                        //         .rentalDetails.pickupLocationId.locationName
                        //     : "null",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/icons/green_signIn.png',
                            scale: 2.5,
                          ),
                          SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "12-12-2022",
                                // rentals.rentalDetails != null
                                //     ? rentals.rentalDetails.pickupDate
                                //     : "null",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 10),
                              ),
                              Text(
                                '03: 30 PM',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 10),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/images/icons/roundabout.png",
                    scale: 4.5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kochi",
                        // rentals.rentalDetails != null
                        //     ? rentals.rentalDetails.dropLocationId.locationName
                        //     : "null",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "Maradu/EVM Volkswagon",
                        // rentals.rentalDetails != null
                        //     ? rentals.rentalDetails.dropLocationId.locationName
                        //     : "null",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/icons/red_signIn.png',
                            scale: 2.5,
                          ),
                          SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "13-12-2022",
                                // rentals.rentalDetails != null
                                //     ? rentals.rentalDetails.dropDate
                                //     : "null",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 10),
                              ),
                              Text(
                                '06: 30 PM',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 10),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // Text(
                                //   "3 days 3 hours",
                                //   style: TextStyle(
                                //     color: Colors.white,
                                //     fontSize: 12,
                                //   ),
                                // ),
                                Text(
                                  "Invoice Amount",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "₹ 5426",
                                  // rentals?.rentalDetails?.rentalDetailRates !=
                                  //         null
                                  //     ? "      INR " +
                                  //         rentals.rentalDetails
                                  //             .rentalDetailRates.subTotal
                                  //             .toString()
                                  //     : "null",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    // fontSize: 16,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
