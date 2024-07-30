import 'package:api_fetching/Screens/Pixabay/PixabayScreenView/pixabayPageView.dart';
import 'package:flutter/material.dart';

import '../PixabayModel/pixabayModel.dart';
import '../PixapayApiHelper.dart';
int selectWallpaperPage = 0;
class PixabayProvider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();
  PixabayModel? pixabayModel;
  String search = 'flower';
  int selectWallpaperPage = 0;

  void searchImage(String img) {
    search = img;
    notifyListeners();
  }
  void clearField()
  {
    txtSearch.clear();
  }
  void selectedImage(int index)
  {
    selectWallpaperPage = index ;
    notifyListeners();
  }

  Future<PixabayModel?> fromApi(String img) async {
    final data = await apiHelper.fetchApiData(img);
    pixabayModel = PixabayModel.fromJson(data);
    // notifyListeners();
    return pixabayModel;
  }
}
