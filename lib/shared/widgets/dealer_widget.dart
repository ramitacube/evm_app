import 'package:car_rental/models/rental_category_model.dart';
import 'package:flutter/material.dart';
import '../../core.dart';

Widget buildDealer(GetCompaniesCategories category, BuildContext context,
    bool selected, int index) {
  return Container(
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            print(category.name);
            print(category.id);
            // Get.toNamed(Routes.);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MainView(
                          currentTab: 1,
                          index: index,
                          categoryId: int.parse(category.id),
                        )));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            //padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(right: 12, left: index == 0 ? 12 : 0),
            width: 70,
            height: 70,
            child: category.categoryIcon != null
                ? Image.network(
                    category.categoryIcon,
                  )
                : Image.asset("assets/images/icons/caricon.png"),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 70,
          child: Text(
            category.name,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .apply(color: Colors.black),
          ),
        ),
      ],
    ),
  );
}
