import 'package:get/get.dart';
import 'package:grocery/getcontrollers/authcontroller.dart';
import 'package:grocery/getcontrollers/cartcontroller.dart';
import 'package:grocery/getcontrollers/getproductcontroller.dart';
import 'package:grocery/getcontrollers/getusersdetailcontroller.dart';

class AllInOneBinder extends Bindings {
  @override
  void dependencies() {
    print('here');
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => GetUserDetailsController());
    Get.lazyPut(() => GetProductController());
    Get.lazyPut(() => MyCartControoller());
  }
}
