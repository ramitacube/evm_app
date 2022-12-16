import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

class UploadController extends GetxController {
  final GlobalKey<ScaffoldState> docUploadScaffoldKey =
      new GlobalKey<ScaffoldState>();

  var _image;

  var frontDrivLis;
  var backDrivLis;

  Future getImage(ImgSource source, BuildContext context) async {
    var image = await ImagePickerGC.pickImage(
        // enableCloseButton: true,
        // closeIcon: Icon(
        //   Icons.close,
        //   color: Colors.red,
        //   size: 12,
        // ),
        context: context,
        source: source,
        barrierDismissible: true,
        // cameraIcon: Icon(
        //   Icons.camera_alt,
        //   color: Colors.red,
        // ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
        cameraText: Text(
          "Camera",
          style: TextStyle(color: Colors.red),
        ),
        galleryText: Text(
          "Gallery",
          style: TextStyle(color: Colors.blue),
        ));
    _image = image;
    update();

    return _image;
  }
}
