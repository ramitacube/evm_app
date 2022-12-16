import 'package:car_rental/core.dart';
import 'package:car_rental/view_models/user_controller.dart';
import 'package:car_rental/view_models/user_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RegisterView extends GetView<UserController> {
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
  DateTime dateTime = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  String gender;
  TextEditingController dobController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    buildLoginAction(),
                    buildRegisterAction(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
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

          //SizedBox(height: 13),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: TitleWidget(
          //     title: "Welcome!",
          //     fontSizeTitle: 27,
          //     spacer: 8,
          //     subtitle2:
          //         "Travel and live the new experience of rent the cars from your home",
          //   ),
          // ),
          SizedBox(height: 13),
        ],
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return GetBuilder<UserController>(
        builder: (_) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
              margin: const EdgeInsets.only(top: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(color: Color(0xFF707070), fontSize: 18),
                    ),
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your name",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF707070)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF707070)),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Email",
                      style: TextStyle(color: Color(0xFF707070), fontSize: 18),
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Invalid email";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF707070)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF707070)),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Phone",
                      style: TextStyle(color: Color(0xFF707070), fontSize: 18),
                    ),
                    TextFormField(
                      controller: phoneController,
                      validator: (value) {
                        if (value.length != 10) {
                          return "Invalid Phone Number";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "+91 xxxxxxxxxx",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF707070)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF707070)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gender",
                            style: TextStyle(
                                color: Color(0xFF707070), fontSize: 18),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Radio(
                                  value: "male",
                                  groupValue: gender,
                                  onChanged: (val) {
                                    gender = val;
                                    print(gender);
                                    controller.update();
                                  },
                                ),
                                Text("Male", style: TextStyle(fontSize: 16)),
                                Radio(
                                  value: "female",
                                  groupValue: gender,
                                  onChanged: (val) {
                                    gender = val;
                                    print(gender);
                                    controller.update();
                                  },
                                ),
                                Text("Female", style: TextStyle(fontSize: 16)),
                                Radio(
                                  value: "others",
                                  groupValue: gender,
                                  onChanged: (val) {
                                    gender = val;
                                    print(gender);
                                    controller.update();
                                  },
                                ),
                                Text("Others", style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "DOB",
                      style: TextStyle(color: Color(0xFF707070), fontSize: 18),
                    ),
                    TextFormField(
                      controller: dobController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Invalid date of birth";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "DD/MM/YYYY",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF707070)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF707070)),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () =>
                                showSheet(context, buildDatePicker(), () {
                              dobController.text =
                                  DateFormat("yyyy-MM-dd").format(dateTime);
                              print(dobController.text);
                              Navigator.pop(context);
                            }),
                            icon: Icon(Icons.calendar_today),
                          )),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Password",
                      style: TextStyle(color: Color(0xFF707070), fontSize: 18),
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value.length < 8) {
                          return "Atleast 8 charecter needed";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "********",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF707070)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF707070)),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Address",
                      style: TextStyle(color: Color(0xFF707070), fontSize: 18),
                    ),
                    TextFormField(
                      controller: addressController,
                      minLines: 4,
                      maxLines: 6,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Invalid address";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF707070)),
                        ),
                        contentPadding: EdgeInsets.all(12),
                        hintText: "address",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF707070)),
                        ),
                      ),
                    ),
                    // Text(
                    //   "Confirm Password",
                    //   style: TextStyle(color: Color(0xFF707070), fontSize: 18),
                    // ),
                    // TextFormField(
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //     hintText: "********",
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: Color(0xFF707070)),
                    //     ),
                    //     focusedBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: Color(0xFF707070)),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 23),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "By signing up, I agree to the EVM Car Rental App's User Agreement and Privacy Policy.",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ));
  }

  Widget buildLoginAction() {
    return Consumer<UserViewModel>(builder: (context, model, child) {
      return GestureDetector(
        onTap: () async {
          if (_formKey.currentState.validate()) {
            var result = await controller.register(
                nameController.text,
                emailController.text,
                passwordController.text,
                phoneController.text,
                addressController.text,
                dobController.text,
                gender);
            if (result == true) {
              var otp = controller.registerData;
              Get.toNamed(Routes.OTP, arguments: [
                otp,
                emailController.text,
                passwordController.text,
                phoneController.text
              ]);

              // var logResult=await Provider.of<UserViewModel>(
              //     context,
              //     listen: false).logIn(userMail: emailController.text,password: passwordController.text);
              // if (logResult == true) {
              //   Get.toNamed(Routes.HOME);
              //   Fluttertoast.showToast(
              //       msg: "Successfully registered",
              //       toastLength: Toast.LENGTH_SHORT,
              //       gravity: ToastGravity.CENTER,
              //       timeInSecForIosWeb: 1,
              //       backgroundColor: kPrimaryColor,
              //       textColor: Colors.white,
              //       fontSize: 16.0);
              // }
            }
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
                    "Submit",
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
    });
  }

  Widget buildRegisterAction() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.only(bottom: 17),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account?",
              style: TextStyle(fontSize: 12),
            ),
            TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  "Sign in",
                  style: TextStyle(fontSize: 14),
                )),
          ],
        ),
      ),
    );
  }

  static void showSheet(
          BuildContext context, Widget child, VoidCallback onClicked) =>
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

  Widget buildDatePicker() {
    return SizedBox(
      height: 180,
      child: CupertinoDatePicker(
          initialDateTime: dateTime,
          // minimumYear: ,
          // maximumYear: ,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) {
            dobController.text =
                DateFormat("yyyy-MM-dd").format(dateTime).toString();
            this.dateTime = dateTime;
            controller.update();
          }),
    );
  }
}
