import 'package:api_fetching/Screens/EcommerceApp/EcommerceModel/ecommerceModel.dart';
import 'package:api_fetching/Screens/EcommerceApp/EcommercreApiHelper/ecommerceApiHelper.dart';
import 'package:flutter/cupertino.dart';

class EcommerceProvider extends ChangeNotifier{
  EcommerceApiHelper ecommerceApiHelper =EcommerceApiHelper();
  EcommerceModel? ecommerceModel;
  Future<EcommerceModel?>fromEcommerceApi()async{
    final data = await ecommerceApiHelper.fetchEcommerceData();
    ecommerceModel=EcommerceModel.fromJson(data);
    print('--------------------------------------------------provider============================');
    return ecommerceModel;
  }


}