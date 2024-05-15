import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResultPage('100', 2), // Example usage of ResultPage
    );
  }
}

class ResultPage extends StatefulWidget {
  final String bill;
  final double friends;

  ResultPage(this.bill, this.friends);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String dividedAmount = '';

  @override
  void initState() {
    super.initState();
    divideAmount();
  }

  void divideAmount() {
    try {
      double finalBill = double.parse(widget.bill) / widget.friends;
      setState(() {
        dividedAmount = finalBill.toStringAsFixed(2);
      });

      // Save data to Firestore
      saveDataToFirestore(dividedAmount);
    } catch (e) {
      print('Error: $e'); // Print error for debugging
      // Handle error gracefully, e.g., show an error message to the user
    }
  }

  void saveDataToFirestore(String dividedAmount) async {
    // Get the current date
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    // Reference to Firestore collection
    CollectionReference results =
        FirebaseFirestore.instance.collection('results');

    // Add a new document with a generated ID
    try {
      await results.add({
        'amount': dividedAmount,
        'date': formattedDate,
      });
      print('Data saved to Firestore');
    } catch (e) {
      print('Error saving data: $e'); // Print error for debugging
      // Handle error gracefully, e.g., show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 40),
              child: const Text(
                "Result",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 251, 181, 205),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Equally Divide",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "\$$dividedAmount",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
