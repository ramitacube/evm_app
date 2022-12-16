import 'package:car_rental/shared/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../core.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        // initState: (_) async {
        //   await controller.getRentalCategory();
        //   await controller.getRentalOffer();
        // },
        builder: (_) => Scaffold(
              key: controller.homeScaffoldKey,
              drawer: DrawerWidget(
                controller: controller,
              ),
              body: Container(
                color: Colors.grey[200],
                child: Stack(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 100,
                    ),
                    SafeArea(
                      child: SingleChildScrollView(
                        controller: controller.catScrollController,
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.grey[200]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              buildHeader(context),
                              buildCategories(context),
                              buildOfferListing(context)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget buildHeader(BuildContext context) {
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
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          "Palarivattom",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        // TitleWidget(
                        //   title: "Kochi",
                        //   fontSizeTitle: 14,
                        //   subtitle2: "Palarivattom",
                        //   fontSizesubtitle2: 10,
                        // ),
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

  Widget buildCategories(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        // !controller.isLoading &&
        controller.rentalCategory != null &&
                controller.rentalCategory.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                    height: 110,
                    child: ListView.builder(
                        itemCount: controller.rentalCategory.length,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          controller.selectTime = true;
                          // controller.update();
                          return buildDealer(
                            controller.rentalCategory[index],
                            context,
                            controller.selectTime,
                            index,
                          );
                        })))
            :
            // !controller.isLoading &&
            controller.rentalCategory.isEmpty
                ? buildLoading(context)
                : Text(
                    "No Categories found!",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
      ],
    );
  }

  Widget buildOfferListing(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Offers",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        !controller.isLoading
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.offerData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Container(
                              // height: 100,
                              // width: 100,
                              child: Image.network(
                                  controller.offerData[index].url),
                            ),
                          );
                        })),
              )
            : buildLoading(context),
      ],
    );
  }

  Widget buildLoading(BuildContext context) {
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
}
