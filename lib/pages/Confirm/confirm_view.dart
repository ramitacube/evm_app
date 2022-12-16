import 'package:car_rental/models/rental_details_model.dart';
import 'package:car_rental/pages/Confirm/confirm_booking_controller.dart';
import 'package:car_rental/shared/styles/colors.dart';
import 'package:car_rental/shared/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ConfirmationView extends GetView<ConfirmationController> {
  final details = Get.arguments as RentalDetailsData;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfirmationController>(
        builder: (_) => Scaffold(
              key: controller.confirmScaffoldKey,
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
                            buildBody(context),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                  "Click here to download this confirmation as PDF.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .apply(color: kPrimaryColor)),
                            )
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
                  // onTap: () {
                  //   Get.toNamed(Routes.AVAILABILITY);
                  // },
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
          //borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 17),
            Text(
              "Booking Confirmed !",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .apply(color: kPrimaryColor),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
                "Rental Number: " +
                    details.createRentalDetails[0].rentalId.toString(),
                style: Theme.of(context).textTheme.bodyText2),
            Text(
                "Date of Booking: ${details.createRentalDetails[0].rentalDate}",
                style: Theme.of(context).textTheme.bodyText2),
            // Text("Inventory Number: WH000123",
            //     style: Theme.of(context).textTheme.bodyText2),
            SizedBox(
              height: 16,
            ),
            Text(
                "Inventory Details: ${details.createRentalDetails[0].rentalProduct.name},"
                "${details.createRentalDetails[0].rentalProduct.productAttrs[1].headValue}, "
                "${details.createRentalDetails[0].rentalProduct.productAttrs[0].headValue},"
                " ${details.createRentalDetails[0].rentalProduct.productAttrs[3].headValue}",
                style: Theme.of(context).textTheme.bodyText2),
            SizedBox(
              height: 16,
            ),
            Text(
                "Daily Tariff details: INR ${details.createRentalDetails[0].baseRate} per day.",
                style: Theme.of(context).textTheme.bodyText2),
            // Text("Maximum Kms: 120",
            //     style: Theme.of(context).textTheme.bodyText2),
            Text(
                "Additional km charge: INR ${details.createRentalDetails[0].additinalKmRate} per Km.",
                style: Theme.of(context).textTheme.bodyText2),
            SizedBox(
              height: 16,
            ),
            Text("Booking From: ${details.createRentalDetails[0].pickupDate}.",
                style: Theme.of(context).textTheme.bodyText2),
            Text("Pickup From: ${details.createRentalDetails[0].pickup}.",
                style: Theme.of(context).textTheme.bodyText2),
            Text("Booking To: ${details.createRentalDetails[0].dropDate}.",
                style: Theme.of(context).textTheme.bodyText2),
            Text("Drop Location: ${details.createRentalDetails[0].drop}.",
                style: Theme.of(context).textTheme.bodyText2),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return Container(
      height: 100,
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
                    "5 Days",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "INR 8750.00",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Amount inclusive of 18% GST",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Pay Now",
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
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [],
          )
        ],
      ),
    );
  }
}
