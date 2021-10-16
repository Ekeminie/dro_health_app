import 'package:get/get.dart';

class CartController extends GetxController {
  Rx<int> totalPrice = 0.obs;
  Rx<int> totalItems = 0.obs;

  var cartList = [].obs;
}
