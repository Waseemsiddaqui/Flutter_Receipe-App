
import 'package:flutter/material.dart';
import 'package:recipe_app/screens/recipedetails.dart';
import 'package:recipe_app/services/recipe_service.dart';

import '../model/recipe.dart';

class Recipelistscreen extends StatefulWidget {
  const Recipelistscreen({super.key});

  @override
  State<Recipelistscreen> createState() => _RecipelistscreenState();
}

class _RecipelistscreenState extends State<Recipelistscreen> {
  int _selectedIndex=0;
  final List<Widget> _pages=[
    Center(child: Text("Home Page")),
    Center(child: Text("Favorites Page")),
    Center(child: Text("Settings Page")),
  ];
  late Future<List<Recipe>>_recipes;
  String ? filter;
  @override
  void initState() {
    super.initState();
    _recipes=RecipeService().fetchRecipes();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        title: const Text('Recipe App',style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
    body: Column(
    children: [
    // Filter Section
    Padding(
    padding: const EdgeInsets.all(16.0),
    child:Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       const  Text("Select Food:",
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
        ),
       const  SizedBox(width: 10),
    DropdownButton<String>(
    value: filter,
    hint: Text("All"),
    items: [
    DropdownMenuItem(value: "All", child: Text("All")),
    DropdownMenuItem(value: "Vegetarian", child: Text("Vegetarian")),
    DropdownMenuItem(value: "Vegan", child: Text("Vegan")),
    DropdownMenuItem(value: "Indian", child: Text("Indian Cuisine")),
    ],
    onChanged: (value) {
    setState(() {
      filter = value;
    });
    },
    ),
      ],
    ),
    ),

    // Recipe List
    Expanded(
    child: FutureBuilder<List<Recipe>>(
    future: _recipes,
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
    return Center(child: Text("Error: ${snapshot.error}"));
    } else if (snapshot.hasData) {
    List<Recipe> filteredRecipes = snapshot.data!;

    // Apply filter logic
    if (filter != null && filter != "All") {
    filteredRecipes = filteredRecipes.where((recipe) {
    switch (filter) {
    case "Vegetarian":
    return recipe.isVegetarian;
    case "Vegan":
    return recipe.isVegan;
    case "Indian":
    return recipe.cuisine == "Indian";
    default:
    return true;
    }
    }).toList();
    }

    return ListView.builder(
    itemCount: filteredRecipes.length,
    itemBuilder: (context, index) {
    final recipe = filteredRecipes[index];
    return Padding(
        padding:const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
    child:Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12)),
    child:ListTile(
      contentPadding: const EdgeInsets.all(12.0),
      leading: ClipRect(
      child:Image.network(
     recipe.imageUrl,
    width: 80,
    height: 60,
    fit: BoxFit.cover,
    ),
      ),
    title: Text(recipe.name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal[800],fontSize: 18)),
    subtitle: Text(recipe.cuisine,style: TextStyle(fontSize: 14,fontStyle: FontStyle.italic,color: Colors.grey[600],

    ),
    ),
      trailing:const Icon(Icons.arrow_forward_ios,
      color: Colors.teal),
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>Recipedetails(recipe: recipe),
        ),
        );
      },
      ),
    ),
    );
    },
    );
    }
    else {
    return const Center(child: Text("No recipes available."));
    }
    },
    ),
    ),
    ],
    ),
      bottomNavigationBar: BottomNavigationBar(
  backgroundColor: Colors.amber,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.pink,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home),label:"Home"),
          BottomNavigationBarItem(icon:Icon(Icons.favorite),label:"Favorites"),
          BottomNavigationBarItem(icon:Icon(Icons.settings),label:"Settings"),
            ],
        onTap: (index){
    setState(() {
      _selectedIndex=index;
    });

          
        },
      ),
      ),
    );
  }
}