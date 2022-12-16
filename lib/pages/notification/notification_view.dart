import 'package:car_rental/shared/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../core.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.notifScaffoldKey,
      drawer: DrawerWidget(
        controller: controller,
      ),
      backgroundColor: Colors.grey[200],
      body: GetBuilder<NotificationController>(
        // initState: (_) => controller.loadData(),
        builder: (_) => SafeArea(
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
                          buildBody(context),
                          buildNotification(context),
                        ],
                      ),
                    ),
                  )),
                ],
              )),
        ),
      ),
    );
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
                "My Notifications",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              )),
        ),
      ],
    );
  }

  Widget buildNotification(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              height: 80,
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(
                      LineIcons.bell,
                      size: 28,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TitleWidget(
                      title: "Biggest Offer on Rental Cars",
                      fontSizeTitle: 14,
                      subtitle2: "Best offers start now..",
                      fontSizesubtitle2: 10,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              height: 80,
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(
                      LineIcons.bell,
                      size: 28,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TitleWidget(
                      title: "Best Offers on Sedan Cars",
                      fontSizeTitle: 14,
                      subtitle2: "Best offer of the year is...",
                      fontSizesubtitle2: 10,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
