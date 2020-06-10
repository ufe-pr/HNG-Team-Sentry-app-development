import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_cook_book/core/models/recipe.dart';


// The class responsible for retrieving data
@lazySingleton
class Api {

  static const endpoint = 'assets/api/json_response';
  // Function for loading json from assets
  Future<List<Map<String, dynamic>>> _loadJson() async {
    // Load the string data from assets
    String data = await rootBundle.loadString(endpoint);
    // return decoded json
    return jsonDecode(data);
  }

  // Gets the recipe matching the "recipeId" provided
  Future<Recipe> getRecipe(int recipeId) async {
    // Add logic here
    dynamic response = _loadJson();
    var recipe = response(recipeId == recipeId);
    return recipe;
  }

  // Gets all recipes
  Future<List<Recipe>> getAllRecipes({int page: 1, int numPerPage: 10}) async{
    // Add logic here
    dynamic response = _loadJson();
    var recipes = response.map((elem) => Recipe.fromMap(elem)).toList();


    return recipes;
  }

  // Gets all recipes with "recipeTitle" matching the "keyword" provided
  // It doesn't have to be a full match but should contain the keyword
  // RegExp should be able to handle it
  Future<List<Recipe>> searchRecipe(String keyword, {page: 1, int numPerPage: 10}) {
    // Add logic here

    var recipes = List<Recipe>();
    RegExp exp = new RegExp(_loadJson().toString());
    Iterable<RegExpMatch> matches = exp.allMatches(keyword);
    dynamic response = matches;
    var allRecipe = jsonDecode(response) as List<dynamic>;
    for (var recipe in allRecipe) {
      recipe.add(Recipe.fromJson(recipe));
    }

    return recipes;
  }
}