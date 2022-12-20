import 'package:car_rental/shared/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
                "Select Your Prefered Vehicle Type",
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
    var offerList = [
      "https://scontent.fcok4-1.fna.fbcdn.net/v/t1.6435-9/67271068_587641265101830_5120924163111911424_n.png?_nc_cat=107&ccb=1-7&_nc_sid=730e14&_nc_ohc=VvJAN92q9ioAX-uY7Vs&_nc_oc=AQn9EFBYGxGJ8i97sJW1X3zpUcaedQYQuvMRl5Bwac0cI5YPRkUC2akxV5UVBjBG6a0&_nc_ht=scontent.fcok4-1.fna&oh=00_AfDcCp-7--x87-Py-OrOjBTBvVjPRBRBFoShZPzXT0SVvA&oe=63C7BC87",
      "https://scontent.fcok4-1.fna.fbcdn.net/v/t1.6435-9/67403614_595047667694523_6866626883430121472_n.png?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=9myvhIhLQscAX9yFzPs&_nc_ht=scontent.fcok4-1.fna&oh=00_AfCuBsB7w3IfdxW_uuHKo3HUU2md7Y-0DqbYtDms7Ahm1g&oe=63C7D892",
      "https://scontent.fcok4-1.fna.fbcdn.net/v/t1.6435-9/67964434_597772120755411_3912703876532273152_n.png?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=GaQinF7UKj8AX_uPpmd&_nc_ht=scontent.fcok4-1.fna&oh=00_AfBICJlAD_tN8fuRSw-AoM19SR3vF1JnEojCMemWM7X7Rw&oe=63C7C727",
      "https://scontent.fcok4-1.fna.fbcdn.net/v/t1.6435-9/68391525_598949310637692_7094869086286381056_n.png?_nc_cat=107&ccb=1-7&_nc_sid=730e14&_nc_ohc=E20m9ik7TYkAX8wIjHc&_nc_ht=scontent.fcok4-1.fna&oh=00_AfABUxq8MiYEytzsauac08FvNBbENgAnVow3iaNxDP0lzg&oe=63C7C980"
    ];
    var date = DateTime.now();
    var month = DateFormat("MMMM").format(date);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Offers for the month of $month ${date.year}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: offerList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        // height: 100,
                        // width: 100,
                        child: Image.network(offerList[index]),
                      ),
                    );
                  })),
        )

        // RAMIT COMMENTED
        // !controller.isLoading
        //     ? Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 20),
        //         child: Container(
        //             height: MediaQuery.of(context).size.height,
        //             child: ListView.builder(
        //                 scrollDirection: Axis.vertical,
        //                 physics: BouncingScrollPhysics(),
        //                 shrinkWrap: true,
        //                 itemCount: controller.offerData.length,
        //                 itemBuilder: (context, index) {
        //                   return Padding(
        //                     padding: const EdgeInsets.symmetric(vertical: 5.0),
        //                     child: Container(
        //                       // height: 100,
        //                       // width: 100,
        //                       child: Image.network(
        //                           controller.offerData[index].url),
        //                     ),
        //                   );
        //                 })),
        //       )
        //     : buildLoading(context),
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
