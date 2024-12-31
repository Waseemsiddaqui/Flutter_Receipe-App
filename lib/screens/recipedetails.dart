
import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe.dart';

class Recipedetails extends StatelessWidget {
  final Recipe recipe;
  int _selectedIndex = 0;
  Recipedetails({required this.recipe});
  List<String> favorites=[];
  @override
  Widget build(BuildContext context) {

  return Scaffold(
  appBar: AppBar(
  centerTitle: true,
  title: Text(recipe.name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
  backgroundColor: Colors.teal,
  ),
  body: SingleChildScrollView(
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Hero(tag: recipe.imageUrl,
  child: Image.network(
  recipe.imageUrl,
  width: double.infinity,
  height: 250,
  fit: BoxFit.cover,
  ),
  ),
  SizedBox(height: 16),
  Padding(
  padding:const EdgeInsets.symmetric(horizontal: 16.0),
  child: Text(recipe.name,
  style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,
  color: Colors.teal[800],
  ),
  ),
  ),
  Padding(padding:const EdgeInsets.symmetric(horizontal: 16.0),
  child: Text(recipe.cuisine,
  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.grey[300],
  ),
  ),
  ),
  SizedBox(height: 16),
  //Ingredients Section
  Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: Text("Ingredients",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold
  ),
  ),
  ),
  Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children:
  recipe.ingredients.map((ingredient){
  return Text("-$ingredient",
  style: TextStyle(fontSize: 16),
  );
  }).toList(),
  ),
  ),
  SizedBox(height: 16),
  Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: Text("Instructions",
  style: TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  ),
  ),
  ),
  Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: Text(recipe.instructions,
  style: TextStyle(fontSize: 16,height: 1.5),
  ),
  ),
  SizedBox(height: 80),
  // Favourite Section
  Padding(padding: const EdgeInsets.symmetric(horizontal: 100.0),
  child: ElevatedButton.icon(
  onPressed: (){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Marked as Favourite")),);

  },
  icon: Icon(Icons.favorite),
  label:Text("Add to Favourite"),
  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,padding: EdgeInsets.symmetric(vertical: 10,horizontal: 12),
  textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black
  ),
  ),
  ),
  ),
  ],
  ),
  ),

  bottomNavigationBar: BottomNavigationBar(
  currentIndex: _selectedIndex,
  backgroundColor: Colors.amber,
  selectedItemColor: Colors.black,
  unselectedItemColor: Colors.pink,
  selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
  onTap: (index){
  },
  items: [
  BottomNavigationBarItem(icon:Icon(Icons.home),label:"Home"),
  BottomNavigationBarItem(icon:Icon(Icons.favorite),label:"Favorites"),
  BottomNavigationBarItem(icon:Icon(Icons.settings),label:"Settings"),
  ],


  ),
  );
  }
  }
