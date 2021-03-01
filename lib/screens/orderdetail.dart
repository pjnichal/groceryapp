import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  final int index;
  OrderDetail(this.index);
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: Center(
        child: Text('${widget.index} is clicked'),
      ),
    );
  }
}
