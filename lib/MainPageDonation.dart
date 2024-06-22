import 'package:flutter/material.dart';
import 'donation_form.dart';
import 'donation_history.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
          'Food Donation',
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
                            'Make a Donation provides you with the opportunity to request a donation, and a dedicated representative from the food bank will promptly arrange to pick it up at your convenience.',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Your Donations provides you with the list of donation that you has been created.',
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
        color: Color(0xFFFAF5E8),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 115.0, left: 15.0, right: 15.0, bottom: 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                // Adjust the border radius as needed
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/fd.jpg'),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  width: double.infinity,
                  height: 400.0,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  top: 360.0, left: 20.0, right: 20.0, bottom: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.brown.shade100,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.black, width: 2.0),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'DONATE',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                        fontFamily: 'ArchivoBlack',
                      ),
                    ),
                  ),
                ),
              ),
            ), //donate

            Padding(
              padding: const EdgeInsets.only(
                  top: 422.5, left: 60.0, right: 60.0, bottom: 50.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.brown.shade100,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'TODAY!',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      fontFamily: 'ArchivoBlack',
                    ),
                  ),
                ),
              ),
            ), //today

            Padding(
              padding: const EdgeInsets.only(
                  top: 500.0, left: 60.0, right: 60.0, bottom: 255.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pinkAccent.shade200.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Colors.black, width: 1.0),
                ),
              ),
            ), //box pink

            Padding(
              padding: const EdgeInsets.only(top: 495.0, left: 55.0, right: 65.0, bottom: 263.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DonationForm()),
                  );
                },
                child: Container(
                  height: 80.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade300,
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Make a Donation  ',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontFamily: 'Signika',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.add_home_work_outlined,
                        color: Colors.black,
                        size: 35,
                      ),
                    ],
                  ),
                ),
              ),
            ), //box biru

            Padding(
              padding: const EdgeInsets.only(
                  top: 590.0, left: 60.0, right: 60.0, bottom: 170.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pinkAccent.shade200.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Colors.black, width: 1.0),
                ),
              ),
            ), //box pink 2

            Padding(
              padding: const EdgeInsets.only(top: 585.0, left: 55.0, right: 65.0, bottom: 175.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DonationHistory()),
                  );
                },
                child: Container(
                  height: 80.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade300,
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your Donations   ',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontFamily: 'Signika',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.history_sharp,
                        color: Colors.black,
                        size: 35,
                      ),
                    ],
                  ),
                ),
              ),
            ), //box biru 2

            Padding(
              padding: const EdgeInsets.only(
                  top: 680.0, left: 28.0, right: 255.0, bottom: 35.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                // Adjust the border radius as needed
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/fd1.jpg'),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  width: double.infinity,
                  height: 400.0,
                ),
              ),
            ), // gambar bawah 1

            Padding(
              padding: const EdgeInsets.only(
                  top: 680.0, left: 141.0, right: 138.0, bottom: 35.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                // Adjust the border radius as needed
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/fd2.jpg'),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  width: double.infinity,
                  height: 400.0,
                ),
              ),
            ), // gambar bawah 2

            Padding(
              padding: const EdgeInsets.only(
                  top: 675.0, left: 258.0, right: 28.0, bottom: 35.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                // Adjust the border radius as needed
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/fd3.jpg'),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  width: double.infinity,
                  height: 400.0,
                ),
              ),
            ), // gambar bawah 3
          ],
        ),
      ),
    );
  }
}
