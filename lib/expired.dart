
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:awesome_dialog/awesome_dialog.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Expired(),
        '/notification': (context) => NotificationPage(),
      },
    );
  }
}

class Expired extends StatefulWidget {
  @override
  _ExpiredState createState() => _ExpiredState();
}

class _ExpiredState extends State<Expired> {
  final TextEditingController _expirationDateController = TextEditingController();
  final TextEditingController _secondController = TextEditingController(); // Declare _secondController
  DateTime? selectedDateTime;
  String insertedExpirationDate = ''; // Added variable to store inserted date
  bool switchValue1 = false;
  bool switchValue2 = false;
  bool switchValue3 = false;
  String hintTextVariable1 = 'false';
  String hintTextVariable2 = 'false';
  String hintTextVariable3 = 'false';


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDateTime) {
      setState(() {
        selectedDateTime = DateTime(
          picked.year,
          picked.month,
          picked.day,
        );
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && selectedDateTime != null) {
      setState(() {
        selectedDateTime = DateTime(
          selectedDateTime!.year,
          selectedDateTime!.month,
          selectedDateTime!.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    var malaysiaTime = DateTime.now().toUtc().add(Duration(hours: 8));
    DateTime? selectedDate = DateTime.now(); // Make selectedDate nullable

    // Format the date and time
    var formatter = DateFormat('EEEE, yyyy-MM-dd - kk:mm', 'ms_MY');
    String formatDate = formatter.format(malaysiaTime);


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            'Expiration Tracking',
            style: TextStyle(
              fontSize: 23,
              fontFamily: 'PlayfairDisplay',
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent.withOpacity(0.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
          ),
          elevation: 5, // Set your desired elevation value
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: Icon(Icons.help, color: Colors.white, size: 25.0),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'Help',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Signika',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Welcome!',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'PlayfairDisplay',
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Make a Donation provides you with the opportunity to request a donation, and a dedicated representative from the food bank will promptly arrange to pick it up at your convenience.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Your Donations provides you with the list of donation that you has been created.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Contact us if any problem occurs!',
                              style: TextStyle(
                                fontSize: 15,
                              ),
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
                                fontSize: 20,
                                fontFamily: 'Sans',
                                color: Colors.pink,
                              ),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Stack(
                  //   alignment: Alignment.center,
                  //   children: [
                  //     CircleAvatar(
                  //       backgroundColor: Colors.pink,
                  //       radius: 20,
                  //     ),
                  //     IconButton(
                  //       icon: Icon(Icons.add, color: Colors.white, size: 30),
                  //       onPressed: () {
                  //         // Implement the action for the "+" button
                  //       },
                  //     ),
                  //   ],
                  // ),
                  SizedBox(width: 10),
                  // Stack(
                  //   alignment: Alignment.center,
                  //   children: [
                  //     CircleAvatar(
                  //       backgroundColor: Colors.pink,
                  //       radius: 20,
                  //     ),
                  //     PopupMenuButton(
                  //       icon: Icon(Icons.more_vert, color: Colors.white, size: 30),
                  //       itemBuilder: (BuildContext context) {
                  //         return [
                  //           PopupMenuItem(
                  //             child: Text('Option 1'),
                  //             value: 'option1',
                  //           ),
                  //           PopupMenuItem(
                  //             child: Text('Option 2'),
                  //             value: 'option2',
                  //           ),
                  //           // Add more options as needed
                  //         ];
                  //       },
                  //       onSelected: (value) {
                  //         // Handle the selected option
                  //       },
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            Center(
              child: Text(
                formatDate,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                     child: TextField(
                       controller: _expirationDateController,
                       decoration: InputDecoration(
                         labelText: 'Expiration Date',
                         hintText: 'YYYY-MM-DD',

                    ),
                       onChanged: (value) {
                         setState(() {
                           insertedExpirationDate = value;
                         });
                       },
                  ),
                ),
                ),
                 ],
                  ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow.shade300,
                        Colors.pink.shade100
                      ],
                    ),
                  ),

                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _expirationDateController,
                          decoration: InputDecoration(
                            labelText: ' Date',
                            hintText: 'YYYY-MM-DD',
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.yellow.shade300,
                                  Colors.pink.shade100
                                ],
                              ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _secondController,
                                  decoration: InputDecoration(
                                    labelText: 'Time',
                                    hintText: hintTextVariable1,
                                  ),
                                ),
                              ),
                              Switch(
                                value: switchValue1,
                                onChanged: (value) {
                                  setState(() {
                                    switchValue1 = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow.shade300,
                        Colors.pink.shade100
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _expirationDateController,
                          decoration: InputDecoration(
                            labelText: ' Date',
                            hintText: 'YYYY-MM-DD',
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              colors: [
                                Colors.yellow.shade300,
                                Colors.pink.shade100
                              ],
                            ),
                          ),
                          child: TextField(
                            controller: _secondController,
                            decoration: InputDecoration(
                              labelText: 'Time',
                              hintText: hintTextVariable2,
                            ),
                          ),
                        ),
                      ),
                      Switch(
                        value: switchValue2,
                        onChanged: (value) {
                          setState(() {
                            switchValue2 = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                        colors: [
                          Colors.yellow.shade300,
                          Colors.pink.shade100
                        ],
                      ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _expirationDateController,
                          decoration: InputDecoration(
                            labelText: 'Date',
                            hintText: 'YYYY-MM-DD',
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              colors: [
                                Colors.yellow.shade300,
                                Colors.pink.shade100
                              ],
                            ),
                          ),
                          child: TextField(
                            controller: _secondController,
                            decoration: InputDecoration(
                              labelText: 'Time',
                              hintText: hintTextVariable3,
                            ),
                          ),
                        ),
                      ),
                      Switch(
                        value: switchValue3,
                        onChanged: (value) {
                          setState(() {
                            switchValue3 = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(40.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Navigate to the NotificationPage after pressing SUBMIT
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationPage()),
                      );
                      if (result != null) {
                        print('Selected Notification Type: $result');
                        // Do something with the selected notification type
                      }
                    },
                    child: Text('SUBMIT'),
                  ),
                ),
      ],
               ),
        backgroundColor: Color(0xFFFAF5E8),
      ),

            );
  }
}

  class NotificationPage extends StatelessWidget {
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
        title: Text('Notification Page',
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
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),


      ),
      body:Container(

       child: ListView(
        padding: EdgeInsets.all(30.0),
        children: [
          NotificationTypeTile(
            icon: Icons.email,
            title: 'Email Notifications',
            onTap: () {
              // Handle tap for Email Notifications
            },
          ),
          NotificationTypeTile(
            icon: Icons.sms,
            title: 'SMS Notifications',
            onTap: () {
              // Handle tap for SMS Notifications
            },
          ),
          NotificationTypeTile(
            icon: Icons.phone_android,
            title: 'FoWRA App Notifications',
            onTap: () {
              // Handle tap for FoWRA App Notifications
            },
          ),
          SizedBox(height: 30),
          AnimatedButton(
            text: "Submit",
            color: Colors.pinkAccent,
            pressEvent: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.bottomSlide,
                showCloseIcon: true,
                title: "Your reminder and notification has been set up",
                btnCancelOnPress: () {},
                btnOkOnPress: () {},
              ).show();
            },
          ),
        ],
      ),
      ),
      backgroundColor: Color(0xFFFAF5E8),
    );
  }
  }

class NotificationTypeTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  NotificationTypeTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
      // Show awesome dialog when tapped

    },
    );
  }
}


