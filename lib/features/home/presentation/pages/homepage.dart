// ignore_for_file: prefer_const_constructors

import 'package:dro_health_app/core/pallet.dart';
import 'package:dro_health_app/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'community.dart';
import 'doctors.dart';
import 'home.dart';
import 'pharmacy.dart';
import 'profile.dart';

class HomePageView extends StatefulWidget {
  HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int _currentIndex = 2;

  final _editingController = TextEditingController();

  final List<Widget> _children = [
    HomePage(),
    DcotorsPage(),
    PharmacyPage(),
    CommunityPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: _children[_currentIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        }, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Pallet.purple,
              size: 30,
            ),
            // backgroundColor: kBlue,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.person,
              color: Pallet.purple,
              size: 30,
            ),
            label: 'Doctors',
            // backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline_rounded,
              color: Colors.grey,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.shopping_cart_outlined,
              color: Pallet.purple,
              size: 30,
            ),
            label: 'Pharmacy',
            // backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline_rounded,
              color: Colors.grey,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.chat_bubble_outline_rounded,
              color: Pallet.purple,
              size: 30,
            ),
            label: 'Community',
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_pin,
              color: Colors.grey,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.person_pin,
              color: Pallet.purple,
              size: 30,
            ),
            label: 'Profile',
            // backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
