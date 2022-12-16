import 'package:flutter/material.dart';
import 'package:car_rental/models/car.dart';

Widget buildCar(Car car, [int index]) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(
        right: index != null ? 16 : 0, left: index == 0 ? 16 : 0),
    width: 190,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: kPrimaryColorShadow,
        //       borderRadius: BorderRadius.all(
        //         Radius.circular(15),
        //       ),
        //     ),
        //     child: Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        //       child: Text(
        //         car.condition,
        //         style: TextStyle(
        //           color: kPrimaryColor,
        //           fontSize: 11.7,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // SizedBox(height: 10),
        Container(
          height: 70,
          child: Center(
            child: Hero(
              tag: car.model + car.brand,
              child: Image.asset(
                car.images[0],
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          car.brand + " " + car.model,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              "INR ",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Text(
              car.price.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              " per day",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ],
    ),
  );
}
