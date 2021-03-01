import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/getcontrollers/cartcontroller.dart';

class CartItemTitle extends StatelessWidget {
  final int index;
  CartItemTitle(this.index);
  final MyCartControoller cartControoller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            child: Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: NetworkImage(
                        cartControoller.cartList[index].imageUrl,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 100,
                    child: Text(
                      cartControoller.cartList[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        cartControoller.decreaseQty(index);
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4)),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Obx(() {
                          return Text(
                            cartControoller.cartList[index].qty.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          );
                        })),
                    GestureDetector(
                      onTap: () {
                        cartControoller.increaseQty(index);
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(4)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          cartControoller.deleteItem(index);
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4)),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Obx(() => Text(
                          '\u20b9' +
                              cartControoller.cartList[index].finalprize
                                  .toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
