import 'package:api_fetching/Screens/EcommerceApp/EcommerceModel/ecommerceModel.dart';
import 'package:api_fetching/Screens/EcommerceApp/EcommercreApiHelper/ecommerceApiHelper.dart';
import 'package:flutter/cupertino.dart';

import '../EcommerceView/EcommerceHomePage.dart';

class EcommerceProvider extends ChangeNotifier {
  EcommerceApiHelper ecommerceApiHelper = EcommerceApiHelper();
  EcommerceModel? ecommerceModel;

  Future<EcommerceModel?> fromEcommerceApi() async {
    final data = await ecommerceApiHelper.fetchEcommerceData();
    ecommerceModel = EcommerceModel.fromJson(data);
    print(
        '--------------------------------------------------provider============================');
    return ecommerceModel;
  }
}

class ECommerceHomeProvider extends ChangeNotifier {
  String? search;

  void searchProducts(String value) {
    search = value;
    notifyListeners();
  }

  void removeSearch() {
    txtEcommerceSearch.clear();
    notifyListeners();
  }
}

class ECommerceCartProvider extends ChangeNotifier {
  double price = 0;
  double discount = 0;
  int quantity = 1;

  void addQty(int index) {
    qty[index]++;
    notifyListeners();
    print('-------------------add-----------------------------');
  }

  void removeQty(int index) {
    if (qty[index] > 0) {
      qty[index]--;
      print('-------------------------remove---------------------------------');
      notifyListeners();
    }
  }

  void removeFromCart(int index) {
    price -= cartList[index].price;
    cartList.removeAt(index);
    qty[index] = 1;
    notifyListeners();
  }

  void discountedPrice() {
    for (int i = 0; i < cartList.length; i++) {
      price += cartList[i].price;
    }
    notifyListeners();
  }

  void totalPrice() {
    for (int i = 0; i < cartList.length; i++) {
      discount = cartList[i].discountPercentage + cartList[i].price;
      quantity += qty[i];
    }
    notifyListeners();
  }
}

List<int> qty = [];
List cartList = [];
