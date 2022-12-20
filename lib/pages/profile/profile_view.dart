import 'package:car_rental/shared/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

import '../../core.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.profScaffoldKey,
      backgroundColor: Colors.grey[200],
      drawer: DrawerWidget(controller: controller),
      body: GetBuilder<ProfileController>(
        initState: (_) {
          // controller.model = Provider.of<UserViewModel>(context, listen: false);
          // WidgetsBinding.instance
          //     .addPostFrameCallback((_) => controller.model.getUser());
          controller.customerData = controller.userController.customerData;
          // print(controller.customerData.login.user.name);
        },
        builder: (_) => Stack(
          children: [
            Container(
              color: Colors.white,
              height: 100,
            ),
            SafeArea(
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildHeader1(context),
                      buildProfilePic(context),
                      buildBody(context),
                      // buildActionButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader1(BuildContext context) {
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

  Widget buildBody(context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(7)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildButton(context),
              buildItem(icon: LineIcons.user, name: 'Name', data: "Afeef"),
              Divider(),
              buildItem(
                icon: LineIcons.envelope,
                name: "Email",
                data: "afeef@gmail.com",
              ),
              Divider(),
              buildItem(
                icon: LineIcons.phone,
                name: "Mobile",
                data: "9745276312",
              ),
              Divider(),
              buildItem(
                  icon: LineIcons.genderless, name: 'Gender', data: "Male"),
              Divider(),
              buildItem(
                icon: LineIcons.calendar,
                name: "Date of Birth",
                data: "02-01-1998",
              ),
              Divider(),
              buildItem(
                icon: LineIcons.calendar,
                name: "address",
                data: "Kozhikode",
              ),
            ],
          ),
        ),
        // Container(
        //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        //   margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
        //   decoration: BoxDecoration(
        //       color: Colors.white, borderRadius: BorderRadius.circular(7)),
        //   child: Column(
        //     children: [
        //       buildItem(
        //         onPressed: () => Share.share(
        //             'Please Buy this Template :\nhttps://codecanyon.net/item/car-rental-app-flutter-ui-kit-using-getx/31048680'),
        //         icon: LineIcons.gift,
        //         name: "Invite Friends",
        //       ),
        //       Divider(),
        //       buildItem(
        //         onPressed: () => OpenDialog.info(
        //             lottieFilename: LottieFileName.COMING_SOON,
        //             lottiePadding: EdgeInsets.only(top: 50)),
        //         icon: LineIcons.cog,
        //         name: "Settings",
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  Widget buildItem({
    @required IconData icon,
    @required String name,
    String data,
    Function() onPressed,
  }) {
    return InkWell(
      onTap: data != null ? null : onPressed,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              icon,
              size: 29,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: data == null ? 20 : 18,
                      fontWeight: FontWeight.w500),
                ),
                data == null
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          data,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
              ],
            ),
          )),
          data != null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black45,
                  ),
                ),
        ],
      ),
    );
  }

  Widget buildActionButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton.icon(
        onPressed: () {
          OpenDialog.confirm(
            content: "Are you sure to sign out?",
            lottieFilename: "thinking",
            onYesClicked: () => Get.offAllNamed(Routes.LOGIN),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red[300],
          padding: const EdgeInsets.symmetric(vertical: 12),
          elevation: 0.2,
          textStyle: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w500,
          ),
        ),
        icon: Icon(
          LineIcons.alternateSignOut,
          size: 27,
        ),
        label: Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Text("Sign Out"),
        ),
      ),
    );
  }

  Widget nativeAdLarge1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: NativeAd(
        // Large Ads
        height: 320,
        unitId: AdSetUnitId.nativeAdUnitIdProfileScreen,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 11),
            child: Material(
              elevation: 1.5,
              borderRadius: BorderRadius.circular(6),
              child: child,
            ),
          );
        },
        buildLayout: AdLayoutX.mediumAdTemplateLayoutBuilder,
        loading: Center(child: Text('loading...')),
        error: Container(),
        icon: AdImageView(size: 40),
        headline: AdTextView(
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          maxLines: 1,
        ),
        body: AdTextView(style: TextStyle(color: Colors.black), maxLines: 1),
        media: AdMediaView(
          height: 170,
          width: MATCH_PARENT,
        ),
        attribution: AdTextView(
          width: WRAP_CONTENT,
          text: 'Sponsored',
          decoration: AdDecoration(
            border: BorderSide(color: Colors.green, width: 2),
            borderRadius: AdBorderRadius.all(16.0),
          ),
          style: TextStyle(color: Colors.green),
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
        ),
        button: AdButtonView(
          elevation: 18,
          decoration: AdDecoration(
            borderRadius: AdBorderRadius.all(12),
            backgroundColor: Colors.yellowAccent[700],
          ),
          height: MATCH_PARENT,
          // textStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildProfilePic(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: MediaQuery.of(context).size.height * 0.12,
      // margin: EdgeInsets.symmetric(
      //     horizontal: MediaQuery.of(context).size.width / 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              // color: Colors.green,
              height: 50,
              width: 50,
              child: Image.asset(
                'assets/images/icons/user_circleBig.png',
                height: 50,
                width: 50,
                color: kPrimaryColor,
                fit: BoxFit.contain,
              )),
          ElevatedButton(
            onPressed: () async {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Upload Profile Photo'),
                Container(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      'assets/images/icons/upload.png',
                      color: Colors.white,
                    )),
              ],
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
                backgroundColor:
                    MaterialStateProperty.all<Color>(kPrimaryColor)),
          ),
          ElevatedButton(
            onPressed: () async {},
            child: Icon(Icons.camera_alt_outlined),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
                backgroundColor:
                    MaterialStateProperty.all<Color>(kPrimaryColor)),
          ),
        ],
      ),
    );
  }

  Widget buildButton(context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.edit_outlined,
              size: 20,
            ),
            SizedBox(width: 5),
            Text(
              'Edit Details',
              style: TextStyle(color: kPrimaryColor, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
