import 'package:flutter/material.dart';
import 'package:fowra/recipepage.dart';
import 'package:provider/provider.dart';
class Recipe {
  final String name;
  final String imageUrl;
  final String calories;
  final String duration;

  bool isFavorite;

  Recipe({
    required this.name,
    required this.imageUrl,
    required this.calories,
    required this.duration,
    this.isFavorite = false,
  });
}
class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          // Handle tap, navigate to the recipe page or perform any other action
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomemadePickle()),
          );
        },
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [Colors.yellow.shade300, Colors.pink.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: ClipRect(
                  child: Image(
                    image: NetworkImage(recipe.imageUrl),
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.local_dining,
                          size: 15,
                        ),
                        Text(
                          ' ${recipe.calories} kcal',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 15,
                        ),
                        Text(
                          ' ${recipe.duration} min',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: IconButton(
                    icon: recipe.isFavorite
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    onPressed: () {
                      // Toggle the favorite status
                      Provider.of<RecipeProvider>(context, listen: false)
                          .toggleFavorite(recipe);
                    },
                    iconSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class RecipeProvider with ChangeNotifier {
  List<Recipe> _recipes = [
    Recipe(
      name: 'Homemade Pickle',
      imageUrl:
      'https://www.gimmesomeoven.com/wp-content/uploads/2016/07/Homemade-Pickles-Recipe-9.jpg',
      calories: '200',
      duration: '30',
    ),
    // Add more recipes as needed
  ];

  List<Recipe> get recipes => _recipes;

  void toggleFavorite(Recipe recipe) {
    final index = _recipes.indexOf(recipe);
    _recipes[index].isFavorite = !_recipes[index].isFavorite;
    notifyListeners();
  }
}