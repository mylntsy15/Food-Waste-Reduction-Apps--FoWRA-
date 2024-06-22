// ignore_for_file: library_private_types_in_public_api, deprecated_member_use, unused_element

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFAF5E8),
        ),
      home: const FoodWasteApp(),
    );
  }
}

class FoodWasteApp extends StatefulWidget {
  const FoodWasteApp({super.key});

  @override
  _FoodWasteAppState createState() => _FoodWasteAppState();
}

class _FoodWasteAppState extends State<FoodWasteApp> {
  List<FoodItem> foodItems = [];

  void addItem(FoodItem newItem) {
    setState(() {
      foodItems.add(newItem);
    });
    Navigator.pop(context); // Go back to the previous screen
  }

  void removeItem(int index) {
    setState(() {
      foodItems.removeAt(index);
    });
  }

  void navigateToAddItem() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ManualPage(
          onAddItem: addItem,
        ),
      ),
    );
  }

  void navigateToYourItems() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YourItemsPage(foodItems: foodItems),
      ),
    );
  }

  void navigateToRemoveItem() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RemoveItemPage(
          foodItems: foodItems,
          onRemoveItem: removeItem,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: navigateToAddItem,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.transparent,
                textStyle: const TextStyle(fontSize: 18, fontFamily: 'EBGaramond',fontWeight: FontWeight.w900,),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Add a border
                ),
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                shadowColor: Colors.transparent,
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.yellow.shade300,
                      Colors.pink.shade100,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const Text('Add Your Item'),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: navigateToYourItems,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.transparent,
                textStyle: const TextStyle(fontSize: 18, fontFamily: 'EBGaramond',fontWeight: FontWeight.w900,),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.white),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                shadowColor: Colors.transparent,
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.yellow.shade300,
                      Colors.pink.shade100,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const Text('Your Item'),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: navigateToRemoveItem,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.transparent,
                textStyle: const TextStyle(fontSize: 18, fontFamily: 'EBGaramond',fontWeight: FontWeight.w900),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.white),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                shadowColor: Colors.transparent,
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.yellow.shade300,
                      Colors.pink.shade100,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const Text('Remove Your Item'),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFFAF5E8),
    );
  }
}

class ManualPage extends StatefulWidget {
  final Function(FoodItem) onAddItem;

  const ManualPage({super.key, required this.onAddItem});

  @override
  _ManualPageState createState() => _ManualPageState();
}

class _ManualPageState extends State<ManualPage> {
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        selectedDate = DateTime(picked.year, picked.month, picked.day);
      });
    }
  }

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
          'Add Your Item',
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
                          // SizedBox(height: 10),
                          // Text(
                          //   'This screen displays pending donation request and history of past request.',
                          // ),
                          SizedBox(height: 10),
                          Text(
                            'Item Name: Enter the name of the item you want to add.',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Quantity: Specify the quantity of the item.',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            ('Expiration Date: Enter the expiration date for the item.'),
                            style: TextStyle(fontSize: 15, ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Details/Notes: Provide additional details or notes about the item (optional).',
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 25.0),
            _buildRoundedSquareTextField('Item Name', itemNameController),
            const SizedBox(height: 20.0),
            _buildRoundedSquareTextField('Quantity', quantityController),
            const SizedBox(height: 20.0),
            InkWell(
              onTap: () => _selectDate(context),
              child: IgnorePointer(
                child: _buildRoundedSquareTextField(
                  'Expiration Date',
                  TextEditingController(text: selectedDate?.toLocal().toString().split(' ')[0] ?? ''),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            _buildRoundedSquareTextField('Details/Notes', detailsController, height: 160.0),
            const SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow.shade300,
                        Colors.pink.shade100,
                      ],
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_validateFields()) {
                        FoodItem newItem = FoodItem(
                          itemName: itemNameController.text,
                          quantity: quantityController.text,
                          expirationDate: selectedDate,
                          details: detailsController.text,
                        );
                        widget.onAddItem(newItem);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CameraPage(newItem: newItem),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: const Text(
                      'Continue...',
                      style: TextStyle(
                        fontFamily: 'EBGaramond',
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35.0),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      navigateToScanPage(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[100],
                    ),
                    child: const SizedBox(
                      width: 120.0,
                      height: 50.0,
                      child: Center(
                        child: Text(
                          'Scan',
                          style: TextStyle(
                            fontFamily: 'PlayfairDisplay',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 10.0,
                    height: 50.0,
                    color: Colors.black,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      navigateToManualPage(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[100],
                    ),
                    child: const SizedBox(
                      width: 120.0,
                      height: 50.0,
                      child: Center(
                        child: Text(
                          'Manually',
                          style: TextStyle(
                            fontFamily: 'PlayfairDisplay',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFFAF5E8),
    );
  }

  Widget _buildRoundedSquareTextField(String label, TextEditingController? controller, {double height = 50.0}) {
    return Container(
      width: 300.0,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.yellow[50],
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: controller != null
          ? TextField(
        controller: controller,
        style: const TextStyle(fontFamily: 'EBGaramond', fontSize: 18,fontWeight: FontWeight.w900),
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: label,
        ),
      )
          : Center(
        child: Text(
          label,
          style: const TextStyle(fontFamily: 'EBGaramond'),
        ),
      ),
    );
  }

  void navigateToScanPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ScanPage(),
      ),
    );
  }

  void navigateToManualPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ManualPage(
          onAddItem: widget.onAddItem,
        ),
      ),
    );
  }


  bool _validateFields() {
    if (itemNameController.text.isEmpty ||
        quantityController.text.isEmpty ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Missing Information'),
            content: const Text('Please fill in all required fields (Item Name, Quantity, Expiration Date).'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return false;
    }
    return true;
  }
}

class YourItemsPage extends StatelessWidget {
  final List<FoodItem> foodItems;

  const YourItemsPage({super.key, required this.foodItems});

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
          'Your Item',
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
                            'Here all your latest item inventory.',
                            style: TextStyle(fontSize: 15,),
                          ),
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
      body: Column(
        children: [
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search your items',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // Implement item search logic
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                return _buildFoodItemBox(foodItems[index]);
              },
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFAF5E8),
    );
  }

  Widget _buildFoodItemBox(FoodItem item) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: [
            Colors.yellow.shade300,
            Colors.pink.shade100,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.itemName,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text('Quantity: ${item.quantity}'),
          Text('Expiration Date: ${item.formattedDate}'),
          Text('Details/Notes: ${item.details.isEmpty ? '-' : item.details}'),
        ],
      ),
    );
  }
}

class RemoveItemPage extends StatefulWidget {
  final List<FoodItem> foodItems;
  final Function(int) onRemoveItem;

  const RemoveItemPage({super.key, required this.foodItems, required this.onRemoveItem});

  @override
  _RemoveItemPageState createState() => _RemoveItemPageState();
}

class _RemoveItemPageState extends State<RemoveItemPage> {
  TextEditingController searchController = TextEditingController();
  List<FoodItem> filteredItems = [];
  List<FoodItem> removedItems = [];
  List<FoodItem> localCopy = [];

  @override
  void initState() {
    super.initState();
    filteredItems.addAll(widget.foodItems);
    localCopy.addAll(widget.foodItems);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Reset changes when the back button is pressed
        widget.foodItems.clear();
        widget.foodItems.addAll(localCopy);
        return true;
      },
      child: Scaffold(
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
            'Remove Your Item',
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
                              'Removing items from Your Item is a quick and simple process that ensures your kitchen inventory is always in sync with reality.',
                              style: TextStyle(fontSize: 15,),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Thank you for your commitment to reducing food waste with FOWRA <3',
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
        body: Column(
          children: [
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  labelText: 'Search your items',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  filterItems(value);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return _buildFoodItemBox(filteredItems[index], index);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Submit changes
                widget.foodItems.clear();
                widget.foodItems.addAll(localCopy);
                // Handle removed items (you can use removedItems list)
                for (var removedItem in removedItems) {
                  widget.onRemoveItem(localCopy.indexOf(removedItem));
                }
                // Clear removed items list
                removedItems.clear();
                // Navigate to home page
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[100], // Set the button's background color to transparent
                side: const BorderSide(color: Colors.black), // Set the button's border color to black
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
        backgroundColor: const Color(0xFFFAF5E8),
      ),
    );
  }

  Widget _buildFoodItemBox(FoodItem item, int index) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: [
            Colors.yellow.shade300,
            Colors.pink.shade100,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.itemName,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.brown[400],
            onPressed: () {
              // Add item to removedItems list
              setState(() {
                removedItems.add(localCopy[index]);
                filteredItems.removeAt(index);
                localCopy.removeAt(index);
              });
            },
          ),
        ],
        ),
          const SizedBox(height: 8.0),
          Text('Quantity: ${item.quantity}'),
          Text('Expiration Date: ${item.formattedDate}'),
          Text('Details/Notes: ${item.details.isEmpty ? '-' : item.details}'),
          const SizedBox(height: 8.0),
          Row(
            children: [
              const Text('                                                           '),
              const SizedBox(width: 8.0),
              _buildQuantityButton(Icons.remove, () {
                adjustQuantity(index, -1); // Decrease quantity
              }),
              const Text(''),
              const SizedBox(width: 8.0),
              _buildQuantityText(localCopy[index].quantity),
              const Text(''),
              const SizedBox(width: 8.0),
              _buildQuantityButton(Icons.add, () {
                adjustQuantity(index, 1); // Increase quantity
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityContainer(String quantity) {
    return Container(
      width: 50.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: Text(
          quantity,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityText(String quantity) {
    return Container(
      width: 40.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: Text(
          quantity,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 30.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: Colors.brown[400],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          icon: Icon(
            icon,
            color: Colors.pink[100],
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }

  void filterItems(String query) {
    setState(() {
      filteredItems = localCopy
          .where((item) =>
      item.itemName.toLowerCase().contains(query.toLowerCase()) ||
          item.details.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void adjustQuantity(int index, int change) {
    setState(() {
      int currentQuantity = int.parse(localCopy[index].quantity);
      int newQuantity = currentQuantity + change;

      // Ensure the new quantity is within bounds
      if (newQuantity >= 0 && newQuantity <= int.parse(widget.foodItems[index].quantity)) {
        localCopy[index] = localCopy[index].copyWith(quantity: newQuantity.toString());
      }
    });
  }
}


class CameraPage extends StatefulWidget {
  final FoodItem newItem;

  const CameraPage({super.key, required this.newItem});

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Your app bar content goes here
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'images/camera1,jpg.jpg', // Replace with your image asset path
                fit: BoxFit.cover, // Use BoxFit.cover to make the image cover the available space
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // Save information to the database
              await saveDataToDatabase(widget.newItem);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => YourItemsPage(
                    foodItems: [widget.newItem], // Pass the new item to YourItemsPage
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[200], // Set the button's background color to white
                elevation:0
            ),
            child: const Text(
              'Save',
              style: TextStyle(
                fontFamily: 'EBGaramond',
                fontWeight: FontWeight.w900,
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
        );
    }


  Future<void> saveDataToDatabase(FoodItem item) async {
    // Replace 'http://your-nodejs-server-url.com' with your actual Node.js server URL
    const String apiUrl = 'http://10.0.2.2:3001/api/saveData';

    try {
      // Create a Map representing the data you want to save
      var formData = {
        'itemName': item.itemName,
        'quantity': item.quantity,
        'date': item.formattedDate,
        'details': item.details,
        // Add other fields as needed
      };

      // Make a POST request to the Node.js server
      var response = await http.post(Uri.parse(apiUrl), body: formData);

      if (response.statusCode == 200) {
        // Data saved successfully
        print('Data saved successfully');
      } else {
        // Handle errors if needed
        print('Error saving data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Exception during data saving: $e');
    }
  }
}

class FoodItem {
  final String itemName;
  final String quantity;
  final DateTime? expirationDate;
  final String details;

  FoodItem({
    required this.itemName,
    required this.quantity,
    required this.expirationDate,
    required this.details,
  });

  FoodItem copyWith({
    String? itemName,
    String? quantity,
    DateTime? expirationDate,
    String? details,
  }) {
    return FoodItem(
      itemName: itemName ?? this.itemName,
      quantity: quantity ?? this.quantity,
      expirationDate: expirationDate ?? this.expirationDate,
      details: details ?? this.details,
    );
  }

  String get formattedDate {
    return expirationDate != null ? "${expirationDate!.toLocal().toString().split(' ')[0]}" : "";
  }
}

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

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
          'Add Your Item',
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
                            'There are 2 options for you to scan the QR code: ',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '1. Scan directly to the QR code.',
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '2. Click on QR from Photos and select your QR code picture.',
                            style: TextStyle(fontSize: 15, ),
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
      body: Column(
        children: [
          const SizedBox(height: 30.0), // Add some space at the top
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                        colors: [
                          Colors.yellow.shade300,
                          Colors.pink.shade100,
                        ],
                      ),
                    ),
                  ),
                  // Display QR code image (You can replace the placeholder image with a dynamic QR code)
                  Image.asset(
                    'images/qr code 2.jpg', // Replace with the path to your QR code image
                    width: 480.0,
                    height: 480.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildActionButton('QR from Photos', Icons.photo, () {
                          // Handle QR from Photos button tap
                        },
                            width: 160.0), // Set the width to 160.0 to match the "Need Help" button
                        const SizedBox(width: 10.0),
                        _buildActionButton('Flash', Icons.flash_on, () {
                          // Handle flash camera button tap
                        }, isCircular: true, width: 90.0), // Set the width to 160.0 to match the "Need Help" button
                      ],
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          navigateToScanPage(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[100],
                        ),
                        child: const SizedBox(
                          width: 120.0,
                          height: 50.0,
                          child: Center(
                            child: Text(
                              'Scan',
                              style: TextStyle(
                                fontFamily: 'PlayfairDisplay',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 10.0,
                        height: 50.0,
                        color: Colors.black,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          navigateToManualPage(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[100],
                        ),
                        child: const SizedBox(
                          width: 120.0,
                          height: 50.0,
                          child: Center(
                            child: Text(
                              'Manually',
                              style: TextStyle(
                                fontFamily: 'PlayfairDisplay',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFAF5E8),
    );
  }

  void navigateToScanPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ScanPage(),
      ),
    );
  }

  void navigateToManualPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ManualPage(
          onAddItem: (FoodItem newItem) {
            // Handle the item addition as needed in your app
          },
        ),
      ),
    );
  }


  Widget _buildActionButton(String label, IconData icon, VoidCallback onPressed, {bool isCircular = false, double width = 160.0}) {
    return Container(
      width: width, // Set a fixed width for the buttons
      height: isCircular ? 65.0 : null,
      decoration: isCircular
          ? BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Colors.yellow.shade300,
            Colors.pink.shade100,
          ],
        ),
      )
          : BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: [
            Colors.yellow.shade300,
            Colors.pink.shade100,
          ],
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 20.0,
            ),
            const SizedBox(height: 0.0),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'EBGaramond',
                fontWeight: FontWeight.w900,
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _helpText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text),
    );
  }
}
