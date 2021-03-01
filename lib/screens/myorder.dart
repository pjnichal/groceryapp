import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grocery/screens/orderdetail.dart';
import 'package:grocery/widgets/myordertile.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  void showdetailed(int index) {
    Get.to(OrderDetail(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return MyOrderTile(showdetailed, index);
          }),
    );
  }
}
