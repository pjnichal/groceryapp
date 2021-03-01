import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/getcontrollers/getproductcontroller.dart';

import 'package:grocery/screens/mycart.dart';
import 'package:grocery/screens/myorder.dart';
import 'package:grocery/screens/profile.dart';
import 'package:grocery/screens/takeorder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GetProductController getProductController = Get.find();
  int _currentIndex = 0;

  final List<Widget> _children = [
    TakeOrder(),
    MyCart(),
    MyOrders(),
    MyProfile(),
  ];
  void onTabTapped(int index) {
    setState(() {
      if (index == 0) {
        getProductController.fetchProducts();
      }
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //void signOut() {}
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Sign Out'),
                ),
              ];
            },
          )
        ],
        title: Text('Login change to getusers'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blue,
        onTap: onTabTapped,
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: new Icon(Icons.menu),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt), label: 'My Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
