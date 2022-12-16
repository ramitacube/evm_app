import 'package:car_rental/view_models/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';
import '../../core.dart';

class OtpView extends GetView<UserController> {
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.otp = data[0];
    controller.userName = data[1];
    controller.password = data[2];
    controller.phone = data[3];
    print("OTP ${controller.otp}");

    return GetBuilder<UserController>(
        initState: (_) async {
          controller.pinPutController.text = controller.otp;
        },
        builder: (_) => Scaffold(
              backgroundColor: Colors.grey[200],
              body: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    height: 300,
                  ),
                  SafeArea(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            buildHeader(context),
                            //buildLoginForm(),
                            //buildLoginAction(),
                            //buildRegisterAction(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 22),
          ImagesWidget(
            heightImages: 200,
            images: [
              "assets/images/welcome/off_road.png",
              "assets/images/welcome/by_my_car.png",
              "assets/images/welcome/city_driver.png",
            ],
          ),
          SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TitleWidget(
              title: "OTP Verification",
              fontSizeTitle: 27,
              spacer: 8,
              subtitle2: "We have sent an OTP to your mobile number and email",
            ),
          ),
          SizedBox(height: 13),
          buildLoginForm(context),
          buildLoginAction(),
          buildRegisterAction(context),
        ],
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Container(
            width: MediaQuery.of(context).size.height * .35,
            height: MediaQuery.of(context).size.height * .05,
            child: Container(
              child: justRoundedCornersPinPut(context),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .03,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .03,
          ),
        ],
      ),
    );
  }

  Widget justRoundedCornersPinPut(BuildContext context) {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      border: Border(
        bottom: BorderSide(
            width: 1.0,
            color: Theme.of(context).indicatorColor.withOpacity(.7)),
      ),
    );

    return PinPut(
      fieldsCount: 5,
      withCursor: true,
      textStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.height * .015,
          color: Theme.of(context).indicatorColor),
      eachFieldWidth: MediaQuery.of(context).size.height * .02,
      eachFieldHeight: MediaQuery.of(context).size.height * .01,
      onSubmit: (String pin) {},
      eachFieldPadding:
          EdgeInsets.all(MediaQuery.of(context).size.height * .015),
      // focusNode: _controller.pinPutFocusNode,
      controller: controller.pinPutController,
      submittedFieldDecoration: pinPutDecoration,
      selectedFieldDecoration: pinPutDecoration,
      followingFieldDecoration: pinPutDecoration,
      pinAnimationType: PinAnimationType.fade,
    );
  }

  Widget buildLoginAction() {
    return GestureDetector(
      onTap: () async {
        var result =
            await controller.verifyOtp(controller.phone, controller.otp);
        if (result == true) {
          // var login =
          controller
              .logIn(
                  userMail: controller.userName, password: controller.password)
              .then((value) {
            if (value) Get.toNamed(Routes.HOME);
          });
          // if (login == true) {
          // Get.toNamed(Routes.HOME);
          // }
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27),
        child: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Verification OTP",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 40,
                width: 40,
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRegisterAction(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.only(bottom: 17),
      child: Center(
          child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Don't work ? ",
          ),
          TextButton(
            onPressed: () {
              // controller.resendOtp();
            },
            child: Text("Try another OTP ",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                )),
          )
        ],
      )),
    );
  }
}
