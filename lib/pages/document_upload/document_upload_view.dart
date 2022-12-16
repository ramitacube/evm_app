import 'dart:io';

import 'package:car_rental/pages/document_upload/document_upload_controller.dart';
import 'package:car_rental/shared/styles/colors.dart';
import 'package:car_rental/shared/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

class UploadView extends GetView<UploadController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadController>(
        builder: (_) => Scaffold(
              key: controller.docUploadScaffoldKey,
              floatingActionButton: buildSubmit(context),
              drawer: DrawerWidget(
                controller: controller,
              ),
              body: SingleChildScrollView(
                child: Container(
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
                                buildImages(context),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget buildImages(BuildContext context) {
    return Container(
        child: Row(
      children: [
        controller.frontDrivLis != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text('Front Side',
                          style: Theme.of(context).textTheme.bodyText2)),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 220,
                      child: Image.file(File(controller.frontDrivLis.path))),
                ],
              )
            : Container(),
        Spacer(),
        controller.backDrivLis != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text('Back Side',
                          style: Theme.of(context).textTheme.bodyText2)),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 220,
                      child: Image.file(File(controller.backDrivLis.path))),
                ],
              )
            : Container()
      ],
    ));
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_outlined)),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Upload Driving License",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Add clear and readable images of both sides / all pages of your driving license",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isDismissible: true,
                          enableDrag: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  right: -5,
                                  top: -50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        size: 24,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.28,
                                  padding: EdgeInsets.only(left: 15, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Add Photo',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          'Select how you\'d like to add the photo'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ListTile(
                                        onTap: () async {
                                          controller.frontDrivLis =
                                              await controller.getImage(
                                                  ImgSource.Camera, context);
                                          Navigator.pop(context);
                                        },
                                        leading: Icon(Icons.camera_alt_outlined,
                                            color: kPrimaryColor),
                                        title: Text('Camera'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25.0),
                                        child: Divider(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      ListTile(
                                        onTap: () async {
                                          controller.frontDrivLis =
                                              await controller.getImage(
                                                  ImgSource.Gallery, context);
                                          Navigator.pop(context);
                                        },
                                        leading: Icon(Icons.camera_alt_outlined,
                                            color: kPrimaryColor),
                                        title: Text('Gallery'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: Container(
                      color: Colors.white,
                      width: 150,
                      height: 220,
                      child: Column(
                        children: [
                          Container(
                            width: 170,
                            height: 170,
                            color: Colors.grey,
                            child: Container(
                              child: Image.asset(
                                "assets/images/users/licnense1.png",
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                          Center(child: Text("Click to add front side"))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isDismissible: true,
                          enableDrag: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  right: -5,
                                  top: -50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        size: 24,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.28,
                                  padding: EdgeInsets.only(left: 15, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Add Photo',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          'Select how you\'d like to add the photo'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ListTile(
                                        onTap: () async {
                                          controller.backDrivLis =
                                              await controller.getImage(
                                                  ImgSource.Camera, context);
                                          Navigator.pop(context);
                                        },
                                        leading: Icon(Icons.camera_alt_outlined,
                                            color: kPrimaryColor),
                                        title: Text('Camera'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25.0),
                                        child: Divider(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      ListTile(
                                        onTap: () async {
                                          controller.backDrivLis =
                                              await controller.getImage(
                                                  ImgSource.Gallery, context);
                                          Navigator.pop(context);
                                        },
                                        leading: Icon(Icons.camera_alt_outlined,
                                            color: kPrimaryColor),
                                        title: Text('Gallery'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: Container(
                      color: Colors.white,
                      width: 150,
                      height: 220,
                      child: Column(
                        children: [
                          Container(
                            width: 170,
                            height: 170,
                            color: Colors.grey,
                            child: Container(
                              child: Image.asset(
                                "assets/images/users/license2.png",
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                          Center(child: Text("Click to add back side"))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  buildBottomModal(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          await showModalBottomSheet(
              isDismissible: false,
              enableDrag: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: -5,
                      top: -50,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 24,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add Photo',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('Select how you\'d like to add the photo'),
                          ListTile(
                            leading: Icon(Icons.camera_alt_outlined,
                                color: kPrimaryColor),
                            title: Text('Camera'),
                          ),
                          ListTile(
                            leading: Icon(Icons.camera_alt_outlined,
                                color: kPrimaryColor),
                            title: Text('Gallery'),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
        },
        child: Text('ok'));
  }

  Widget buildSubmit(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 10),
      child: Container(
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
            "Save & Continue ",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
