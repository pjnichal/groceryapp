import 'package:flutter/material.dart';

class MyOrderTile extends StatelessWidget {
  final Function showdetail;
  final int index;
  MyOrderTile(this.showdetail, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 8,
      child: ListTile(
        title: Text('Order #1'),
        subtitle: Text('14 May'),
        trailing: Text(
          'Accepted',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        onTap: () => showdetail(index),
      ),
    );
  }
}
