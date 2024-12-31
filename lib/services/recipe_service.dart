import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:recipe_app/model/recipe.dart';

class RecipeService{
  Future<List<Recipe>> fetchRecipes()async{
    final String response=await rootBundle.loadString('assets/recipes.json');
    final List data=json.decode(response);
    return data.map((json)=>Recipe.fromJson(json)).toList();
  }
}