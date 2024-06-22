import 'package:flutter/material.dart';
import 'FavPage.dart';
class RecipePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  Widget build(BuildContext context) {
    bool isFavorite = false;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(0.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          'Recipe Page',
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'PlayfairDisplay',
              color: Colors.white,
              letterSpacing: 1.5),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent.withOpacity(0.7),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0), // Adjust padding as needed
            child: IconButton(
              icon: const Icon(Icons.help, color: Colors.white, size: 25.0),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Help', style: TextStyle(fontSize: 30, fontFamily: 'Signika', fontWeight: FontWeight.bold),),
                      content: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Welcome!',
                            style: TextStyle(fontSize: 20, fontFamily: 'PlayfairDisplay',),
                          ),
                          // SizedBox(height: 10),
                          // Text(
                          //   'This screen displays pending donation request and history of past request.',
                          // ),
                          SizedBox(height: 10),
                          Text(
                            'Recipe Suggestion provides you with the vast recipe to choose from with the ingredients you have ',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Each recipe is provided with the ingredients needed and steps needed',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Contact us if any problem occur!',
                            style: TextStyle(fontSize: 15, ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close', style: TextStyle(fontSize: 20, fontFamily: 'Sans', color: Colors.pink),),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFAF5E8),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'What is in your kitchen?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    // Redirect to the favorite page
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FavoritePage()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter some ingredients',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField( controller: _searchController,
                      onSubmitted: (query) {
                        // Call the search method when the user submits the query

                      },
                      decoration: InputDecoration(
                        hintText: 'Type your ingredients',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // This is for the Homemade Pickle box
            const SizedBox(height: 50), //Increased Spacing
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              // Added padding to control spacing from the edges
              child: GestureDetector(
                onTap: () {
                  // Handle tap, navigate to the recipe page or perform any other action
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomemadePickle() ),
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
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ClipRect(
                          child: Image(
                            image: NetworkImage(
                                'https://www.gimmesomeoven.com/wp-content/uploads/2016/07/Homemade-Pickles-Recipe-9.jpg'),
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        // Adjust top padding to lower the text
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Homemade Pickle',
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
                                  ' 200 kcal',
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
                                  ' 30 min',
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
                          padding: const EdgeInsets.all(10.0),
                          child: IconButton(
                            icon: isFavorite
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_border),
                            onPressed: () {
                              // Add your logic for handling favorites here
                            },
                            iconSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30), //Increased spacing
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>ChorizoMGnocchi()),
                  );
                },
                child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    // Added padding to control spacing from the edges
                    child: Container(
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.yellow.shade300,
                              Colors.pink.shade100
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Row(children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ClipRect(
                              child: Image(
                                image: NetworkImage(
                                    'https://iron-mills.co.uk/cdn/shop/articles/Gnocchi.jpg?v=1627473751&width=1100'),
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            // Adjust top padding to lower the text
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Chorizo & Mozzarell \nGnocchi',
                                  style: TextStyle(
                                    fontSize: 15,
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
                                      '400 kcal',
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
                                      '50 min',
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: IconButton(
                                  icon: isFavorite
                                      ? const Icon(Icons.favorite)
                                      : const Icon(Icons.favorite_border),
                                  onPressed: () {},
                                ),
                              ))
                        ])))),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>SquashPancake()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
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
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ClipRect(
                          child: Image(
                            image: NetworkImage(
                                'https://img.jamieoliver.com/jamieoliver/recipe-database/94qp2qtMqmn9l8M7RdvIzp.jpg?tr=w-800,h-1066'),
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        // Adjust top padding to lower the text
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' Leftover Squash   \nPancakes',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.local_dining,
                                  size: 15,
                                ),
                                Text(
                                  ' 200 kcal',
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
                                  '25 min',
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: IconButton(
                            icon: isFavorite
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_border),
                            onPressed: () {
                              isFavorite = !isFavorite;
                            },
                            iconSize: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//UI for squash pancake recipe
class SquashPancake extends StatelessWidget {
  final List<Map<String, dynamic>> recipes = [
    {
      'name': 'Leftover Squash \n       Pancakes',
      'image':
          'https://img.jamieoliver.com/jamieoliver/recipe-database/94qp2qtMqmn9l8M7RdvIzp.jpg?tr=w-800,h-1066',
      'calories': '200 kcal',
      'time': '25min',
      'ingredients': ['250g leftover roasted squash', '1 red chili', '2 leaves rosemary'
      , '30g Parmesan cheese', '1 egg', '280ml milk', '280ml milk'],
      'steps': ['1.In a large bowl, combine the flour, baking powder, salt, and black pepper. Mix well.',
      '2.In another bowl, beat the eggs. Add the grated squash, chopped onion (if using), and fresh herbs. Mix until well combined',
      '3.Add the wet ingredients to the dry ingredients and stir until just combined. Do not overmix; a few lumps are okay.',
      '4. Heat a skillet or griddle over medium heat and add a bit of olive oil or butter to coat the surface.',
      '5. Spoon the batter onto the hot griddle to form pancakes. Use about 1/4 cup of batter for each pancake.',
      '6. Cook until bubbles form on the surface of the pancake and the edges start to look set. This usually takes 2-3 minutes.',
      '7. Flip the pancakes and cook for an additional 1-2 minutes, or until golden brown on the other side.'],
    },
    // Add more recipes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(0.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          'Recipe Suggestion',
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'PlayfairDisplay',
              color: Colors.white,
              letterSpacing: 1.5),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent.withOpacity(0.7),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0), // Adjust padding as needed
            child: IconButton(
              icon: const Icon(Icons.help, color: Colors.white, size: 25.0),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Help', style: TextStyle(fontSize: 30, fontFamily: 'Signika', fontWeight: FontWeight.bold),),
                      content: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Welcome!',
                            style: TextStyle(fontSize: 20, fontFamily: 'PlayfairDisplay',),
                          ),
                          // SizedBox(height: 10),
                          // Text(
                          //   'This screen displays pending donation request and history of past request.',
                          // ),
                          SizedBox(height: 10),
                          Text(
                            'Recipe Suggestion provides you with the vast recipe to choose from with the ingredients you have ',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Each recipe is provided with the ingredients needed and steps needed',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Contact us if any problem occur!',
                            style: TextStyle(fontSize: 15, ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close', style: TextStyle(fontSize: 20, fontFamily: 'Sans', color: Colors.pink),),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  // Set the border radius here
                  child: Image.network(
                    recipes[index]['image'],
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  recipes[index]['name'],
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.local_dining, size: 20),
                    Text(' ${recipes[index]['calories']}',
                        style: const TextStyle(fontSize: 15)),
                    const SizedBox(width: 16),
                    const Icon(Icons.access_time, size: 20),
                    Text(' ${recipes[index]['time']}',
                        style: const TextStyle(fontSize: 15)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Ingredients & ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 1),
                    GestureDetector(
                      onTap: () {
                        // Handle tap, navigate to the steps page or perform any other action
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetail(steps: recipes[index]['steps']),
                          ),
                        );
                      },
                      child: const Text(
                        'Steps',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Change the color if needed
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.pink[200]?.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      for (String ingredient in recipes[index]['ingredients'])
                        Text(
                          ingredient,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

//UI for all of the recipe steps
class RecipeDetail extends StatelessWidget {
  final List<String> steps;

  RecipeDetail({required this.steps});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(0.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          'Recipe Suggestions',
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'PlayfairDisplay',
              color: Colors.white,
              letterSpacing: 1.5),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent.withOpacity(0.7),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0), // Adjust padding as needed
            child: IconButton(
              icon: const Icon(Icons.help, color: Colors.white, size: 25.0),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Help', style: TextStyle(fontSize: 30, fontFamily: 'Signika', fontWeight: FontWeight.bold),),
                      content: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Welcome!',
                            style: TextStyle(fontSize: 20, fontFamily: 'PlayfairDisplay',),
                          ),
                          // SizedBox(height: 10),
                          // Text(
                          //   'This screen displays pending donation request and history of past request.',
                          // ),
                          SizedBox(height: 10),
                          Text(
                            'Recipe Suggestion provides you with the vast recipe to choose from with the ingredients you have ',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Each recipe is provided with the ingredients needed and steps needed',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Contact us if any problem occur!',
                            style: TextStyle(fontSize: 15, ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close', style: TextStyle(fontSize: 20, fontFamily: 'Sans', color: Colors.pink),),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Steps:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
        const SizedBox(height: 16),
        Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.pink[200]?.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                for (String step in steps)
            Text(
                step,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
    ]
      ),
    ),
          ],
        ),
      ),
    );
  }
}

//Ui for homemadePickle steps
class HomemadePickle extends StatelessWidget {
  final List<Map<String, dynamic>> recipes = [
    {
      'name': 'Homemade Pickle',
      'image':
      'https://www.gimmesomeoven.com/wp-content/uploads/2016/07/Homemade-Pickles-Recipe-9.jpg',
      'calories': '200 kcal',
      'time': '30min',
      'ingredients': [ '6-8 pickling cucumbers',
        '1 cup white vinegar',
        '1 cup water',
        '2 tablespoons salt',
        '1 tablespoon sugar',
        '2 cloves garlic, minced',
        '1 teaspoon dill seeds',
        '1 teaspoon mustard seeds',
        '1/2 teaspoon black peppercorns',
        '1/2 teaspoon red pepper flakes (optional)'],
      'steps': ['1. Wash the cucumbers thoroughly and slice them into rounds or spears.',
        '2. In a saucepan, combine water, vinegar, salt, and sugar. Bring to a simmer until the salt and sugar dissolve. Remove from heat and let it cool.',
        '3. Place the cucumber slices, garlic, dill seeds, mustard seeds, black peppercorns, and red pepper flakes (if using) in a clean, sterilized jar.',
        '4. Pour the cooled vinegar mixture over the cucumbers, ensuring they are fully submerged.',
        '5. Seal the jar and refrigerate for at least 24 hours before consuming.',
        '6. Enjoy your homemade pickles!'
      ],
    },
    // Add more recipes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(0.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          'Recipe Page',
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'PlayfairDisplay',
              color: Colors.white,
              letterSpacing: 1.5),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent.withOpacity(0.7),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0), // Adjust padding as needed
            child: IconButton(
              icon: const Icon(Icons.help, color: Colors.white, size: 25.0),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Help', style: TextStyle(fontSize: 30, fontFamily: 'Signika', fontWeight: FontWeight.bold),),
                      content: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Welcome!',
                            style: TextStyle(fontSize: 20, fontFamily: 'PlayfairDisplay',),
                          ),
                          // SizedBox(height: 10),
                          // Text(
                          //   'This screen displays pending donation request and history of past request.',
                          // ),
                          SizedBox(height: 10),
                          Text(
                            'Recipe Suggestion provides you with the vast recipe to choose from with the ingredients you have ',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Each recipe is provided with the ingredients needed and steps needed',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Contact us if any problem occur!',
                            style: TextStyle(fontSize: 15, ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close', style: TextStyle(fontSize: 20, fontFamily: 'Sans', color: Colors.pink),),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  // Set the border radius here
                  child: Image.network(
                    recipes[index]['image'],
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  recipes[index]['name'],
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.local_dining, size: 20),
                    Text(' ${recipes[index]['calories']}',
                        style: const TextStyle(fontSize: 15)),
                    const SizedBox(width: 16),
                    const Icon(Icons.access_time, size: 20),
                    Text(' ${recipes[index]['time']}',
                        style: const TextStyle(fontSize: 15)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Ingredients & ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 1),
                    GestureDetector(
                      onTap: () {
                        // Handle tap, navigate to the steps page or perform any other action
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetail(steps: recipes[index]['steps']),
                          ),
                        );
                      },
                      child: const Text(
                        'Steps',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Change the color if needed
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.pink[200]?.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      for (String ingredient in recipes[index]['ingredients'])
                        Text(
                          ingredient,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ChorizoMGnocchi extends StatelessWidget {
  final List<Map<String, dynamic>> recipes = [
    {
      'name': 'Chorizo & Mozzareli Gnocchi',
      'image':
      'https://iron-mills.co.uk/cdn/shop/articles/Gnocchi.jpg?v=1627473751&width=1100',
      'calories': '400 kcal',
      'time': '50min',
      'ingredients': [
        '1 cup white vinegar',
        '1 tbsp olive oil',
        '1 onion, finely chopped',
        '2 garlic cloves, crushed',
        '120g chorizo, diced',
        '2 x 400g cans chopped tomatoes',
        '1 tsp caster sugar',
        '600g fresh gnocchi',
        '125g mozzarella ball, cut into chunks',
        'small bunch of basil, torn',
        'green salad'],
      'steps': ['1. Heat the oil in a medium pan over a medium heat.',
        '2. Fry the onion and garlic for 8-10 mins until soft.',
        '3. Add the chorizo and fry for 5 mins more. ',
        '4. Tip in the tomatoes and sugar, and season. Bring to a simmer, then add the gnocchi and cook for 8 mins, stirring often, until soft. Heat the grill to high.',
        '5. Stir ¾ of the mozzarella and most of the basil through the gnocchi.',
        '6. Divide the mixture between six ovenproof ramekins, or put in one baking dish. '
        '7. Top with the remaining mozzarella, then grill for 3 mins, or until the cheese is melted and golden. Season, scatter over the remaining basil and serve with green salad.'
      ],
    },
    // Add more recipes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(0.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          'Recipe Page',
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'PlayfairDisplay',
              color: Colors.white,
              letterSpacing: 1.5),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent.withOpacity(0.7),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0), // Adjust padding as needed
            child: IconButton(
              icon: const Icon(Icons.help, color: Colors.white, size: 25.0),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Help', style: TextStyle(fontSize: 30, fontFamily: 'Signika', fontWeight: FontWeight.bold),),
                      content: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Welcome!',
                            style: TextStyle(fontSize: 20, fontFamily: 'PlayfairDisplay',),
                          ),
                          // SizedBox(height: 10),
                          // Text(
                          //   'This screen displays pending donation request and history of past request.',
                          // ),
                          SizedBox(height: 10),
                          Text(
                            'Recipe Suggestion provides you with the vast recipe to choose from with the ingredients you have ',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Each recipe is provided with the ingredients needed and steps needed',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Contact us if any problem occur!',
                            style: TextStyle(fontSize: 15, ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close', style: TextStyle(fontSize: 20, fontFamily: 'Sans', color: Colors.pink),),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  // Set the border radius here
                  child: Image.network(
                    recipes[index]['image'],
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  recipes[index]['name'],
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.local_dining, size: 20),
                    Text(' ${recipes[index]['calories']}',
                        style: const TextStyle(fontSize: 15)),
                    const SizedBox(width: 16),
                    const Icon(Icons.access_time, size: 20),
                    Text(' ${recipes[index]['time']}',
                        style: const TextStyle(fontSize: 15)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Ingredients & ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 1),
                    GestureDetector(
                      onTap: () {
                        // Handle tap, navigate to the steps page or perform any other action
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetail(steps: recipes[index]['steps']),
                          ),
                        );
                      },
                      child: const Text(
                        'Steps',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Change the color if needed
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.pink[200]?.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      for (String ingredient in recipes[index]['ingredients'])
                        Text(
                          ingredient,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}