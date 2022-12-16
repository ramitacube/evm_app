import 'package:car_rental/shared/widgets/drawer_widget.dart';
import 'package:car_rental/view_models/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:car_rental/shared/styles/colors.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../core.dart';

class BookCarView extends GetView<BookCarController> {
  final products = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.product = products[0];
    controller.days = products[1];
    controller.pickUpDate = products[2];
    controller.pickUpId = products[3];
    controller.dropDate = products[4];
    controller.dropId = products[5];
    controller.pickupCity = products[6];
    controller.dropCity = products[7];
    controller.categoryAttribute = products[8];
    controller.bundleName = products[9];
    controller.bundleId = products[10];

    return GetBuilder<ProfileController>(
        initState: (_) {
          controller.model = Provider.of<UserViewModel>(context, listen: false);
          WidgetsBinding.instance
              .addPostFrameCallback((_) => controller.model.getUser());
          controller.customerData = controller.model.customerData;
          print(controller.customerData.login.user.name);
        },
        builder: (_) => Scaffold(
              key: controller.bookScaffoldKey,
              drawer: DrawerWidget(
                controller: controller,
              ),
              backgroundColor: Colors.grey[200],
              body: Stack(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildHeader(context),
                            // buildFromToDate(context),
                            buildBasics(context),
                            buildBody(context),
                            buildTripDetails(context),
                            buildFareDetails(context),
                            buildRemarks(context),
                            buildService(context),
                            buildTerms(context)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: buildFooter(context),
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
              membership: "Gold",
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
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          "Palarivattom",
                          style: Theme.of(context).textTheme.subtitle2,
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

  Widget buildFromToDate(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 20),
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
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: MediaQuery.of(context).size.height * .125,
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
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          "${DateFormat('EEEE').format(controller.fromDateTime)}, ${DateFormat.jm().format(controller.fromDateTime)}",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700),
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
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          "${DateFormat('EEEE').format(controller.toDateTime)}, ${DateFormat.jm().format(controller.toDateTime)}",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBasics(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 10),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              // height: MediaQuery.of(context).size.height * .12,
              //width: MediaQuery.of(context).size.width * .2,
              child: Text(
                controller.categoryAttribute,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .apply(color: Colors.white),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              // height: MediaQuery.of(context).size.height * .12,
              //width: MediaQuery.of(context).size.width * .2,
              child: Text(
                controller.bundleName,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .apply(color: Colors.white),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     color: kPrimaryColor,
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(15),
            //     ),
            //   ),
            //   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            //   // height: MediaQuery.of(context).size.height * .12,
            //   //width: MediaQuery.of(context).size.width * .2,
            //   child: Text(
            //     controller.bundleName,
            //     style: Theme.of(context)
            //         .textTheme
            //         .subtitle1
            //         .apply(color: Colors.white),
            //   ),
            // ),
            // Text(
            //   "Edit",
            //   style: Theme.of(context)
            //       .textTheme
            //       .subtitle1
            //       .apply(color: kPrimaryColor),
            // ),
          ],
        ));
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 17),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: controller.product.documentUrl != null
                  ? Image.network(
                      controller.product.documentUrl,
                      fit: BoxFit.scaleDown,
                    )
                  : Image.asset(
                      "assets/images/cars/car.jpg",
                      fit: BoxFit.fitWidth,
                    ),
            ),
            SizedBox(height: 17),
            Text(
              controller.product.name,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          "assets/images/icons/seat.png",
                          fit: BoxFit.fill,
                        )),
                    Text(
                      controller.product.productAttrs.length > 1
                          ? controller.product.productAttrs[1].headValue
                          : "null",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          "assets/images/icons/gearbox.png",
                          fit: BoxFit.fill,
                        )),
                    Text(
                      controller.product.productAttrs.length > 2
                          ? controller.product.productAttrs[2].headValue
                          : "null",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          "assets/images/icons/fuel.png",
                          fit: BoxFit.fill,
                        )),
                    Text(
                      controller.product.productAttrs.isNotEmpty
                          ? controller.product.productAttrs[0].headValue
                          : "null",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${controller.product.baseRate.toString()}.00",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                // fontSize: 16,
                              ),
                            ),
                            Text(
                              "per day",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                // fontSize: 16,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTripDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Trip Details",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "PickUp Date",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(':'),
                        Text(
                          DateFormat('dd MM yyyy').format(
                              DateTime.parse(controller.pickUpDate.toString())),
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        Text("    "),
                        Text(
                          DateFormat('jm').format(DateTime.parse(
                              controller.fromDateTime.toString())),
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "DropOff Date",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(':'),
                        Text(
                          DateFormat('dd MM yyyy').format(
                              DateTime.parse(controller.dropDate.toString())),
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        Text("    "),
                        Text(
                          DateFormat('jm').format(
                              DateTime.parse(controller.toDateTime.toString())),
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Free Kilometers",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(':'),
                        Text(
                          '                        ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Pickup City",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(':'),
                        Text(
                          controller.pickupCity,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Return City",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(':'),
                        Text(
                          controller.dropCity,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Total Duration",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(':'),
                        Text(
                          '${DateTime.parse(controller.dropDate).difference(DateTime.parse(controller.pickUpDate)).inDays}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        )
                      ],
                    ),
                  ]))
        ],
      ),
    );
  }

  Widget buildFareDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Fare Details",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Base Rate",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(':'),
                        Text("${controller.product.baseRate.toString()}.00")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery Charges",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(':'),
                        Text("    "),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Insurance & GST",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(':'),
                        Text(
                          'Included',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Refundable security deposit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(':'),
                        Text(
                          ' ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Location Changes Charges",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(':'),
                        Text(
                          ' ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Apply Promocode",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(':'),
                        Text(
                          ' ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(':'),
                        Text(
                          (controller.product.baseRate *
                                      (controller.days > 0
                                          ? controller.days
                                          : 1))
                                  .toString() +
                              ".00",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        )
                      ],
                    ),
                  ]))
        ],
      ),
    );
  }

  Widget buildRemarks(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Customer Remarks",
                style: Theme.of(context).textTheme.bodyText1,
              )),
          TextFormField(
            minLines: 4,
            maxLines: 6,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              focusColor: kPrimaryColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              contentPadding: EdgeInsets.all(12),
              // hintText: "",
              // labelText: "Add your delivery address"
            ),
          ),
        ]));
  }

  Widget buildService(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Airline/Train Service",
                style: Theme.of(context).textTheme.bodyText1,
              )),
          Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text('Customer Name',
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  TextFormField(
                    // maxLines: 2,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusColor: kPrimaryColor,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      contentPadding: EdgeInsets.all(12),
                      // hintText: "",
                      // labelText: "Add your delivery address"
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text('Choose Airline/Train',
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  TextFormField(
                    // maxLines: 2,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusColor: kPrimaryColor,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      contentPadding: EdgeInsets.all(12),
                      // hintText: "",
                      // labelText: "Add your delivery address"
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text('Arrival/Departure',
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  TextFormField(
                    // maxLines: 2,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusColor: kPrimaryColor,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      contentPadding: EdgeInsets.all(12),
                      // hintText: "",
                      // labelText: "Add your delivery address"
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text('Flight/Train Number',
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  TextFormField(
                    // maxLines: 2,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusColor: kPrimaryColor,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      contentPadding: EdgeInsets.all(12),
                      // hintText: "",
                      // labelText: "Add your delivery address"
                    ),
                  ),
                ],
              )),
        ]));
  }

  Widget buildTerms(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Terms & conditions",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "View all",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .apply(color: kPrimaryColor, fontSizeDelta: -10),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpansionTile(
                  title: Text(
                    "TERMS & CONDITIONS",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onExpansionChanged: (val) {
                    val = !val;
                    // controller.update();
                  },
                  children: [
                    Text(
                        '**Refundable Security Deposit** The refundable security deposit will be charged according to the vehicle model. During limited-period offers, this amount may vary. It will be refunded within 7 working days of completing the rental transactions after deduction, if any, like additional kilometer charges, fastag charges, fuel charges, cost of damage, traffic violation charges etc. **Extra KMs Charges** You can select from the various per-day KM options we provide, like 150 KM/ 300 KM or Unlimited. If you exceed the total allowed kilometers (per day KM x No of days) extra kilometer charges will be applicable at different rates depending on the type of vehicles except for the Unlimited KM option. **Fuel charges** The rental amount is without fuel. You have to maintain the same level of fuel at delivery time, while returning the vehicle. If the fuel is at a lower level at the drop off time, you have the option to top up the fuel or pay us the cost of fuel used. **Flexible Pricing** Our pricing system including the rent, refundable security deposit, delivery/drop-off charges and other location drop off charges are calculated dynamically and vary from time to time. The total amount payable for a selected vehicle and period will be valid only for a limited time. **Modifications on bookings** Any changes made within 24 hours of the booking start time, will attract a charge of 10% of the rental or Rs.300/- whichever is higher and the higher online fare at that time will be added, if applicable. **No Extension Permitted** Customers should return the vehicle on or before the drop-off time as per the rental agreement, as the same vehicle may have another booking commitment immediately. However, due to an unavoidable situation, in which he/she is unable to return the vehicle on time, the user has to inform us well in advance, to avoid immobilisation of the vehicle by the software. However, the company reserves the right to permit the customer for a new booking from the drop-off time with applicable rates at that time, subject to approval after physical inspection of the vehicle, by an executive of EVM Group and the customer transferring the full payment for the new booking in advance. The minimum charge applicable for extension/late drop-off will be half-day rental amount. **Cancellation Terms** Charges applicable for cancelling a confirmed booking will be as below. Above 15 days: 10% of the rental Within 15 days to 10 days: 15% of the rental Within 10 days to 05 days: 20% of the rental Within 05 days to 01 day: 25% of the rental Within 24 hrs: 40% of the rental No-Show at the delivery time: 50% of rental The security deposit will be refunded fully at any stage of cancellation. EVM Wheels reserves the right to accept, reject or cancel any rental contract without assigning any reason. **Limited Liability of Customer** In the event of any damages to the vehicle, user liability is limited to a maximum of INR 10,000 (Ten thousand only). User have to pay the damage repair cost as estimated by an authorized dealership and downtime losses, up to a maximum of INR 10,000. This is independent of the nature and terms of the insurance cover that EVM Wheels has on the cars. Please note that the maximum liability policy is intended to benefit and protect the responsible user. **Limited Liability Inapplicable** In situations of irresponsible, unsafe, or negligent usage, there could be discretionary exceptions to this policy, whereby the user will be liable for all damages irrespective of whether or not EVM Wheels is able to claim insurance in such cases. Examples of such situations include, but are not limited to: · When the user is not in compliance with the laws of the land or with terms of the agreement · When the user is found to be under the influence of alcohol or narcotics while driving · When the user is in violation of any rules in the Motor Vehicles Act. · When the person driving the vehicle at the time of the incident is found to be different from the person who made the booking or signed the agreement at delivery time. · When the workshop /insurance company denies the consequential damages. · Where there is evidence of rash and negligent driving by the user · When the incident happened in a state for which the user had failed to pay the inter-state tax and get the special permit while entering the state. · When the vehicle is misused or involved in criminal cases during the rental period, the insured value of the vehicle and the compensation amount will have to be paid by the customer, separately to the company. ·If necessary this digital agreement and these rental terms can be used as evidence before any courts in India. In case of an accident during the rental period, the user is responsible for informing EVM Wheels immediately and follow the instructions of the Executive, which includes the intimation to the insurance company. A spot survey has to be carried out by the Insurance Surveyor, before moving the vehicle from the accident spot. If an FIR is not registered by the Police, the user has to get a copy of the General Diary(GD) entry from the nearest Police Station. Failure to produce the GD entry copy and original driving license of the driver at the time of accident for insurance claim, will be treated as a breach of contract regarding limited liability and the user will be liable to pay the full amount for the repair works and downtime. EVM Wheels reserves the right to initiate legal action, to recover the entire loss incurred by the company, in case the user fails to comply with the above terms of the rental agreement In case of an accident, the user will not be eligible for the refund of unused days/hours. **Shortening the rental period** We can try arranging an earlier pickup of the car if you inform us at least 3 hours prior to the agreed drop-off time or the user can do it by themself. However, no charges or refunds will be applicable to the base fare for the original trip. Advance return policy 50% of the rent amount for the unused period will be refunded for returning the vehicle, after one month of usage, with prior intimation not less than 15 days. However, no refund will be made for non-usage, if the vehicle is returned within 30 days after delivery. **Penalties** To deliver a smooth and pleasant experience to all our users, we request them to follow the norms below. Breach of these will attract the penalties mentioned against them: Original Driving license & Identity proof (Aadhaar/Pan/Passport) not produced at the time of delivery This will be treated as a No-Show and 50% of the rental amount will be deducted. The remaining 50% and the security amount will be refunded in 5 working days. ##### **Traffic/Parking violations** Full payment of traffic fines and late fees, including cases where we receive notices after the end of booking. Users have to pay it by themself immediately and send a receipt to us OR pay INR 500 extra for each case. Over-speeding (above 80 KMs/Hr) INR 1500 will be charged for each over speeding event based on the Govt approved GPS device fitted on the vehicle. Upon repeated over-speeding, software will withdraw services to the user and the vehicle will get immobilised automatically. Customer have to bear the expenses related to these violations and the charges for mobilising the vehicle. Charge for smoking inside the car/ Interior damage/ Lost Key INR 1000, plus applicable damage costs related to damages. Cleaning Required (Interiors) Minor cleaning - INR 500. Major cleaning - INR 2000. The vehicle returned to another location different from the agreement. Different location charges applicable in the software and late penalty for the additional hours, if applicable, till the vehicle is returned to the drop off location in the agreement. I agree that, I have read all the information above and the terms and conditions included in the contract and I am bound to abide them. I hereby agree to put my signature here digitally.')
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Cancellation Policy",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onExpansionChanged: (val) {
                    val = !val;
                    // controller.update();
                  },
                  children: [
                    Text(
                        '**Refundable Security Deposit** The refundable security deposit will be charged according to the vehicle model. During limited-period offers, this amount may vary. It will be refunded within 7 working days of completing the rental transactions after deduction, if any, like additional kilometer charges, fastag charges, fuel charges, cost of damage, traffic violation charges etc. **Extra KMs Charges** You can select from the various per-day KM options we provide, like 150 KM/ 300 KM or Unlimited. If you exceed the total allowed kilometers (per day KM x No of days) extra kilometer charges will be applicable at different rates depending on the type of vehicles except for the Unlimited KM option. **Fuel charges** The rental amount is without fuel. You have to maintain the same level of fuel at delivery time, while returning the vehicle. If the fuel is at a lower level at the drop off time, you have the option to top up the fuel or pay us the cost of fuel used.')
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Highway toll, Inter-state tax & parking charges",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.145,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.days == 0
                        ? "1 Day"
                        : controller.days.toString() + " Days",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "INR " +
                        (controller.product.baseRate *
                                (controller.days > 0 ? controller.days : 1))
                            .toString() +
                        ".00",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () async {
                  bool result = await controller.createRentals();
                  if (result == true) {
                    print(controller.rentalDetailsData);
                    Get.toNamed(Routes.CONFIRMATION,
                        arguments: controller.rentalDetailsData);
                  }
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          // fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "click here to pre-book & send quotation to your mail",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .apply(color: kPrimaryColor),
          ),
        ],
      ),
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
}
