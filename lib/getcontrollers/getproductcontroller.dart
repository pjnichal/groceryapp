import 'package:get/get.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/services/getproductservice.dart';

class GetProductController extends GetxController {
  var isLoading = true.obs;
  var productList = List<Product>().obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    print('fectcalled');
    try {
      isLoading(true);
      var products = await GetProductService.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
