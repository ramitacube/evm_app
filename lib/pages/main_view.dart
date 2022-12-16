import 'package:car_rental/core.dart';
import 'package:car_rental/pages/rentals/rental_view.dart';
import 'package:car_rental/pages/search/search_view.dart';
import 'package:car_rental/shared/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import 'home/home_view.dart';

class MainView extends StatefulWidget {
  dynamic currentTab;
  DateTime currentBackPressTime;
  Widget currentPage = HomeView();
  var index;
  int categoryId;
  final GlobalKey<ScaffoldState> mainScaffoldKey =
      new GlobalKey<ScaffoldState>();

  MainView({Key key, this.currentTab, this.index, this.categoryId}) {
    if (currentTab != null) {
      currentTab = currentTab;
    } else {
      currentTab = 0;
    }
  }

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  initState() {
    super.initState();

    _selectTab(widget.currentTab);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem == 5 ? 1 : tabItem;
      switch (tabItem) {
        case 0:
          widget.currentPage = HomeView();
          break;
        case 1:
          widget.currentPage = SearchView(widget.index, widget.categoryId);
          break;
        case 2:
          widget.currentPage = RentalView();
          break;
        case 3:
          widget.currentPage = NotificationView();
          break;
        case 4:
          widget.currentPage = ProfileView();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        resizeToAvoidBottomInset: false,
        key: widget.mainScaffoldKey,
        drawer: DrawerWidget(),
        bottomNavigationBar: Container(
          color: Colors.grey[200],
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kPrimaryColor,
            selectedFontSize: 10,
            unselectedFontSize: 0,
            iconSize: 20,
            elevation: 20,
            backgroundColor: Colors.white,
            selectedIconTheme: IconThemeData(size: 28),
            unselectedItemColor: Colors.grey,
            currentIndex: widget.currentTab,
            onTap: (int i) {
              this._selectTab(i);
            },
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: ImageIcon(AssetImage("assets/images/icons/home.png")),
              ),
              BottomNavigationBarItem(
                label: "Search",
                icon: ImageIcon(AssetImage("assets/images/icons/search.png")),
              ),
              BottomNavigationBarItem(
                label: "Rental",
                icon: ImageIcon(AssetImage("assets/images/icons/calendar.png")),
              ),
              BottomNavigationBarItem(
                label: "Notification",
                icon: ImageIcon(
                  AssetImage("assets/images/icons/notifications.png"),
                ),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: ImageIcon(AssetImage("assets/images/icons/profiles.png")),
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            widget.currentPage,
            // Positioned(
            //   bottom: MediaQuery.of(context).size.height * .02,
            //   left: MediaQuery.of(context).size.height * .05,
            //   right: MediaQuery.of(context).size.height * .05,
            //   child: ClipRRect(
            //       borderRadius: BorderRadius.circular(20.0),
            //       child: Stack(
            //         children: [
            //           BottomNavigationBar(
            //             type: BottomNavigationBarType.fixed,
            //             selectedItemColor: Theme.of(context).primaryColor,
            //             selectedFontSize: 0,
            //             unselectedFontSize: 0,
            //             iconSize: 20,
            //             elevation: 20,
            //             backgroundColor: Theme.of(context).accentColor,
            //             selectedIconTheme: IconThemeData(size: 28),
            //             unselectedItemColor:
            //             Theme.of(context).cursorColor.withOpacity(1),
            //             currentIndex: widget.currentTab,
            //             onTap: (int i) {
            //               this._selectTab(i);
            //             },
            //             items: [
            //               BottomNavigationBarItem(
            //                 label: "Home",
            //                 icon: ImageIcon(AssetImage("assets/images/icons/home.png")),
            //               ),
            //               BottomNavigationBarItem(
            //                 label: "Search",
            //                 icon: ImageIcon(AssetImage("assets/images/icons/search.png")),
            //               ),
            //               BottomNavigationBarItem(
            //                 label: "Rental",
            //                 icon: ImageIcon(AssetImage("assets/images/icons/calendar.png")),
            //               ),
            //               BottomNavigationBarItem(
            //                 label: "Notification",
            //                 icon: ImageIcon(
            //                   AssetImage("assets/images/icons/notifications.png"),
            //                 ),
            //               ),
            //               BottomNavigationBarItem(
            //                 label: "Profile",
            //                 icon: ImageIcon(AssetImage("assets/images/icons/profiles.png")),
            //               ),
            //             ],
            //           ),
            //         ],
            //       )
            //
            //   ),
            // ),
          ],
        ));
  }
}
