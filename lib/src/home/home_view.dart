import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:mama_app_flutter/src/account/login/view/login_view.dart';
import 'package:mama_app_flutter/src/core/user_account/auth_manager.dart';
import 'package:mama_app_flutter/src/home/home_view_controller.dart';

import '../mama_map/view/mama_map_view.dart';
import '../profile/view/profile_view.dart';
import '../user_scores/view/user_scores_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  List<Widget> _googleNavBarWidgets = [
    ListView(
      children: [
        Lottie.asset('assets/cute_dog.json'),
        const Text('Ahmet Ozkan', textAlign: TextAlign.center)
      ],
    ),
    const MamaMapView(),
    const UserScoresView(),
    const ProfileView()
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
          padding: const EdgeInsets.all(12.0),
          child: _googleNavBarWidgets
              .elementAt(_homeViewController.gnavIndex.value),
        ),
      ),
      // drawer: Drawer(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12.0),
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
          duration: const Duration(milliseconds: 200), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey[400], // unselected icon color
          activeColor:
              Theme.of(context).primaryColor, // selected icon and text color
          iconSize: 24, // tab button icon size
          // tabBackgroundColor: Colors.purple
          //     .withOpacity(0.1), // selected tab background color
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
          tabs: [
            const GButton(
              icon: Icons.home,
            ),
            const GButton(
              icon: Icons.pets,
            ),
            const GButton(
              icon: Icons.show_chart_outlined,
            ),
            const GButton(
              icon: Icons.person,
            ),
          ]),
    );
  }
}
