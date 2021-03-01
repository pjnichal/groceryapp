import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/getcontrollers/getusersdetailcontroller.dart';

class GetUserData extends StatelessWidget {
  final String uid;
  GetUserData(this.uid);

  final GetUserDetailsController guc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: Obx(() {
        if (guc.user.fullName == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Text('loaded'),
          );
        }
      }),
    ));
  }
}
