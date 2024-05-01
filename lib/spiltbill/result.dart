import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatefulWidget {
  final String bill;
  final double friends;
  ResultPage(this.bill, this.friends);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String dividedAmount = ''; // Use camelCase for variable names

  @override
  void initState() {
    super.initState();
    divideAmount(); // Call the function with camelCase name
  }

  void divideAmount() {
    // Add return type for clarity
    double finalBill = double.parse(widget.bill) / widget.friends;
    setState(() {
      dividedAmount = finalBill.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 20), // Use symmetric for left and right margin
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 40),
              child: Text(
                "Result",
                style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 251, 181, 205),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Equally Divide",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "\$$dividedAmount",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Friends"), // Removed style since it's not defined
                            Text(
                                "Friends"), // Removed style since it's not defined
                            Text(
                                "Friends"), // Removed style since it's not defined
                          ],
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.friends
                                .round()
                                .toString()), // Added widget.
                            Text(
                                "14 %"), // Removed style since it's not defined
                            Text(
                                "Friends"), // Removed style since it's not defined
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
