import 'package:flutter/material.dart';

// class RecipeModel {
//   late List<Recipe> recipes;
//
//   RecipeModel({required this.recipes});
//
//   factory RecipeModel.fromJson(Map m1) {
//     return RecipeModel(
//         recipes: (m1['recipes'] as List)
//             .map(
//               (e) => Recipe.fromJson(e),
//             )
//             .toList());
//   }
// }
//
// class Recipe {
//   late int id,
//       prepTimeMinutes,
//       cookTimeMinutes,
//       servings,
//       caloriesPerServing,
//       userId,
//       reviewCount;
//   late String name, image, difficulty, cuisine;
//   late List ingredients, instructions, tags, mealType;
//   late double ratings;
//
//   Recipe({
//     required this.id,
//     required this.prepTimeMinutes,
//     required this.cookTimeMinutes,
//     required this.servings,
//     required this.caloriesPerServing,
//     required this.userId,
//     required this.ratings,
//     required this.reviewCount,
//     required this.name,
//     required this.image,
//     required this.difficulty,
//     required this.cuisine,
//     required this.ingredients,
//     required this.instructions,
//     required this.tags,
//     required this.mealType,
//   });
//
//   factory Recipe.fromJson(Map m1) {
//     return Recipe(
//       id: m1['id'],
//       prepTimeMinutes: m1['prepTimeMinutes'],
//       cookTimeMinutes: m1['cookTimeMinutes'],
//       servings: m1['servings'],
//       caloriesPerServing: m1['caloriesPerServing'],
//       userId: m1['userId'],
//       ratings: m1['ratings'].toDouble(),
//       reviewCount: m1['reviewCount'],
//       name: m1['name'],
//       image: m1['image'],
//       difficulty: m1['difficulty'],
//       cuisine: m1['cuisine'],
//       ingredients: m1['ingredients'],
//       instructions: m1['instructions'],
//       tags: m1['tags'],
//       mealType: m1['mealType'],
//     );
//   }
// }
class RecipeModel {
  late List<Recipe> recipes;
  late int total, skip, limit;

  RecipeModel({
    required this.recipes,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory RecipeModel.fromJson(Map m1) {
    return RecipeModel(
      recipes: (m1['recipes'] as List)
          .map(
            (e) => Recipe.fromJson(e),
          )
          .toList(),
      total: m1['total'],
      skip: m1['skip'],
      limit: m1['limit'],
    );
  }
}

class Recipe {
  late int id,
      prepTimeMinutes,
      cookTimeMinutes,
      servings,
      caloriesPerServing,
      userId,
      reviewCount;
  late String name, difficulty, cuisine, image;
  late List ingredients, instructions, tags, mealType;

  Recipe({
    required this.id,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.caloriesPerServing,
    required this.userId,
    required this.reviewCount,
    required this.name,
    required this.difficulty,
    required this.cuisine,
    required this.image,
    required this.ingredients,
    required this.instructions,
    required this.tags,
    required this.mealType,
  });

  factory Recipe.fromJson(Map m1) {
    return Recipe(
      id: m1['id'],
      prepTimeMinutes: m1['prepTimeMinutes'],
      cookTimeMinutes: m1['cookTimeMinutes'],
      servings: m1['servings'],
      caloriesPerServing: m1['caloriesPerServing'],
      userId: m1['userId'],
      reviewCount: m1['reviewCount'],
      name: m1['name'],
      difficulty: m1['difficulty'],
      cuisine: m1['cuisine'],
      image: m1['image'],
      ingredients: m1['ingredients'],
      instructions: m1['instructions'],
      tags: m1['tags'],
      mealType: m1['mealType'],
    );
  }
}
