import 'package:flutter/material.dart';

class FavPage extends StatelessWidget {
  final List<String> favorites;
  FavPage({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title:Text("Favourites"),
      ),
      body:favorites.isEmpty
          ?
          Center(child: Text("No favorites added yet!")):ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context,index){
            return ListTile(title: Text(favorites[index]),
            );
          },
      ),
    );
  }
}
