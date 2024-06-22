import 'package:flutter/material.dart';
import 'recipepage.dart';
import 'MainPageDonation.dart';
import 'item_inventory.dart';
import 'expired.dart';
import 'WritePost.dart';

class HomePageModel {
  // You can add your business logic here
}

class HomePageWidget extends StatefulWidget {
  final HomePageModel model;

  const HomePageWidget({Key? key, required this.model}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FoWRA',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'PlayfairDisplay',
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent.withOpacity(0.7),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: const Icon(Icons.help, color: Colors.white, size: 25.0),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Help',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Signika',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Welcome to FoWRA!',
                            style: TextStyle(fontSize: 20, fontFamily: 'PlayfairDisplay'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Make a Difference allows you to request a pickup for surplus food items, and our dedicated team will promptly arrange to collect them at your convenience.',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Your Contributions displays the list of saved food items and their impact on reducing waste.',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Contact us if you encounter any issues or have suggestions for improvement!',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Close',
                            style: TextStyle(fontSize: 20, fontFamily: 'Sans', color: Colors.pink),
                          ),
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                CircleAvatar(
                  backgroundColor: Colors.pinkAccent.withOpacity(0.7),
                  child: IconButton(
                    icon: const Icon(Icons.person, color: Colors.white),
                    onPressed: () {
                      // Add functionality for the profile button
                      print('Profile button pressed');
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Hello there,',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Say no to wastage!!!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'images/homescreen.jpg',
                    width: 500,
                    height: 200,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ModernStyledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FoodWasteApp()),
                          );
                        },
                        icon: Icons.storage,
                        label: 'Item\nInventory',
                        symbolColor: Colors.lightGreen, // Set the symbol color to light green
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ModernStyledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WritePostPage()),
                          );
                        },
                        icon: Icons.people,
                        label: 'Community\nEngagement',
                        symbolColor: Colors.lightBlue, // Set the symbol color to light blue
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ModernStyledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RecipePage()),
                          );
                        },
                        icon: Icons.restaurant,
                        label: 'Recipe\nSuggestions',
                        symbolColor: Colors.yellow, // Set the symbol color to yellow
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ModernStyledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MainPage()),
                          );
                        },
                        icon: Icons.favorite,
                        label: 'Make a\nDonation',
                        symbolColor: Colors.redAccent, // Set the symbol color to light red
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ModernStyledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Expired()),
                          );
                        },
                        icon: Icons.date_range,
                        label: 'Expiration\nTracker',
                        symbolColor: Colors.brown, // Set the symbol color to yellow
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ModernStyledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final String label;
  final Color symbolColor; // New property for symbol color

  const ModernStyledButton({
    Key? key,
    this.onPressed,
    required this.icon,
    required this.label,
    required this.symbolColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pinkAccent.withOpacity(0.7), // Keep the button color the same
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(20),
        minimumSize: const Size(150, 150),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 40,
            color: symbolColor, // Use the provided symbol color
          ),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
