import 'package:car_rental/core.dart';
import 'package:car_rental/routes/app_pages.dart';
import 'package:car_rental/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_rental/shared/styles/colors.dart';
import 'package:provider/provider.dart';

import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              buildCarousel(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              buildDot(context),
              buildButton(context),
            ],
          )),
    );
  }

  Widget buildCarousel(BuildContext context) {
    return Center(
      child: Container(
        // color: Colors.red,
        height: MediaQuery.of(context).size.height * 0.5,
        child: PageView(
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.pageIndex = index;
            // print(controller.pageIndex);
            controller.update();
          },
          children: [
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/welcome/authentication.png'),
                Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      'Rental Portal',
                      style: TextStyle(color: Colors.grey[700], fontSize: 20),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    'Rent & Hire a  car with ease. We have wide range of cars at affordable prices',
                    style: TextStyle(color: Colors.grey[400], fontSize: 14),
                  ),
                ),
              ],
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/welcome/by_my_car.png'),
                Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      'Rental Portal',
                      style: TextStyle(color: Colors.grey[700], fontSize: 20),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    'Rent & Hire a  car with ease. We have wide range of cars at affordable prices',
                    style: TextStyle(color: Colors.grey[400], fontSize: 14),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/welcome/city_driver.png'),
                Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      'Rental Portal',
                      style: TextStyle(color: Colors.grey[700], fontSize: 20),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    'Rent & Hire a  car with ease. We have wide range of cars at affordable prices',
                    style: TextStyle(color: Colors.grey[400], fontSize: 14),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/welcome/fast_car.png'),
                Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      'Rental Portal',
                      style: TextStyle(color: Colors.grey[700], fontSize: 20),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    'Rent & Hire a  car with ease. We have wide range of cars at affordable prices',
                    style: TextStyle(color: Colors.grey[400], fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                border: controller.pageIndex == 0
                    ? null
                    : Border.all(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(20),
                color: controller.pageIndex == 0 ? Colors.blue : Colors.white),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                border: controller.pageIndex == 1
                    ? null
                    : Border.all(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(20),
                color: controller.pageIndex == 1 ? Colors.blue : Colors.white),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                border: controller.pageIndex == 2
                    ? null
                    : Border.all(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(20),
                color: controller.pageIndex == 2 ? Colors.blue : Colors.white),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                border: controller.pageIndex == 3
                    ? null
                    : Border.all(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(20),
                color: controller.pageIndex == 3 ? Colors.blue : Colors.white),
          ),
        ],
      ),
    );
  }

  buildButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.11,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0.5),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
            backgroundColor: controller.pageIndex == 3
                ? MaterialStateProperty.all<Color>(kPrimaryColor)
                : MaterialStateProperty.all<Color>(Colors.grey[200])),
        onPressed: controller.pageIndex == 3
            ? () async {
                var result =
                    await Provider.of<UserViewModel>(context, listen: false)
                        .isLoggedIn();
                if (result == true) {
                  // Get.toNamed(Routes.HOME);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainView()));
                } else {
                  Get.toNamed(Routes.LOGIN);
                }
              }
            : null,
        child: Text(
          'Continue',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
