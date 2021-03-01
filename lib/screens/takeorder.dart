import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/getcontrollers/cartcontroller.dart';
import 'package:grocery/getcontrollers/getproductcontroller.dart';
import 'package:grocery/model/cartitem.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/widgets/ordertile.dart';

class TakeOrder extends StatefulWidget {
  @override
  _TakeOrderState createState() => _TakeOrderState();
}

class _TakeOrderState extends State<TakeOrder> {
  final GetProductController getProductController = Get.find();
  final MyCartControoller myCartControoller = Get.find();
  void addCart(Product product) {
    CartItem cartItem = new CartItem(
        finalprize: product.price,
        name: product.name,
        prize: product.price,
        imageUrl: product.imageUrl,
        qty: 1);
    myCartControoller.addItem(cartItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (getProductController.isLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return ListView.builder(
              itemCount: getProductController.productList.length,
              itemBuilder: (BuildContext context, int index) {
                return OrderList(
                    addCart, index, getProductController.productList[index]);
              });
      }),
    );
  }
}
