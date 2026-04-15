import 'package:flutter/material.dart';
import 'package:ppkd_b_5/day_14/list.dart';
import 'package:ppkd_b_5/day_14/list_map.dart';
import 'package:ppkd_b_5/day_14/model_ui.dart';
import 'package:ppkd_b_5/day_15/day_15.dart';
import 'package:ppkd_b_5/day_16_17_18/database/preference.dart';
import 'package:ppkd_b_5/day_16_17_18/view/cr_siswa.dart';
import 'package:ppkd_b_5/day_29/views/get_user_screen.dart';
import 'package:ppkd_b_5/day_29/views/get_user_screen_stateful.dart';
import 'package:ppkd_b_5/day_30/views/login_screen.dart';
import 'package:ppkd_b_5/day_31/views/map_screen.dart';
import 'package:ppkd_b_5/day_40/views/crud_screen.dart';
import 'package:ppkd_b_5/extension/navigator.dart';
import 'package:ppkd_b_5/random_picker/random_picker_screen.dart';

class DrawerGlobal extends StatefulWidget {
  const DrawerGlobal({super.key});

  @override
  State<DrawerGlobal> createState() => _DrawerGlobalState();
}

class _DrawerGlobalState extends State<DrawerGlobal> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void ontapItem(int index) {
    _currentIndex = index;
    setState(() {});
  }

  void ontapItemDrawer(int index) {
    _currentIndex = index;
    setState(() {});
    context.pop();
  }

  static List<Widget> listWidget = [
    ListViewBuilderDay14List(),
    ListMapScreen(),
    ModelListViewBuilderDay14(),
    TextFormDay15(),
    CrSiswaScreenDay17(),
    GetUserScreenDay29(),
    GetUserStatefulScreenDay29(),
    RandomPickerScreen(),
    MapScreenDay31(),
    CRUDFirebaseScreenDay40(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Drawer"),
        leading: InkWell(
          onTap: () => _scaffoldKey.currentState?.openDrawer(),

          child: Icon(Icons.abc),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Container(color: Colors.blue)),
            ListTile(
              title: Text("List in ListView Builder"),
              onTap: () {
                ontapItemDrawer(0);
              },
            ),
            ListTile(
              title: Text("List Map in ListView Builder"),
              onTap: () {
                ontapItemDrawer(1);
              },
            ),
            ListTile(
              title: Text("List Map in ListView Builder"),
              onTap: () {
                ontapItemDrawer(2);
              },
            ),
            ListTile(
              title: Text("Text Form Validator"),
              onTap: () {
                ontapItemDrawer(3);
              },
            ),
            ListTile(
              title: Text("CR Siswa"),
              onTap: () {
                ontapItemDrawer(4);
              },
            ),
            ListTile(
              title: Text("Get User Screen"),
              onTap: () {
                ontapItemDrawer(5);
              },
            ),
            ListTile(
              title: Text("Get User Stateful Screen"),
              onTap: () {
                ontapItemDrawer(6);
              },
            ),
            ListTile(
              title: Text("Random Picker"),
              onTap: () {
                ontapItemDrawer(7);
              },
            ),
            ListTile(
              title: Text("Google Maps"),
              onTap: () {
                ontapItemDrawer(8);
              },
            ),
            ListTile(
              title: Text("Firebase CRUD"),
              onTap: () {
                ontapItemDrawer(9);
              },
            ),
            ListTile(
              title: Text("Logout"),
              onTap: () {
                PreferenceHandler().deleteIsLogin();
                context.pushAndRemoveAll(LoginScreenDay30());
              },
            ),
          ],
        ),
      ),
      body: listWidget.elementAt(_currentIndex),

      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: GNav(
      //     backgroundColor: AppColor.gray88,
      //     // rippleColor: Colors.grey[800], // tab button ripple color when pressed
      //     // hoverColor: Colors.grey[700], // tab button hover color
      //     haptic: true, // haptic feedback
      //     tabBorderRadius: 15,
      //     tabActiveBorder: Border.all(
      //       color: Colors.black,
      //       width: 1,
      //     ), // tab button border
      //     tabBorder: Border.all(
      //       color: Colors.grey,
      //       width: 1,
      //     ), // tab button border
      //     tabShadow: [
      //       BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8),
      //     ], // tab button shadow
      //     curve: Curves.easeOutExpo, // tab animation curves
      //     duration: Duration(milliseconds: 900), // tab animation duration
      //     gap: 8, // the tab button gap between icon and text
      //     color: Colors.grey[800], // unselected icon color
      //     activeColor: Colors.purple, // selected icon and text color
      //     iconSize: 24, // tab button icon size
      //     tabBackgroundColor: Colors.purple.withOpacity(
      //       0.1,
      //     ), // selected tab background color
      //     onTabChange: ontapItem,
      //     padding: EdgeInsets.symmetric(
      //       horizontal: 20,
      //       vertical: 5,
      //     ), // navigation bar padding
      //     tabs: [
      //       GButton(icon: Icons.home, text: 'Home'),
      //       GButton(icon: Icons.hearing, text: 'Likes'),
      //       GButton(icon: Icons.search, text: 'Search'),
      //       GButton(icon: Icons.person, text: 'Profile'),
      //     ],
      //   ),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "Home",
      //       backgroundColor: AppColor.army1,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: "Search",
      //       backgroundColor: AppColor.army1,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: "Profile",
      //       backgroundColor: AppColor.army1,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.logout),
      //       label: "Logout",
      //       backgroundColor: AppColor.army1,
      //     ),
      //   ],
      //   // selectedLabelStyle: TextStyle(color: Colors.blue),
      //   selectedItemColor: Colors.black,
      //   selectedIconTheme: IconThemeData(color: AppColor.black22),
      //   currentIndex: _currentIndex,
      //   onTap:
      //       //Boleh pake ini
      //       // (index) {
      //       //   _currentIndex = index;
      //       //   setState(() {});
      //       // },
      //       //Sebaik pake ini
      //       ontapItem,
      // ),
    );
  }
}
