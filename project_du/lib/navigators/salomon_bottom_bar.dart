import 'package:flutter/material.dart';

import 'package:project_du/screens/account_screen.dart';
import 'package:project_du/tabFirst/gameplay.dart';

import 'package:project_du/tabSecond/history.dart';
import 'package:project_du/tabThird/notifications.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MySalomonBottomBar extends StatefulWidget {
  const MySalomonBottomBar({super.key});

  @override
  State<MySalomonBottomBar> createState() => _MySalomonBottomBarState();
}

class _MySalomonBottomBarState extends State<MySalomonBottomBar> {
  var _currentIndex = 0;
  List<Widget> body = const [
    MyGameplayPage(),
    MyHistoryPage(),
    MyNotificationsPage(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SalomonBottomBar(
        selectedColorOpacity: 0.6,
        selectedItemColor: const Color.fromRGBO(149, 5, 227, 0.7),
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.filter_vintage,
              color: Colors.purple,
            ),
            title: const Text(
              "Jeu",
              style: TextStyle(color: Colors.white, fontSize: 17.0),
            ),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.history_edu,
              color: Colors.purple,
            ),
            title: const Text(
              "Histoire",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.purple,
            ),
            title: const Text(
              "Notifications",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.person,
              color: Colors.purple,
            ),
            title: const Text(
              "Profil",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Center(child: body[_currentIndex]),
      //  ),
    );
  }
}
