import 'package:car_rental/models/search_model.dart';
import 'package:car_rental/shared/styles/colors.dart';
import 'package:flutter/material.dart';

Widget productViewWidget(Products product, Function onCall) {
  return InkWell(
    splashColor: kPrimaryColor,
    onTap: () {
      product.stockStatus == "Out Of Stock" ? null : onCall(product);
    },
    child: Container(
      // width:100,
      decoration: BoxDecoration(
        color: product.stockStatus == "Out Of Stock"
            ? Colors.grey[300]
            : Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(8),
      // margin: EdgeInsets.only(
      //     right: index != null ? 16 : 0, left: index == 0 ? 16 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 70,
            child: Center(
              child: product.documentUrl != null
                  ? Image.network(
                      product.documentUrl,
                      fit: BoxFit.fitWidth,
                    )
                  : Image.asset(
                      "assets/images/cars/car.jpg",
                      fit: BoxFit.fitWidth,
                    ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            product.name,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                "INR ",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
              Text(
                product.baseRate.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                " per day",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColorShadow,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  product.stockStatus,
                  style: TextStyle(
                    color: product.stockStatus == "Available"
                        ? kPrimaryColor
                        : product.stockStatus == "Out Of Stock"
                            ? Colors.grey[700]
                            : Colors.red,
                    fontSize: 11.7,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          product.stockStatus != "Out Of Stock"
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 11.7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    ),
  );
}
