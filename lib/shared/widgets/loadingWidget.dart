import 'package:car_rental/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget buildLoading(BuildContext context){
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: SpinKitWave(
      size: 20,
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
        );
      },
    ),
  );
}