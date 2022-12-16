import 'package:car_rental/shared/widgets/car_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import '../../core.dart';

class AvailableCarsView extends GetView<AvailableCarsController> {
  final filters = FilterService().getFilterList();
  final categoryName = Get.arguments as String;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(
                title: categoryName,
                // "Available Cars (" +
                //     CarService().getCarList().length.toString() +
                //     ")",
              ),
              SizedBox(height: 18),
              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 1 / 1.6,
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  children: CarService().getCarList().map((item) {
                    return GestureDetector(
                        onTap: () =>
                            Get.toNamed(Routes.BOOK_CAR, arguments: item),
                        child: buildCarView(item));
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildFilterIcon(),
              buildFilters(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFilterIcon() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.FILTER);
      },
      child: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.only(left: 14),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Center(
          child: Icon(
            LineIcons.filter,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }

  Widget buildFilters() {
    return ValueBuilder<Filter>(
      initialValue: filters[0],
      builder: (value, updateFn) => ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        semanticChildCount: filters.length,
        shrinkWrap: true,
        children: filters
            .map((filter) => buildFilter(value, filter, updateFn))
            .toList(),
      ),
    );
  }

  Widget buildFilter(Filter value, Filter filter, Function(Filter) updateFn) {
    return GestureDetector(
      onTap: () => updateFn(filter),
      child: Padding(
        padding: EdgeInsets.only(right: 17),
        child: Text(
          filter.name,
          style: TextStyle(
            color: value.name == filter.name ? kPrimaryColor : Colors.grey[500],
            fontSize: 16,
            fontWeight:
                value.name == filter.name ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
