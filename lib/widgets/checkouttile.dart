import 'package:flutter/material.dart';

class CheckOutTile extends StatelessWidget {
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
                        'https://i.pinimg.com/736x/05/79/5a/05795a16b647118ffb6629390e995adb.jpg',
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
                      'Orange',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '200kg Pack : Qty 4',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        )),
                    Spacer(),
                    Text(
                      '\u20b9 100',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
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
