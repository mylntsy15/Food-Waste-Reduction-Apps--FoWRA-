
import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Text(
            '_nurinadnii',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.pink[300],
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Handle search button pressed
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {
                // Handle more options button pressed
              },
            ),
          ],
          backgroundColor: Colors.blue,
        ),
        bottomNavigationBar: Container(
          height: 50,
          color: Colors.white12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  size: 30,
                  color: Colors.blue,
                ),
                onPressed: () {
                  // Handle camera button pressed
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.chat,
                  size: 30,
                  color: Colors.blue,
                ),
                onPressed: () {
                  // Handle chat button pressed
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  size: 30,
                  color: Colors.blue,
                ),
                onPressed: () {
                  // Handle more options button pressed
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 30,
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Search', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Icon(Icons.calendar_view_day, color: Colors.white),
                  ],
                ),
              ),
              SizedBox(width: 25,),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Primary',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'General',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black38,
              ),
              // Use a ListView.builder for the chat messages
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  String username = 'Nur Akmal'; // Replace 'YourUsername' with your desired username
                  return buildChatMessage(
                    username,
                    'Active 14 min ago',
                    Icons.sports_rugby,
                    Colors.indigo,
                    context,
                  );
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  String username = 'Ariq Ulwan'; // Replace 'YourUsername' with your desired username
                  return buildChatMessage(
                    username,
                    'Active 10 min ago',
                    Icons.cake,
                    Colors.indigo,
                    context,
                  );
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  String username = 'Amylia Natasya'; // Replace 'YourUsername' with your desired username
                  return buildChatMessage(
                    username,
                    'Active 3 min ago',
                    Icons.fastfood,
                    Colors.indigo,
                    context,
                  );
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  String username = 'Jay'; // Replace 'YourUsername' with your desired username
                  return buildChatMessage(
                    username,
                    'Active 2 min ago',
                    Icons.flag,
                    Colors.indigo,
                    context,
                  );
                },
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFFFAF5E8),
      ),
    );
  }

  // Function to build a chat message UI
  Widget buildChatMessage(String username, String status, IconData icon, Color avatarColor, BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        username,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(status),
      leading: CircleAvatar(
        backgroundColor: avatarColor,
        radius: 30,
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
      trailing: Container(
        width: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '12:45 PM',
              style: TextStyle(color: Colors.grey),
            ),
            Icon(
              Icons.done_all,
              color: Colors.blue,
              size: 20,
            ),
          ],
        ),
      ),
      onTap: () {
        // Navigate to the chat screen when a message is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen(username)),
        );
      },
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String username;

  ChatScreen(this.username);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = []; // List to store messages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
          backgroundColor: Colors.pinkAccent.withOpacity(0.7),
      ),
      body: Column(
        children: [
          // Display messages
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          // Input field and send button
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Send message and update the UI
                    _sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
        backgroundColor: Color(0xFFFAF5E8),
    );
  }

  // Function to send a message
  void _sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(message);
        _messageController.clear();
      });
    }
  }
}


