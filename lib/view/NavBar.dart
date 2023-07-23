
import 'package:doctor_appoinment_app/view/home_page/CalendarPage.dart';
import 'package:doctor_appoinment_app/view/home_page/NotePage.dart';
import 'package:doctor_appoinment_app/view/home_page/SettingPage.dart';
import 'package:doctor_appoinment_app/view/home_page/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class NavBar extends StatefulWidget {
  @override
  State createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // final List<TitledNavigationBarItem> items =

  bool navBarMode = false;
  var currentIndex = 0;
  var icon_width = 25.0;

  var pages = [HomePage(), NotePage(), CalendarPage(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TitledBottomNavigationBar(
        indicatorColor: Colors.orange,
        currentIndex: currentIndex,
        enableShadow: false,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          // print(index);
        },
        reverse: navBarMode,
        curve: Curves.easeInBack,
        items: [
          TitledNavigationBarItem(
              title: Text('Home'),
              icon: currentIndex == 0
                  ? Image.asset(
                      "assets/images/pharmacy_active.png",
                     width: icon_width,
                    )
                  : Image.asset(
                      "assets/images/pharmacy_inactive.png",
                      width: icon_width,
                    )),
          TitledNavigationBarItem(
              title: Text('Home'),
              icon: currentIndex == 1
                  ? Image.asset(
                      "assets/images/note_active.png",
                      width: icon_width,
                    )
                  : Image.asset(
                      "assets/images/note_inactive.png",
                      width: icon_width,
                    )),
          TitledNavigationBarItem(
              title: Text('Home'),
              icon: currentIndex == 2
                  ? Image.asset(
                      "assets/images/calendar_active.png",
                      width: icon_width,
                    )
                  : Image.asset(
                      "assets/images/calendar_inactive.png",
                      width: icon_width,
                    )),
          TitledNavigationBarItem(
              title: Text('Home'),
              icon: currentIndex == 3
                  ? Image.asset(
                      "assets/images/setting_active.png",
                      width: icon_width,
                    )
                  : Image.asset(
                      "assets/images/setting_inactive.png",
                      width: icon_width,
                    )),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}

// Color activeColor = Color(0xff fd8311);
// Color activeColor = Color(0xff a5bcda);

