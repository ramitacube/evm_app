import 'package:car_rental/core.dart';
import 'package:car_rental/models/customer_model.dart';
import 'package:car_rental/pages/document_page/document_view.dart';
import 'package:car_rental/pages/privacy_policy/privacy_view.dart';
import 'package:car_rental/view_models/user_controller.dart';
import 'package:car_rental/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'avatar_widget.dart';

class DrawerWidget extends StatefulWidget {
  final GetxController controller;
  const DrawerWidget({Key key, this.controller}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  // UserViewModel model;
  CustomerData customerData;
  var model;

  UserController userController = Get.put(UserController());
  @override
  void initState() {
    super.initState();

    Get.find<UserController>().getUser();

    getUser();
  }

  Future<void> getUser() async {
    // model = userController.getUser();
    //     Provider.of<UserViewModel>(context, listen: false);
    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) async => await model.getUser());
    // customerData=model.customerData;
    // print(customerData.login.user.name);
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * .01,
                left: MediaQuery.of(context).size.height * .02,
                right: MediaQuery.of(context).size.height * .015,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * .02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AvatarWidget(
                          //photoURL: controller.userProfile.photoURL,
                          membership: "Gold",
                          progress: 70,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.height * .24,
                                child: RichText(
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                  strutStyle: StrutStyle(fontSize: 12.0),
                                  text: TextSpan(
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).indicatorColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .025,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600),
                                      text: userController.customerData.login
                                          .user.name), //"Ratheesh Vjayan"
                                ),
                              ),
                              Text(
                                "Kochi, Palarivattom",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .15,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * .015,
                      right: MediaQuery.of(context).size.height * .015),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 1,
                        color: Colors.grey[350],
                      ),
                      ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomeView()));
                          },
                          leading: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: kPrimaryColor, shape: BoxShape.circle),
                            child: Center(
                                child: IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: ImageIcon(
                                  AssetImage("assets/images/icons/home.png")),
                            )),
                          ),
                          title: Text(
                            "Home",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )),
                      ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => MainView(
                                          currentTab: 1,
                                        )));
                          },
                          leading: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: kPrimaryColor, shape: BoxShape.circle),
                            child: Center(
                                child: IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: ImageIcon(
                                  AssetImage("assets/images/icons/search.png")),
                            )),
                          ),
                          title: Text(
                            "Search",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )),
                      ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => MainView(
                                          currentTab: 2,
                                        )));
                          },
                          leading: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: kPrimaryColor, shape: BoxShape.circle),
                            child: Center(
                                child: IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: ImageIcon(AssetImage(
                                  "assets/images/icons/calendar.png")),
                            )),
                          ),
                          title: Text(
                            "Rental",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )),
                      ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => MainView(
                                          currentTab: 3,
                                        )));
                          },
                          leading: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: kPrimaryColor, shape: BoxShape.circle),
                            child: Center(
                                child: IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: ImageIcon(AssetImage(
                                  "assets/images/icons/notifications.png")),
                            )),
                          ),
                          title: Text(
                            "Notification",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )),
                      ListTile(
                          onTap: () {
                            // Get.toNamed(Routes.PROFILE);

                            Navigator.pop(context);
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => MainView(
                                          currentTab: 4,
                                        )));
                          },
                          leading: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: kPrimaryColor, shape: BoxShape.circle),
                            child: Center(
                                child: IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: ImageIcon(AssetImage(
                                  "assets/images/icons/profiles.png")),
                            )),
                          ),
                          title: Text(
                            "Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )),
                      ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DocumentView()));
                          },
                          leading: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: kPrimaryColor, shape: BoxShape.circle),
                            child: Center(
                                child: IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: ImageIcon(
                                AssetImage("assets/images/icons/upload.png"),
                                size: 48,
                              ),
                            )),
                          ),
                          title: Text(
                            "KYC Documentation",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )),
                      ListTile(
                          onTap: () {
                            // Get.toNamed(Routes.PROFILE);

                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PrivacyView()));
                          },
                          leading: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: kPrimaryColor, shape: BoxShape.circle),
                            child: Center(
                                child: IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: ImageIcon(AssetImage(
                                  "assets/images/icons/profiles.png")),
                            )),
                          ),
                          title: Text(
                            "Policies",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )),
                      ListTile(
                          onTap: () {
                            // Get.toNamed(Routes.PROFILE);

                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProfileView()));
                          },
                          leading: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: kPrimaryColor, shape: BoxShape.circle),
                            child: Center(
                                child: IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: ImageIcon(AssetImage(
                                  "assets/images/icons/profiles.png")),
                            )),
                          ),
                          title: Text(
                            "Help & Support",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )),
                      ListTile(
                          onTap: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Logout"),
                                    content: Text(
                                        "Would you like to continue to logout?"),
                                    actions: [
                                      MaterialButton(
                                        child: Text("Cancel"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      MaterialButton(
                                        child: Text("Continue"),
                                        onPressed: () {
                                          Provider.of<UserViewModel>(context,
                                                  listen: false)
                                              .logout();
                                          Get.toNamed(Routes.LOGIN);
                                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginView()));
                                        },
                                      )
                                    ],
                                  );
                                });
                          },
                          leading: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: kPrimaryColor, shape: BoxShape.circle),
                            child: Center(
                                child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.logout,
                                  size: 20, color: Colors.grey.shade300),
                            )),
                          ),
                          title: Text(
                            "Logout",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
