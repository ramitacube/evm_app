import 'package:car_rental/models/rental_category_model.dart';
import 'package:flutter/material.dart';
import '../../core.dart';

Widget categoryWidget(int passingIndex, int currentIndex,
    GetCompaniesCategories category, BuildContext context, bool selected) {
  return Container(
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: passingIndex != null
                ? passingIndex == currentIndex
                    ? kPrimaryColor
                    : Colors.white
                : Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          //padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(right: 12, left: currentIndex == 0 ? 12 : 0),
          width: 100,
          height: 70,
          child: Image.network(
            category.categoryIcon,
            color: passingIndex != null
                ? passingIndex == currentIndex
                    ? Colors.white
                    : Colors.black
                : Colors.black,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 70,
          child: Text(
            category.name,
            style: Theme.of(context).textTheme.bodyText2.apply(
                color: passingIndex != null
                    ? passingIndex == currentIndex
                        ? kPrimaryColor
                        : Colors.black
                    : Colors.black),
          ),
        ),
      ],
    ),
  );
}
