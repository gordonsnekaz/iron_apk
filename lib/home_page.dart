import 'package:flutter/material.dart';
import 'package:ironapk/account_screen.dart';
import 'package:ironapk/history_screen.dart';
import 'package:ironapk/landing_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<HomePage> createState() => _HomePageState(username);
}

class _HomePageState extends State<HomePage> {
  String uname = '';

  _HomePageState(String username) {
    uname = username;
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);

  //Bottom navigation screens
  List<Widget> _buildScreens() {
    return [
      HistoryPage(),
      LandingPage(),
      const AccountPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.history),
        title: ("History"),
        activeColorPrimary: const Color(0xff51A71D),
        inactiveColorPrimary: const Color(0xff4A4A4A),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        title: ("Home"),
        activeColorPrimary: const Color(0xff51A71D),
        inactiveColorPrimary: const Color(0xff4A4A4A),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline),
        title: ("Account"),
        activeColorPrimary: const Color(0xff51A71D),
        inactiveColorPrimary: const Color(0xff4A4A4A),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: const Color(0xffFFFFFF),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        colorBehindNavBar: Color(0xffFFFFFF),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 400),
      ),
      navBarHeight: 60,
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}
