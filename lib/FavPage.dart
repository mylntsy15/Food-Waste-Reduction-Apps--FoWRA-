import 'package:flutter/material.dart';
import 'recipepage.dart';
class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(0.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Recipe Page',
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'PlayfairDisplay',
              color: Colors.white,
              letterSpacing: 1.5),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent.withOpacity(0.7),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0), // Adjust padding as needed
            child: IconButton(
              icon: Icon(Icons.help, color: Colors.white, size: 25.0),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Help', style: TextStyle(fontSize: 30, fontFamily: 'Signika', fontWeight: FontWeight.bold),),
                      content: Column(
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
                          child: Text('Close', style: TextStyle(fontSize: 20, fontFamily: 'Sans', color: Colors.pink),),
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
      body: Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.topLeft,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
            children: <Widget>[
              SizedBox(height: 50), //Increased Spacing
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
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
                        Padding(
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
                        SizedBox(width: 15),
                        Padding(
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
                            padding: EdgeInsets.all(10.0),
                            child: IconButton(
                              icon: Icon(Icons.favorite_border),
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
            ]
        ),
      ),
    );
  }
}