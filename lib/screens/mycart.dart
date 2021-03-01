import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/getcontrollers/cartcontroller.dart';
import 'package:grocery/screens/checkout.dart';

import 'package:grocery/widgets/carttile.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final MyCartControoller myCartControoller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' My Cart',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Obx(() {
                  if (myCartControoller.isEmpty.value) {
                    return Text('Cart Is Empty');
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: myCartControoller.cartList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CartItemTitle(index);
                        });
                  }
                }),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Text(
                        'Total',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Obx(() => Text(
                            '\u20b9' + myCartControoller.totalPrice.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Charges',
                      style: TextStyle(fontSize: 18),
                    ),
                    Obx(() {
                      return Text(
                        '\u20b9 ' +
                            myCartControoller.deliveryCharges.toString(),
                        style: TextStyle(fontSize: 18),
                      );
                    }),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Text(
                        'Sub Total',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Obx(() {
                        var subtotal;
                        if (myCartControoller.totalPrice == 0) {
                          subtotal = 0;
                        } else {
                          subtotal = myCartControoller.totalPrice +
                              myCartControoller.deliveryCharges.value;
                        }

                        return Text(
                          '\u20b9 ' + subtotal.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23),
                        );
                      }),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  child: Obx(() => RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          'PROCEED TO CHECKOUT',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        onPressed: (myCartControoller.isEmpty.value)
                            ? null
                            : () {
                                Get.to(CheckOut());
                              },
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
