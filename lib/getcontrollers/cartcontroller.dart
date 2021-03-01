import 'package:get/get.dart';
import 'package:grocery/model/cartitem.dart';

class MyCartControoller extends GetxController {
  var cartList = List<CartItem>().obs;
  int get totalPrice =>
      cartList.fold(0, (sum, element) => sum + element.finalprize);
  var isEmpty = true.obs;
  var deliveryCharges = 50.obs;

  void addItem(CartItem cartItem) {
    bool copy = false;
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].name == cartItem.name) {
        Get.snackbar(
          "Aready Added",
          'item already in cart',
          snackPosition: SnackPosition.BOTTOM,
        );
        copy = true;
      }
    }
    if (copy == false) {
      isEmpty.value = false;

      cartList.add(cartItem);
      print(cartList);
    }
  }

  void increaseQty(int index) {
    CartItem cartItem = cartList[index];
    cartItem.qty++;
    cartItem.finalprize = cartItem.prize * cartItem.qty;
    print(cartItem.prize);
    cartList[index] = cartItem;
    print(cartList[index].qty);
    if (totalPrice > 500) {
      deliveryCharges.value = 0;
    } else {
      deliveryCharges.value = 50;
    }
  }

  void decreaseQty(int index) {
    var cartLists = cartList;
    CartItem cartItem = cartList[index];
    if (cartItem.qty == 1) {
      cartLists.removeAt(index);
      cartList = cartLists;
      if (cartList.length == 0) {
        isEmpty.value = true;
      }
      if (totalPrice > 500) {
        deliveryCharges.value = 0;
      } else {
        deliveryCharges.value = 50;
      }
    } else {
      cartItem.qty--;
      cartItem.finalprize = cartItem.prize * cartItem.qty;
      cartList[index] = cartItem;
      if (totalPrice > 500) {
        deliveryCharges.value = 0;
      } else {
        deliveryCharges.value = 50;
      }
    }
  }

  void deleteItem(int index) {
    var cartLists = cartList;

    cartLists.removeAt(index);
    cartList = cartLists;
    if (cartList.length == 0) {
      isEmpty.value = true;
    }
    if (totalPrice > 500) {
      deliveryCharges.value = 0;
    } else {
      deliveryCharges.value = 50;
    }
  }
}
