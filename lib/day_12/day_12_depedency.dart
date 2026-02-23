import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavCustomDay12 extends StatefulWidget {
  const BottomNavCustomDay12({super.key});

  @override
  State<BottomNavCustomDay12> createState() => _BottomNavCustomDay12State();
}

class _BottomNavCustomDay12State extends State<BottomNavCustomDay12> {
  @override
  Widget build(BuildContext context) {
    return GNav(
      // rippleColor: Colors.grey[800], // tab button ripple color when pressed
      // hoverColor: Colors.grey[700], // tab button hover color
      haptic: true, // haptic feedback
      tabBorderRadius: 15,
      tabActiveBorder: Border.all(
        color: Colors.black,
        width: 1,
      ), // tab button border
      tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
      tabShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8),
      ], // tab button shadow
      curve: Curves.easeOutExpo, // tab animation curves
      duration: Duration(milliseconds: 900), // tab animation duration
      gap: 8, // the tab button gap between icon and text
      color: Colors.grey[800], // unselected icon color
      activeColor: Colors.purple, // selected icon and text color
      iconSize: 24, // tab button icon size
      tabBackgroundColor: Colors.purple.withOpacity(
        0.1,
      ), // selected tab background color
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ), // navigation bar padding
      tabs: [
        GButton(icon: Icons.home, text: 'Home'),
        GButton(icon: Icons.hearing, text: 'Likes'),
        GButton(icon: Icons.search, text: 'Search'),
        GButton(icon: Icons.person, text: 'Profile'),
      ],
    );

    // Scaffold(
    //   body: listWidget.elementAt(_currentIndex),
    //   bottomNavigationBar: BottomNavigationBar(
    //     items: [
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: "Home",
    //         backgroundColor: AppColor.army1,
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.search),
    //         label: "Search",
    //         backgroundColor: AppColor.army1,
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.person),
    //         label: "Profile",
    //         backgroundColor: AppColor.army1,
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.logout),
    //         label: "Logout",
    //         backgroundColor: AppColor.army1,
    //       ),
    //     ],
    //     // selectedLabelStyle: TextStyle(color: Colors.blue),
    //     selectedItemColor: Colors.black,
    //     selectedIconTheme: IconThemeData(color: AppColor.black22),
    //     currentIndex: _currentIndex,
    //     onTap:
    //         //Boleh pake ini
    //         // (index) {
    //         //   _currentIndex = index;
    //         //   setState(() {});
    //         // },
    //         //Sebaik pake ini
    //         ontapItem,
    //   ),
    // );
  }
}
