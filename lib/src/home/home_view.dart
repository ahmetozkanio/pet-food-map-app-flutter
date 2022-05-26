import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mama_app_flutter/src/account/login/view/login_view.dart';
import 'package:mama_app_flutter/src/core/user_account/auth_manager.dart';
import 'package:mama_app_flutter/src/home/home_view_controller.dart';

import '../mama_map/view/mama_map_view.dart';
import '../profile/view/profile_view.dart';
import '../user_scores/view/user_scores_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  List<Widget> _googleNavBarWidgets = [
    Text(
      'Hosgeldin',
    ),
    MamaMapView(),
    UserScoresView(),
    ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    HomeViewController _homeViewController = Get.put(HomeViewController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mama App',
          style:
              TextStyle(color: Theme.of(context).textTheme.titleLarge!.color),
        ),
        iconTheme:
            IconThemeData(color: Theme.of(context).textTheme.titleLarge!.color),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Obx(
        () => Container(
          padding: EdgeInsets.all(12.0),
          child: _googleNavBarWidgets
              .elementAt(_homeViewController.gnavIndex.value),
        ),
      ),
      // drawer: Drawer(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12.0),
        child: googleNavbar(_homeViewController, context),
      ),
    );
  }

  Container googleNavbar(_controllerAdmin, BuildContext context) {
    return Container(
      child: GNav(
          selectedIndex: _controllerAdmin.gnavIndex.value,
          onTabChange: (index) {
            _controllerAdmin.gnavIndex.value = index;
          },
          // rippleColor: Color.fromARGB(
          //     255, 66, 66, 66), // tab button ripple color when pressed
          // hoverColor:
          //     Color.fromARGB(255, 97, 97, 97), // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 15,
          tabActiveBorder: Border.all(
              color: Theme.of(context).backgroundColor,
              width: 1), // tab button border
          // tabBorder: Border.all(
          //     color: Colors.grey, width: 1), // tab button border
          // tabShadow: [
          //   BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
          // ], // tab button shadow
          curve: Curves.easeOutExpo, // tab animation curves
          duration: Duration(milliseconds: 200), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey[400], // unselected icon color
          activeColor:
              Theme.of(context).primaryColor, // selected icon and text color
          iconSize: 24, // tab button icon size
          // tabBackgroundColor: Colors.purple
          //     .withOpacity(0.1), // selected tab background color
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
          tabs: [
            GButton(
              icon: Icons.home,
            ),
            GButton(
              icon: Icons.pets,
            ),
            GButton(
              icon: Icons.show_chart_outlined,
            ),
            GButton(
              icon: Icons.person,
            ),
          ]),
    );
  }
}
