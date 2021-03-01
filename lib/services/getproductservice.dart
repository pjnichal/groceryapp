import 'package:get/get.dart';
import 'package:grocery/model/product.dart';
import 'package:http/http.dart' as http;

class GetProductService {
  static var client = http.Client();
  static Future<List<Product>> fetchProducts() async {
    var response = await client.get(
        'http://10.0.2.2:5001/groceryapp-b9c14/us-central1/app/api/readproduct');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      Get.snackbar("Error", "Something Went Wrong",
          snackPosition: SnackPosition.BOTTOM);
      //show error message
      return null;
    }
  }
}
