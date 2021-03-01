import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/getcontrollers/authcontroller.dart';
import 'package:grocery/screens/loginscreen.dart';
import 'package:grocery/utils/getuserdata.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user != null)
          ? GetUserData(Get.find<AuthController>().user)
          : LoginScreen();
    });
  }
}
