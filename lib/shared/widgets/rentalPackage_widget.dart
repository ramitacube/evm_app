import 'package:car_rental/models/rental_package_model.dart';
import 'package:flutter/material.dart';
import '../../core.dart';

Widget buildRentalPackageWidget(
    RentalPackageData rentalPackageData, int selectedIndex, int index) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: 75,
          child: Text(
            rentalPackageData.packageName,
            style: TextStyle(
                color: selectedIndex == index ? kPrimaryColor : Colors.black,
                fontSize: 16,
                height: 1,
                fontWeight: FontWeight.w300),
          ),
        ),
      ],
    ),
  );
}
