class Recipe{
  final String name;
  final String imageUrl;
  final bool isVegetarian;
  final bool isVegan;
  final String cuisine;
  final List<String> ingredients;
  final String instructions;
  Recipe({
    required this.name,
    required this.imageUrl,
    required this.isVegetarian,
    required this.isVegan,
    required this.cuisine,
    required this.ingredients,
    required this.instructions

});
  factory Recipe.fromJson(Map<String,dynamic>json){
    return Recipe(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      isVegetarian: json['isVegetarian'],
        isVegan: json['isVegan'],
        cuisine:json['cuisine'],
      ingredients: List<String>.from(json['ingredients']),
        instructions: json["instructions"] as String
    );
  }
}