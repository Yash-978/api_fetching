import 'package:flutter/material.dart';

class RecipeDetailProvider extends ChangeNotifier {
  int selectedPage = 0;

  void newPage(int value) {
    selectedPage = value;

    notifyListeners();
  }
}
