import 'package:car_rental/pages/privacy_policy/privacy_controller.dart';
import 'package:car_rental/shared/styles/colors.dart';
import 'package:car_rental/shared/widgets/avatar_widget.dart';
import 'package:car_rental/shared/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class PrivacyView extends GetView<PrivacyController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivacyController>(
        initState: (_) async {
          await controller.getPrivacy();
        },
        builder: (_) => Scaffold(
              key: controller.privacyScaffoldKey,
              drawer: DrawerWidget(
                controller: controller,
              ),
              body: SafeArea(
                child: Container(
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
                                buildBody(context)
                              ],
                            ),
                          ),
                        )),
                      ],
                    )),
              ),
            ));
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(15),
        //   bottomRight: Radius.circular(15),
        // ),
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
                    // Get.toNamed(Routes.AVAILABILITY);
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
          padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 10),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Privacy Policy",
                style: Theme.of(context).textTheme.bodyText1,
              )),
        ),
        !controller.isLoading
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    controller.privacyData.privacyPolicy.desc,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ))
            : buildLoading(context)
      ],
    );
  }

  Widget buildLoading(BuildContext context) {
    return SpinKitWave(
      size: 20,
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
        );
      },
    );
  }
}
