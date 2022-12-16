import 'package:car_rental/pages/filter/filter_controller.dart';
import 'package:car_rental/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterView extends GetView<FilterController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
        initState: (_) {
          controller.getHeadValue();
        },
        builder: (_) => Scaffold(
              body: SafeArea(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                            ),
                            child: Column(
                              children: [
                                buildHeader(context),
                                SizedBox(height: 8),
                                buildFilterBody(context),
                                SizedBox(height: 25),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 10, bottom: 10),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Search Filter",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
          )),
    );
  }

  Widget buildFilterBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * .8,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 6.0,
                spreadRadius: 0.0,
                offset: Offset(0.0, 2.0),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          // height: MediaQuery.of(context).size.height * .13,
          child: Column(
            children: [
              // Expanded(
              //   child: ListView.builder(
              //       itemCount: controller.headData.length,
              //       physics: BouncingScrollPhysics(),
              //       scrollDirection: Axis.vertical,
              //       itemBuilder: (context, index) {
              //         return
              //           Column(
              //             children: [
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Container(
              //                   child: Align(
              //                     alignment: Alignment.topLeft,
              //                     child: Text(
              //                       controller.headData[index].name,
              //                       style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               GridView.builder(
              //                   shrinkWrap: true,
              //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //                     crossAxisCount: MediaQuery.of(context).orientation ==
              //                         Orientation.landscape ? 5: 2,
              //                     crossAxisSpacing: 1,
              //                     mainAxisSpacing: 1,
              //                     childAspectRatio: (2 / 1),
              //                   ),
              //                   physics: NeverScrollableScrollPhysics(),
              //                   itemCount: controller.headData[index].headValue.length,
              //                   scrollDirection: Axis.vertical,
              //                   itemBuilder: (contextList,index1) {
              //                     var headValue=controller.headData[index].headValue[index1];
              //                     return Container(
              //                       child: CheckboxListTile(
              //                         value: controller.seat5,
              //                         selected: controller.seat5,
              //                         controlAffinity: ListTileControlAffinity.leading,
              //                         title: Text(
              //                           headValue.name,
              //                           style: TextStyle(color: Colors.black, fontSize: 10),
              //                         ),
              //                         onChanged: (val) {
              //                           controller.seat5 = val;
              //                           controller.update();
              //                         },
              //                       ),
              //                     );
              //                   }
              //               ),
              //
              //             ],
              //           );
              //       }),
              // ),

              Row(
                children: [
                  Container(
                    width: 150,
                    child: ListView.separated(
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Row(
                            children: [
                              AnimatedContainer(
                                  duration: Duration(microseconds: 500)),
                              Container(
                                child: Text("Tab Title $index"),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
              buildContinue(context)
            ],
          )),
    );
  }

  Widget buildCarFeature(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Car Features",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                child: CheckboxListTile(
                  value: controller.ac,
                  selected: controller.ac,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    'AC',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  onChanged: (val) {
                    controller.ac = val;
                    controller.update();
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: CheckboxListTile(
                  value: controller.music,
                  selected: controller.music,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    'Music Player',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  onChanged: (val) {
                    controller.music = val;
                    controller.update();
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                child: CheckboxListTile(
                  value: controller.abs,
                  selected: controller.abs,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    'ABS',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  onChanged: (val) {
                    controller.abs = val;
                    controller.update();
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: CheckboxListTile(
                  value: controller.gps,
                  selected: controller.gps,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    'GPS',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  onChanged: (val) {
                    controller.gps = val;
                    controller.update();
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildTransmissionType(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Transmission Type",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                child: CheckboxListTile(
                  value: controller.automatic,
                  selected: controller.automatic,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    'Automatic',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  onChanged: (val) {
                    controller.automatic = val;
                    controller.update();
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: CheckboxListTile(
                  value: controller.manual,
                  selected: controller.manual,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    'Manual',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  onChanged: (val) {
                    controller.manual = val;
                    controller.update();
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildFuelType(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Fuel Type",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                child: CheckboxListTile(
                  value: controller.petrol,
                  selected: controller.petrol,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    'Petrol',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  onChanged: (val) {
                    controller.petrol = val;
                    controller.update();
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: CheckboxListTile(
                  value: controller.desel,
                  selected: controller.desel,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    'Desel',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  onChanged: (val) {
                    controller.desel = val;
                    controller.update();
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildContinue(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 45.0,
        child: new RawMaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          fillColor: kPrimaryColor,
          elevation: 0.0,
          child: Center(
              child: Text(
            "Apply Filter ",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
