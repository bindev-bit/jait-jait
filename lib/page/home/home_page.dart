import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/data/getx/onboarding_getx.dart';
import 'package:jait_jait/page/home/screen/list_user.dart';
import 'package:jait_jait/page/home/screen/message_screen.dart';
import 'package:jait_jait/page/root.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'screen/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PersistentTabController _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final OnBoardingController onBoardingController = Get.find();

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(_scaffoldKey),
      // const RoomsPage(),
      MessageScreen(),
      Container(),
      Container(),
    ];
  }

  List<PersistentBottomNavBarItem> _listItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        inactiveIcon: const Icon(Icons.home_outlined),
        title: "Home",
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: primaryColor.withOpacity(.3),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.message),
        inactiveIcon: const Icon(Icons.message_outlined),
        title: ("Messages"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: primaryColor.withOpacity(.3),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.article_rounded),
        inactiveIcon: const Icon(Icons.article_outlined),
        title: ("Articles"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: primaryColor.withOpacity(.3),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shop),
        inactiveIcon: const Icon(Icons.shop_outlined),
        title: ("Shops"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: primaryColor.withOpacity(.3),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: Container(
            color: primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        const DrawerHeader(
                          child: CircleAvatar(
                            backgroundColor: primaryColor,
                            backgroundImage:
                                AssetImage('assets/img/avatars/avatar1.jpg'),
                          ),
                        ),
                        ListTile(
                          title: const Text('Item 1'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('Item 2'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Log out",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Root()));
                      onBoardingController.firstBuildScreen();
                      await Future.delayed(const Duration(milliseconds: 500),
                          () async {
                        await FirebaseAuth.instance.signOut();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _listItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          hideNavigationBarWhenKeyboardShows: true,
          margin: const EdgeInsets.all(0.0),
          popActionScreens: PopActionScreensType.all,
          bottomScreenMargin: 0.0,
          decoration: NavBarDecoration(
            colorBehindNavBar: Colors.indigo,
            borderRadius: BorderRadius.circular(20.0),
          ),
          popAllScreensOnTapOfSelectedTab: true,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle:
              NavBarStyle.style3, // Choose the nav bar style with this property
        ),
      ),
    );
  }
}
