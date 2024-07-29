import 'package:flutter/material.dart';

import '../RecipeApiHelper.dart';
import '../RecipeModel/recipeModel.dart';

class RecipeProvider extends ChangeNotifier {
  RecipeApiHelper recipeApiHelper = RecipeApiHelper();
  RecipeModel? recipeModel;

  Future<RecipeModel?> fromApi() async {
    print('------------------------------provider----------------------------------');
    final data = await recipeApiHelper.fetchRecipeApiData();
    recipeModel = RecipeModel.fromJson(data);

    print('=====provider');
    return recipeModel;
  }
}
