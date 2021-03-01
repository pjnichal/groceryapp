import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:grocery/screens/loginscreen.dart';
import 'package:grocery/utils/getuserdata.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();
  String get user => _firebaseUser.value?.uid;
  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    //print(_firebaseUser.value.uid);

    super.onInit();
  }

  Future<void> creatUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Get.offAll(LoginScreen());
      Get.snackbar("Success", 'Account Created Successfully',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      //Get.snackbar("Error", user, snackPosition: SnackPosition.BOTTOM);
      Get.offAll(GetUserData(Get.find<AuthController>().user));
    } catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Error", 'User Not Registerd Please Register',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Error", e.message, snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar("Error", e, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
