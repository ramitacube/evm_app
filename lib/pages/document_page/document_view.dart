import 'package:car_rental/core.dart';
import 'package:car_rental/routes/app_pages.dart';
import 'package:car_rental/shared/styles/colors.dart';
import 'package:car_rental/shared/widgets/avatar_widget.dart';
import 'package:car_rental/shared/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'document_controller.dart';

class DocumentView extends GetView<DocumentController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DocumentController>(
        builder: (_) => Scaffold(
              key: controller.docScaffoldKey,
              drawer: DrawerWidget(
                controller: controller,
              ),
              body: Container(
                color: Colors.grey[200],
                child: Stack(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 100,
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
                              buildTopContent(context)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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

  Widget buildTopContent(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.asset('assets/images/welcome/kyc.png')),
          Text("Verify Profile Now",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
                "Only few steps left to complete. Upload remaining documents to continue using Rental Car ",
                style: TextStyle(fontSize: 14.0, color: Colors.grey.shade600
                    //fontWeight: FontWeight.normal,
                    )),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.blueAccent.withOpacity(0.1),
            child: Text(
              "VERIFY PROFILE IN 3 SIMPLE STEPS ",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "1",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ),
            title: Text(
              "Upload driving license",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          ListTile(
            leading: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "2",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ),
            title: Text(
              "Upload Aadhar Card / Voter ID/ Passport",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          ListTile(
            leading: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "3",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ),
            title: Text(
              "Take a Selfie Photo",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
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
                "Submit ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
              onPressed: () {
                Get.toNamed(Routes.KYCUPLOAD);
              },
            ),
          ),
        ],
      ),
    );
  }
}
