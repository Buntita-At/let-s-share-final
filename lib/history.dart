import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'History Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Define routes for navigation
      routes: {
        '/': (context) => HomePage(),
        '/history': (context) => HistoryPage(),
      },
      initialRoute: '/', // Set initial route to the Home page
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('This is the Home Page'),
      ),
    );
  }
}

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Map<String, dynamic>> historyList = [
    {
      'date': '2024-05-10',
      'description': 'Description for Item 1',
      'color': Colors.red
    },
    {
      'date': '2024-05-08',
      'description': 'Description for Item 2',
      'color': Colors.green
    },
    // Other history items...
  ];

  int _selectedIndex = 1; // Index of the selected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 243, 201, 215),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: GNav(
            backgroundColor: Color.fromARGB(255, 243, 201, 215),
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(255, 243, 158, 186),
            color: Colors.black,
            gap: 8,
            padding: EdgeInsets.all(15),
            tabs: [
              GButton(
                icon: Icons.home,
                text: "HOME",
              ),
              GButton(
                icon: Icons.history_edu,
                text: "History",
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
              // Navigation logic based on tab index
              if (index == 0) {
                // Navigate to home screen
                Navigator.pushReplacementNamed(context, '/home');
              } else if (index == 1) {
                // Navigate to history screen
                Navigator.pushReplacementNamed(context, '/history');
              }
            },
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: historyList[index]['color'],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    historyList[index]['color'].withOpacity(0.8),
                    historyList[index]['color'].withOpacity(0.5),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      historyList[index]['date'],
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      historyList[index]['description'],
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  // Add more detailed info if needed
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
