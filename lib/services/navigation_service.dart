import 'package:flutter/material.dart';

class NavigationService {
  List<BottomNavigationBarItem> getNavigationItemList() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),

      // BubbleBottomBarItem(
      //     backgroundColor: kPrimaryColor,
      //     icon: Icon(
      //       LineIcons.home,
      //       color: Colors.black54,
      //     ),
      //     activeIcon: Icon(LineIcons.home),
      //     title: Text("Home")),
      // BubbleBottomBarItem(
      //     backgroundColor: kPrimaryColor,
      //     icon: Icon(
      //       LineIcons.search,
      //       color: Colors.black54,
      //     ),
      //     activeIcon: Icon(LineIcons.search),
      //     title: Text("Search")),
      // BubbleBottomBarItem(
      //     backgroundColor: kPrimaryColor,
      //     icon: Icon(
      //       LineIcons.car,
      //       color: Colors.black54,
      //     ),
      //     activeIcon: Icon(LineIcons.car),
      //     title: Text("Rentals")),
      // BubbleBottomBarItem(
      //     backgroundColor: kPrimaryColor,
      //     icon: //Badge(
      //       // padding:
      //       //     EdgeInsets.only(top: 5.0, bottom: 5.0, right: 4.0, left: 5.0),
      //       // animationType: BadgeAnimationType.scale,
      //       // animationDuration: Duration(milliseconds: 200),
      //       // badgeContent: Text(
      //       //   '',
      //       //   style: TextStyle(fontSize: 12, color: Colors.white),
      //       // ),
      //        Icon(
      //         LineIcons.bell,
      //         color: Colors.black54,
      //       ),
      //     //),
      //     activeIcon: Icon(LineIcons.bell),
      //     title: Text("Notification",
      //     style: TextStyle(
      //       fontSize: 12
      //     ),)),
      // BubbleBottomBarItem(
      //     backgroundColor: kPrimaryColor,
      //     icon: Icon(
      //       LineIcons.userAlt,
      //       color: Colors.black54,
      //     ),
      //     activeIcon: Icon(LineIcons.user),
      //     title: Text("Profile"))
    ];
  }
}
