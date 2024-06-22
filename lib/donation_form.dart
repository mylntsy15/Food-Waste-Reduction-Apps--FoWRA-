import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quickalert/quickalert.dart';
import 'MainPageDonation.dart';
import 'package:http/http.dart' as http;

class DonationForm extends StatefulWidget {
  const DonationForm({Key? key}) : super(key: key);

  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController foodBankController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        final formattedDate = "${picked.year}-${picked.month}-${picked.day}";
        dateController.text = formattedDate; // Format the date as needed
      });
    }
  }

  Card buildButton({
    required BuildContext context,
    required VoidCallback onTap,
    required String title,
    required String text,
    required Widget leadingIcon,
  }) {
    return Card(
      shape: const StadiumBorder(),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      child: ListTile(
        onTap: onTap,
        leading: leadingIcon,
        title: Text(title),
        subtitle: Text(text),
        trailing: const Icon(
          Icons.keyboard_arrow_right_rounded,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // success Alert
    final successAlert = buildButton(
      context: context,
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Form Submitted Successfully!',
        ).then((_) {
          // Dismiss the success pop-up and navigate to the main page
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
        });
      },
      title: 'Awesome!',
      text: 'Transaction Completed Successfully!',
      leadingIcon: const Icon(
        Icons.check_circle,
        color: Colors.green,
      ),
    );

    // error Alert
    final errorAlert = buildButton(
      context: context,
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: 'Error While Uploading the File, Please Retry ',
        );
      },
      title: 'Oh No!',
      text: 'Sorry, something went wrong',
      leadingIcon: const Icon(
        Icons.error,
        color: Colors.red,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Donation Form',
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
                            'You can submit your donation request here.',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Enter item you want to donate, quantity, date and time of pickup, select food bank nearby and enter your address.',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Please ensure you have fill all field.',
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
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bgimagebumi.jpg"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: itemNameController,
                    decoration: InputDecoration(
                      labelText: 'Item Name',
                      labelStyle:
                      const TextStyle(fontSize: 18, color: Color(0xFF9F968F)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30.0,
                        ),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Item Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: quantityController,
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      labelStyle:
                      const TextStyle(fontSize: 18, color: Color(0xFF9F968F)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30.0,
                        ),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter quantity item';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    items: [
                      'Serdang Food Bank',
                      'IOI Food Bank',
                      'Malaysia Food Bank'
                    ] // Replace with your actual options
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // You can perform any necessary actions here
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Food Bank Nearby',
                      labelStyle:
                      const TextStyle(fontSize: 18, color: Color(0xFF9F968F)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a Food Bank';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      labelText: 'Date of Pickup',
                      labelStyle:
                      const TextStyle(fontSize: 18, color: Color(0xFF9F968F)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onTap: () => _selectDate(context),
                    // Open date picker when tapping the field
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Date of Pickup';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    onChanged: (value) {
                      setState(() {
                        selectedTime = value;
                      });
                    },
                    // You can set an initial value or leave it null
                    value: selectedTime,
                    items: [
                      '8:00 AM',
                      '12:00 PM',
                      '8:00 PM',
                    ].map((String time) {
                      return DropdownMenuItem<String>(
                        value: time,
                        child: Text(time),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Time of Pickup',
                      labelStyle:
                      const TextStyle(fontSize: 18, color: Color(0xFF9F968F)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select Time of Pickup';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: addressController,
                    maxLines: 3, // Adjust the number of lines as needed
                    decoration: InputDecoration(
                      labelText: 'Address',
                      alignLabelWithHint: true,
                      labelStyle:
                      const TextStyle(fontSize: 18, color: Color(0xFF9F968F)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.pinkAccent.shade100, width: 3.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Form data
                        var formData = {
                          'itemName': itemNameController.text,
                          'quantity': quantityController.text,
                          'foodBank': foodBankController.text,
                          'date': dateController.text,
                          'time': selectedTime,
                          'address': addressController.text,
                        };

                        // Send form data to the server
                        var response = await http.post(
                          Uri.parse('http://10.0.2.2:3001/api/submitForm'),
                          body: formData,
                        );

                        if (response.statusCode == 200) {
                          // Form submitted successfully
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            text: 'Form Submitted Successfully!',
                          ).then((_) {
                            // Additional logic or navigation after successful submission
                          });
                        } else {
                          // Error submitting form
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            title: 'Oh No!',
                            text: 'Error Submitting Form',
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.pinkAccent.shade200,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: 'PlayfairDisplay',
                      ),
                    ),
                    child: const Text('Confirm'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFFAF5E8),
    );
  }
}
