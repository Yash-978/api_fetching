import 'package:api_fetching/Screens/EcommerceApp/EcommerceProvider/ecommerceProvider.dart';
import 'package:api_fetching/Screens/EcommerceApp/EcommerceView/EcommerceHomePage.dart';
import 'package:api_fetching/Screens/RecipeApp/RecipeProvider/recipeProvider.dart';
import 'package:api_fetching/Screens/RecipeApp/RecipeView/recipeView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/Pixabay/PixabayProvider/pixabayProvider.dart';
import 'Screens/Pixabay/PixabayScreenView/pixabayPageView.dart';
import 'Screens/RecipeApp/RecipeProvider/RecipeDetailProvider.dart';
import 'Screens/RecipeApp/RecipeView/recipeDetailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PixabayProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecipeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecipeDetailProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EcommerceProvider(),
        ),
      ],
      builder: (context, child) =>
          MaterialApp(
            debugShowCheckedModeBanner: false,
            // theme: ThemeData.light(),
            // darkTheme: ThemeData.dark(),
            // themeMode: ThemeMode.system,
            initialRoute: '/ecomHome',
            routes: {
              '/': (context) => PixabayPageView(),
              '/recipe': (context) => RecipePageView(),
              '/recipeDetail': (context) => RecipeDetailPage(),
              '/ecomHome': (context) => EcommerceHomePage(),
            },
          ),
    );
  }
}
