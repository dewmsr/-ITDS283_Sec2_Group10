import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double imageHeight = 300;

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: imageHeight,
          child: Image.asset(
            'assets/images/HomePageTopNav.png',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          Text("Monthly Period", style: TextStyle(color: Colors.white, fontSize: 18)),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text("Next Period: 7 MAR 2025", style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 70, 203, 108),
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
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 98, 52, 222),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ 
                          Row(
                            children: [
                              Icon(IconlyBold.home, color: Colors.white, size: 24),
                              SizedBox(width: 8),
                              Text("Next Appointment", style: TextStyle(color: Colors.white, fontSize: 18)),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text("Activity", style: TextStyle(color: Colors.white70)),
                          Text("Hospital Name", style: TextStyle(color: Colors.white70)),
                          Text("Feb 17", style: TextStyle(color: Colors.white70)),
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
    );
  }
}
