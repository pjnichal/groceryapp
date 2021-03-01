import 'package:get/get.dart';
import 'package:grocery/getcontrollers/authcontroller.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/screens/homescreen.dart';
import 'package:grocery/services/getuserservice.dart';

class GetUserDetailsController extends GetxController {
  var _user = MyUser().obs;
  MyUser get user => _user.value;
  @override
  void onInit() {
    super.onInit();
    fectdata();
  }

  void fectdata() async {
    var myUser =
        await GetUserService.fectProdouct(Get.find<AuthController>().user);
    if (myUser != null) {
      _user.value = myUser;
      Get.offAll(HomeScreen());
    } else {
      Get.snackbar(
          "Please Check Your Internet Connection", "CONNECT AND RESTART APP",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void fectdataagain() async {
    var myUser =
        await GetUserService.fectProdouct(Get.find<AuthController>().user);
    if (myUser != null) {
      _user.value = myUser;
    } else {
      Get.snackbar(
          "Please Check Your Internet Connection", "CONNECT AND RESTART APP",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
