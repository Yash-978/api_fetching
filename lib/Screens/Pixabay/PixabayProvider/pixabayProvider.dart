import 'package:flutter/material.dart';

import '../PixabayModel/pixabayModel.dart';
import '../PixapayApiHelper.dart';

class PixabayProvider extends ChangeNotifier {
  // ApiHelper apiHelper=ApiHelper();
  PixabayModel? pixabayModel;
  String search='';
  void searchImage(String img)
  {
    search=img;
    notifyListeners();
  }



  Future<PixabayModel?> fromMap(String search) async {
    final data =await ApiHelper.apiHelper.fetchApiData(search);
    pixabayModel=PixabayModel.fromApi(data);
    notifyListeners();
    return pixabayModel;
  }
}
