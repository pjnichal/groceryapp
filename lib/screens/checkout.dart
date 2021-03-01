import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/getcontrollers/cartcontroller.dart';

import 'package:grocery/widgets/checkouttile.dart';

class CheckOut extends StatelessWidget {
  final MyCartControoller myCartControoller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Check Out',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(
                              5.0) //         <--- border radius here
                          ),
                    ),
                    width: double.infinity,
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Address',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text('Address'),
                          Text('Address'),
                        ],
                      ),
                    ),
                  ),
                  Obx(() {
                    if (myCartControoller.isEmpty.value) {
                      return Text('Cart Is Empty');
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return CheckOutTile();
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
                              '\u20b9' +
                                  myCartControoller.totalPrice.toString(),
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
      ),
    );
  }
}
