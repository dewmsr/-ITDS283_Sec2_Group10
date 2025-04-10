import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double imageHeight = 300; // Adjust height as needed

    return Scaffold(
      backgroundColor: Color(0xFF0B2B54),
      body: Column(
        children: [
          // Top Image (Background)
          Container(
            width: double.infinity,
            height: imageHeight,
            child: Image.asset(
              'assets/HomePageTopNav.png',
              fit: BoxFit.cover,
            ),
          ),

          // Space to avoid overlapping
          SizedBox(height: 10),

          // Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Monthly Period Widget
                  Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      Row(
                        children: [
                          Icon(Icons.water_drop, color: Colors.white, size: 24),
                          SizedBox(width: 8),
                          Text(
                            "Monthly Period",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      // wait for the database =================
                      Text(
                        "Next Period: 7 MAR 2025",
                        style: TextStyle(color: Colors.white70),
                      ),
                      //=========================================
                    ],
                  ),
                ),

                  
                  SizedBox(height: 20),

                  // Medicine today
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 70, 203, 108),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text("Today", style: TextStyle(color: Colors.white, fontSize: 18)),
                              SizedBox(height: 8),
                              Text("80%", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),

                      // Next  Doctor's Appointment
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 98, 52, 222),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ 
                            Row(
                              children: [
                                Icon(IconlyBold.home, color: Colors.white, size: 24),
                                SizedBox(width: 8),
                                Text(
                                  "Next  Appointment",
                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            // wait for the database =================
                            Text(
                              "Acticity",
                              style: TextStyle(color: Colors.white70),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Hospital Name",
                              style: TextStyle(color: Colors.white70),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Feb 17",
                              style: TextStyle(color: Colors.white70),
                            ),
                            //=========================================
                          ],
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
    );
  }
}


class PeriodWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Adjust width as needed
      height: 160, // Adjust height as needed
      decoration: BoxDecoration(
        color: Colors.blue, // Background color
        borderRadius: BorderRadius.circular(50), // Rounded edges
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Pink Circle
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.pink,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              "07",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10), // Space between elements
          // Month Text
          Text(
            "MAR",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}