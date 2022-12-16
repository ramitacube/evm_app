import 'package:car_rental/core.dart';
import 'package:car_rental/models/district_model.dart';
import 'package:car_rental/routes/app_pages.dart';
import 'package:car_rental/shared/styles/colors.dart';
import 'package:car_rental/shared/widgets/avatar_widget.dart';
import 'package:car_rental/shared/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'availability_controller.dart';

class AvailabilityView extends GetView<AvailabilityController> {
  final index = Get.arguments as int;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AvailabilityController>(
        // init: (){},
        initState: (_) async {
          controller.tabIndex = index != null ? index : 0;
          controller.getController();
          controller.update();
          await controller.getDistrict();
        },
        builder: (_) => Scaffold(
            key: controller.availScaffoldKey,
            drawer: DrawerWidget(),
            // floatingActionButton: buildSubmit(context),
            body: Container(
                color: Colors.grey[200],
                child: Stack(children: [
                  Container(
                    color: Colors.white,
                    height: 100,
                  ),
                  SafeArea(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            buildHeader(context),
                            buildBody(context),
                            GetBuilder<AvailabilityController>(
                              init: AvailabilityController(),
                              builder: (_) => controller.tabIndex == 0
                                  ? buildPickUp(context)
                                  : controller.tabIndex == 1
                                      ? buildHomeDelivery(context)
                                      : buildOthers(context),
                            ),
                            buildSubmit(context)
                          ],
                        ),
                      ),
                    ),
                  )
                ]))));
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
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Palarivattom",
                          style: TextStyle(
                            fontSize: 10,
                            // fontWeight: FontWeight.bold
                          ),
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

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20.0, top: 10, bottom: 10, right: 20),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Find Your Location",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TabBar(
              indicatorColor: Colors.amber,
              controller: controller.availableTabController,
              isScrollable: false,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: EdgeInsets.only(
                  left: controller.tabIndex == 0 ? 5 : 0,
                  right: controller.tabIndex == 0 ? 0 : 5),
              indicatorPadding: EdgeInsets.all(0),
              indicatorWeight: 0,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kPrimaryColor),
              tabs: [
                Container(
                  width: MediaQuery.of(context).size.height * .25,
                  height: MediaQuery.of(context).size.height * .13,
                  child: Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(12, 13, 52, 0.05),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            // Icon(,
                            //   size: 60,),
                            LineIcon.locationArrow(
                              size: 50,
                            ),
                            Text("Pick-Up-Hub")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.height * .25,
                  height: MediaQuery.of(context).size.height * .13,
                  child: Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(12, 13, 52, 0.05),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.only(top: 11, bottom: 11),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            // Icon(Icons.location_on,
                            //   size: 60,),
                            LineIcon.home(
                              size: 50,
                            ),
                            Text("Home Delivery")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.height * .25,
                  height: MediaQuery.of(context).size.height * .13,
                  child: Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(12, 13, 52, 0.05),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Center(
                        // alignment: Alignment.center,
                        child: Column(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 50,
                            ),
                            Text("Others")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ],
    );
  }

  Widget buildSubmit(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50.0,
        child: new RawMaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          fillColor: kPrimaryColor,
          elevation: 0.0,
          child: Center(
              child: Text(
            "Submit ",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Widget buildPickUp(BuildContext context) {
    return Column(
      children: [
        !controller.isLoading && controller.districtData.cities != null
            ? buildDropDown(context)
            : buildLoading(context),
        controller.hubData.locationoncity != null
            ? buildLocation(context)
            : Container(),
        Container(
          child: CheckboxListTile(
            value: controller.isChecked,
            selected: controller.isChecked,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              'Selected as default',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            onChanged: (val) {
              controller.isChecked = val;
              controller.update();
            },
          ),
        ),
      ],
    );
  }

  Widget buildHomeDelivery(BuildContext context) {
    return Column(
      children: [
        // buildAutoComplete(context,true),
        buildDropDown(context),
        controller.typeAheadController.text == "Kochi"
            ? buildLocation(context)
            : Container(),
        buildAddressLine(),
        Container(
          child: CheckboxListTile(
            value: controller.isChecked,
            selected: controller.isChecked,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              'Check to use current location pin to map',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            onChanged: (val) {
              controller.isChecked = val;
              controller.update();
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            "Select lat long from map",
            style: TextStyle(color: kPrimaryColor),
          ),
        )
      ],
    );
  }

  Widget buildAddressLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        child: Form(
            key: controller.formKey2,
            child: Column(
              children: [
                TextFormField(
                  minLines: 4,
                  maxLines: 6,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      contentPadding: EdgeInsets.all(12),
                      hintText: "House/Flat/Block No.",
                      labelText: "Add your delivery address"),
                ),
              ],
            )),
      ),
    );
  }

  Widget buildOthers(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        contentPadding: EdgeInsets.all(12),
                        hintText: "Home/Office/Others",
                        labelText: "Save this address as"),
                  ),
                ],
              ),
            ),
          ),
        ),
        buildDropDown(context),
        // buildAutoComplete(context,false),
        // buildFromTo(context)
        controller.typeAheadController.text == "Kochi"
            ? buildLocation(context)
            : Container(),

        buildAddressLine(),
        Container(
          child: CheckboxListTile(
            value: controller.isChecked,
            selected: controller.isChecked,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              'Selected as default',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            onChanged: (val) {
              controller.isChecked = val;
              controller.update();
            },
          ),
        ),
      ],
    );
  }

  Widget buildLocation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Select your nearest pick-up hub",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
            ),
          ),
          GridView.builder(
              padding: EdgeInsets.only(left: 10, right: 10),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 5
                        : 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 1,
                childAspectRatio: (5 / 2),
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.hubData.locationoncity.length,
              itemBuilder: (contextList, index) {
                // for(int i=0 ; i< controller.locations.length ; i++){
                //   if(model.sellerItemList[i].itemId.id==model.fishList[index].id){
                //     select=true;
                //     break;
                //   }else{
                //     select=false;
                //   }
                //
                // }
                return Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ChoiceChip(
                      label: Container(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Center(
                                child: Text(
                              controller
                                  .hubData.locationoncity[index].locationName,
                              overflow: TextOverflow.clip,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            )),
                          )),
                      selectedShadowColor: Colors.black54,
                      selected: controller.selectedIndex == index
                          ? controller.locationSelected
                          : !controller.locationSelected,
                      onSelected: (bool value) {
                        controller.locationSelected = value;
                        controller.selectedIndex = index;
                        controller.update();
                      },
                      pressElevation: 15,
                      selectedColor: kPrimaryColor,
                    ));
              })
        ],
      ),
    );
  }

  Widget buildDropDown(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.0, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton<Cities>(
                        underline: SizedBox(),
                        isExpanded: true,
                        hint: Text("Please select your  city"),
                        items:
                            controller.districtData.cities.map((Cities value) {
                          return DropdownMenuItem<Cities>(
                            value: value,
                            child: Text(
                              value.name,
                              textAlign: TextAlign.center,
                            ),
                          );
                        }).toList(),
                        value: controller.city,
                        onChanged: (val) async {
                          controller.city = val;
                          controller.update();
                          await controller.getHub(int.parse(val.id));
                          print(val.name);
                        }),
                  ),
                ),
                // TypeAheadFormField(
                //   textFieldConfiguration: TextFieldConfiguration(
                //     controller: controller.typeAheadController,
                //     decoration: InputDecoration(
                //
                //         border: OutlineInputBorder(),
                //
                //         prefixIcon: LineIcon.city(size: 18,),
                //         labelText: isHome?'Select your home city' : 'Select your city'
                //     ),
                //   ),
                //   suggestionsCallback: (pattern) {
                //     return controller.getSuggestions(pattern);
                //   },
                //   itemBuilder: (context, suggestion) {
                //     return ListTile(
                //       title: Text(suggestion),
                //     );
                //   },
                //   transitionBuilder: (context, suggestionsBox, controller) {
                //     return suggestionsBox;
                //   },
                //   onSuggestionSelected: (suggestion) {
                //     controller.typeAheadController.text = suggestion;
                //     print(suggestion);
                //   },
                //   onSaved: (value) => controller.selectedCity = value,
                // ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget buildAutoComplete(BuildContext context,bool isHome){
  //
  //   return Container(
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //       child: Form(
  //         key: controller.formKey,
  //         child: Padding(
  //           padding: EdgeInsets.only(top: 10),
  //           child: Column(
  //             children: <Widget>[
  //               TypeAheadFormField(
  //                 textFieldConfiguration: TextFieldConfiguration(
  //                     controller: controller.typeAheadController,
  //                     decoration: InputDecoration(
  //
  //                             border: OutlineInputBorder(),
  //
  //                       prefixIcon: LineIcon.city(size: 18,),
  //                         labelText: isHome?'Select your home city' : 'Select your city'
  //                     ),
  //                 ),
  //                 suggestionsCallback: (pattern) {
  //                   return controller.getSuggestions(pattern);
  //                 },
  //                 itemBuilder: (context, suggestion) {
  //                   return ListTile(
  //                     title: Text(suggestion),
  //                   );
  //                 },
  //                 transitionBuilder: (context, suggestionsBox, controller) {
  //                   return suggestionsBox;
  //                 },
  //                 onSuggestionSelected: (suggestion) {
  //                   controller.typeAheadController.text = suggestion;
  //                   print(suggestion);
  //                 },
  //                 onSaved: (value) => controller.selectedCity = value,
  //               ),
  //               SizedBox(
  //                 height: 10.0,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget buildFromTo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Container(
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
        height: MediaQuery.of(context).size.height * .13,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                controller.showSheet(context, buildDatePicker("from"), () {
                  final value =
                      DateFormat("dd/MM/yyyy").format(controller.fromDateTime);
                  print(value);
                  Navigator.pop(context);
                });
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "From",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                    ),
                    Text(
                      DateFormat.yMMMd('en_US').format(controller.fromDateTime),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "${DateFormat('EEEE').format(controller.fromDateTime)}, ${DateFormat.jm().format(controller.fromDateTime)}",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            Dash(
              direction: Axis.vertical,
              length: MediaQuery.of(context).size.height * .09,
              dashLength: 2,
              dashColor: Colors.grey,
            ),
            GestureDetector(
              onTap: () {
                controller.showSheet(context, buildDatePicker("to"), () {
                  final value =
                      DateFormat.yMMMd('en_US').format(controller.toDateTime);
                  print(value);
                  Navigator.pop(context);
                });
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                    ),
                    Text(
                      DateFormat.yMMMd('en_US').format(controller.toDateTime),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "${DateFormat('EEEE').format(controller.toDateTime)}, ${DateFormat.jm().format(controller.toDateTime)}",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker(String type) {
    return SizedBox(
      height: 180,
      child: CupertinoDatePicker(
          //initialDateTime: controller.dateTime,
          // minimumYear: ,
          // maximumYear: ,
          minimumDate: DateTime.now(),
          mode: CupertinoDatePickerMode.dateAndTime,
          onDateTimeChanged: (dateTime) {
            // _dobController.text=DateFormat("dd/MM/yyyy").format(dateTime).toString();
            print(dateTime);
            if (type == "from") {
              controller.fromDateTime = dateTime;
              controller.update();
            } else if (type == "to") {
              controller.toDateTime = dateTime;
              controller.update();
            }
          }),
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
