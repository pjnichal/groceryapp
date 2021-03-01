import 'package:flutter/material.dart';
import 'package:grocery/model/product.dart';

class OrderList extends StatelessWidget {
  final Product product;
  final Function addCart;
  final int index;

  OrderList(this.addCart, this.index, this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\u20b9 ' + product.price.toString(),
                    style: const TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  RaisedButton(
                    onPressed: () => addCart(product),
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Add Cart",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Image.network(
                product.imageUrl,
                width: 150,
              ),
            )
          ],
        ),
      ),
    );
  }
}
