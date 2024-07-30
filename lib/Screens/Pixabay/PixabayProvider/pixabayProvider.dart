import 'package:flutter/material.dart';

import '../PixabayModel/pixabayModel.dart';
import '../PixapayApiHelper.dart';

class PixabayProvider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();
  PixabayModel? pixabayModel;
  String search = 'flower';

  void searchImage(String img) {
    search = img;
    notifyListeners();
  }

  Future<PixabayModel?> fromApi(String img) async {
    final data = await apiHelper.fetchApiData(img);
    pixabayModel = PixabayModel.fromJson(data);
    notifyListeners();
    return pixabayModel;
  }
}
