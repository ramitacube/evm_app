import 'package:car_rental/view_models/user_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core.dart';

class LoginView extends GetView<UserController> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpLoginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  List images = [
    "assets/images/welcome/off_road.png",
    "assets/images/welcome/by_my_car.png",
    "assets/images/welcome/city_driver.png",
  ];
  List bannerText = [
    "We take special care to make sure your booking experience with EVM Wheels is always Simple, Fast and 100% Secure",
    "We process your refunds and payments without any hassles.",
    "Our prices include taxes & insurance. We have no hidden charges."
  ];

  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
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
                            buildLoginForm(context),
                            buildLoginAction(context),
                            buildRegisterAction(context),
                            // buildMobile(context),
                            // buildButton(context, 'Log In with OTP',
                            //     kPrimaryColor, Colors.white, () {
                            //   Get.toNamed(Routes.OTPLogin);
                            // }),
                            // buildButton(
                            //     context,
                            //     'assets/images/icons/google.png',
                            //     'Log In with Google',
                            //     Colors.white,
                            //     Colors.grey),
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
      //height: 500,
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
          // ImagesWidget(
          //   heightImages: 200,
          //   images: [
          //     "assets/images/welcome/off_road.png",
          //     "assets/images/welcome/by_my_car.png",
          //     "assets/images/welcome/city_driver.png",
          //   ],
          // ),
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            child: CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset(
                            images[index],
                            height: MediaQuery.of(context).size.height * 0.16,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Container(
                          height: 200,
                          child: TitleWidget(
                            title: "Welcome!",
                            fontSizeTitle: 22,
                            spacer: 4,
                            subtitle2: bannerText[index],
                            fontSizesubtitle2: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
              ),
            ),
          ),
          SizedBox(height: 13),
        ],
      ),
    );
  }

  Widget buildMobile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
      margin: const EdgeInsets.only(top: 8),
      child: Form(
        key: otpLoginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mobile Number",
              style: TextStyle(color: Color(0xFF707070), fontSize: 18),
            ),
            TextFormField(
              controller: phoneController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Invalid mobile";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: "Enter your mobile number",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF707070)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF707070)),
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
      margin: const EdgeInsets.only(top: 8),
      child: Form(
        key: loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email/Mobile",
              style: TextStyle(color: Color(0xFF707070), fontSize: 18),
            ),
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Invalid email or mobile";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: "Enter your email or mobile",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF707070)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF707070)),
                ),
              ),
            ),
            SizedBox(height: 15),
            controller.loginType == 'login'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style:
                            TextStyle(color: Color(0xFF707070), fontSize: 18),
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Invalid Password";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "***********",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF707070)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF707070)),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox.shrink(),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () => Get.toNamed(Routes.FORGET_PASSWORD),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.changeLoginType();
                        },
                        child: Text(
                          controller.loginType == 'OTP'
                              ? "Login with email/mobile"
                              : "Login with OTP",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Forgot your password?",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoginAction(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (controller.loginType == 'login') {
          if (loginFormKey.currentState.validate()) {
            var result = await controller.logIn(
                userMail: emailController.text,
                password: passwordController.text);
            // var result=await Provider.of<UserViewModel>(
            //     context,
            //     listen: false).logIn(userMail: emailController.text,password: passwordController.text);
            print(result);
            if (result == true) {
              Get.toNamed(Routes.HOME);
            }
          }
        } else {
          var result = await controller.sendOtp(
              phone: emailController.text,
              type: 'login');
          print("jejhekjewejk ${result}");
          Get.toNamed(Routes.OTPLogin, arguments: [emailController.text]);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27),
        child: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
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
                  controller.loginType == 'login'
                      ? "Sign In"
                      : "Sign In with OTP",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
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
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: TextStyle(fontSize: 17),
            ),
            TextButton(
                onPressed: () => Get.toNamed(Routes.REGISTER),
                child: Text(
                  "Sign up for free",
                  style: TextStyle(fontSize: 17),
                )),
          ],
        ),
      ),
    );
  }

  buildButton(BuildContext context, String label, Color color, Color textColor,
      Function onPressed) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.12,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0.5),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )),
            backgroundColor: MaterialStateProperty.all<Color>(color)),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$label',
              style: TextStyle(color: textColor, fontSize: 22),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
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
    );
  }
}
