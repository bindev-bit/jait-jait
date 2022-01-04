import 'package:flutter/material.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/page/home/screen/message_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'screen/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
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
    return Scaffold(
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
    );
  }
}
