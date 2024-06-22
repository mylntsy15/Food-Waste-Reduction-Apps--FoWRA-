import 'package:flutter/material.dart';

class DonationHistory extends StatelessWidget {
  const DonationHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFFFAF5E8), // Background color
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
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
                'Your Donations',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'PlayfairDisplay',
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.pinkAccent.withOpacity(0.7),
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(15)),
              ),
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
                                SizedBox(height: 10),
                                Text(
                                  'Live Donations show ongoing donations awaiting pickup.',
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Donation History lists your completed donations with details.',
                                  style: TextStyle(fontSize: 15,),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Tap on a donation to view more details.',
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
          ),
          Positioned(
            top: kToolbarHeight + 58,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Live Donations',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ), //live donations
          Positioned(
            top: kToolbarHeight + 108,
            left: 30,
            right: 30,
            child: GestureDetector(
              onTap: () {
                showDetailsDialog(
                  context,
                  'Food Bank Malaysia',
                  5,
                  '5:00PM',
                  '15/1/2024',
                  'Pending',
                );
              },
              child: Container(
                height: 135,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFF7AD),
                      Colors.pink.shade100,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 2.0, right: 0.0, bottom: 2.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/logofb1.jpg'),
                        // Replace with your image asset
                        radius: 50,
                      ),
                    ),
                    SizedBox(width: 20),
                    // Additional widgets on the right side of CircleAvatar
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Food Bank Malaysia',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Playfair',
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Quantity: 5',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'Playfair',
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Time of Pickup: 5:00PM',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'Playfair',
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Date: 15/1/2024',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'Playfair',
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Status : Pending',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'Playfair',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ), //detail live donations
          Positioned(
            top: kToolbarHeight + 260,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Your Donations History',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ), //history
          Positioned(
            top: kToolbarHeight + 312,
            left: 30,
            right: 30,
            child: GestureDetector(
              onTap: () {
                showDetailsDialog(
                  context,
                  'Yayasan Food Bank',
                  10,
                  '12:00PM',
                  '11/1/2024',
                  'Completed',
                );
              },
              child: Container(
                height: 135,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFF7AD),
                      Colors.pink.shade100,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 2.0, right: 0.0, bottom: 2.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/logofb2.jpg'),
                        // Replace with your image asset
                        radius: 50,
                      ),
                    ),
                    SizedBox(width: 20),
                    // Additional widgets on the right side of CircleAvatar
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Yayasan Food Bank',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Playfair',
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Quantity: 10',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'Playfair',
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Time of Pickup: 12:00PM',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'Playfair',
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Date: 11/1/2024',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'Playfair',
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Status : Completed',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'Playfair',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ), //detail history 1
          Positioned(
            top: kToolbarHeight + 457,
            left: 30,
            right: 30,
            child: GestureDetector(
              onTap: () {
                showDetailsDialog(
                  context,
                  'Your Food Bank',
                  20,
                  '8:00AM',
                  '01/1/2024',
                  'Completed',
                );
              },
              child: Container(
                height: 135,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFF7AD),
                      Colors.pink.shade100,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 2.0, right: 0.0, bottom: 2.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/logofb3.jpg'),
                        // Replace with your image asset
                        radius: 50,
                      ),
                    ),
                    SizedBox(width: 20),
                    // Additional widgets on the right side of CircleAvatar
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your Food Bank',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Playfair',
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Quantity: 20',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'Playfair',
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Time of Pickup: 8:00AM',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'Playfair',
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Date: 01/1/2024',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'Playfair',
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Status : Completed',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'Playfair',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ), //detail history 2
          Positioned(
            top: kToolbarHeight + 602,
            left: 30,
            right: 30,
            child: GestureDetector(
              onTap: () {
                showDetailsDialog(
                  context,
                  'Cambridge Food Bank',
                  8,
                  '9:00PM',
                  '30/12/2023',
                  'Rejected',
                );
              },
              child: Container(
                height: 135,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFF7AD),
                      Colors.pink.shade100,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 2.0, right: 0.0, bottom: 2.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/logofb4.jpg'),
                        // Replace with your image asset
                        radius: 50,
                      ),
                    ),
                    SizedBox(width: 20),
                    // Additional widgets on the right side of CircleAvatar
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Cambrige Food Bank',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Playfair',
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Quantity: 8',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'Playfair',
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Time of Pickup: 9:00PM',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'Playfair',
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Date: 30/12/2023',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'Playfair',
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Status : Rejected',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'Playfair',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ), //detail history 3
        ],
      ),
    );
  }

  void showDetailsDialog(
      BuildContext context,
      String foodbank,
      int quantity,
      String pickupTime,
      String date,
      String status,
      ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Donation Details',
            style: TextStyle(fontSize: 25, fontFamily: 'ArchivoBlack'),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Food Bank: $foodbank',
                style: TextStyle(fontSize: 18, fontFamily: 'Playfair Display'),
              ),
              Text(
                'Quantity: $quantity',
                style: TextStyle(fontSize: 18, fontFamily: 'Playfair Display'),
              ),
              Text(
                'Pickup Time: $pickupTime',
                style: TextStyle(fontSize: 18, fontFamily: 'Playfair Display'),
              ),
              Text(
                'Date: $date',
                style: TextStyle(fontSize: 18, fontFamily: 'Playfair Display'),
              ),
              Text(
                'Status: $status',
                style: TextStyle(fontSize: 18, fontFamily: 'Playfair Display'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Close',
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Sans', color: Colors.pink),
              ),
            ),
          ],
        );
      },
    );
  }
}
