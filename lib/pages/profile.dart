import 'package:flutter/material.dart';
import '../widgets/bottomnavbar.dart';
import '../layout/main_layout.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isNotificationOn = true;
  bool isLocationOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ProfilePage.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          Column(
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22)),
                    Icon(Icons.notifications, color: Colors.white),
                  ],
                ),
              ),

              SizedBox(height: 50),

              // Profile card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 16),
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      // Profile Circle
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.grey.shade400,
                      ),
                      SizedBox(height: 16),

                      // Name
                      Text(
                        "Thanyarat Wuthiroongreungsakul",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12),

                      // Birthday
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.cake_outlined, size: 18),
                          SizedBox(width: 8),
                          Text("31 Jan 2005 (20 years)"),
                        ],
                      ),
                      SizedBox(height: 8),

                      // Phone
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone_outlined, size: 18),
                          SizedBox(width: 8),
                          Text("090 - 996 - 4010"),
                        ],
                      ),
                      SizedBox(height: 8),

                      // Email
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.email_outlined, size: 18),
                          SizedBox(width: 8),
                          Text(
                            "thanyarat.wut@student.mahidol.edu",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Notification Toggle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(Icons.notifications_none),
                        SizedBox(width: 12),
                        Text("Notification", style: TextStyle(fontSize: 16)),
                      ]),
                      Row(children: [
                        Switch(
                          value: isNotificationOn,
                          onChanged: (value) {
                            setState(() {
                              isNotificationOn = value;
                            });
                          },
                        ),
                      ]),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Location Toggle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(Icons.location_on_outlined),
                        SizedBox(width: 12),
                        Text("Location", style: TextStyle(fontSize: 16)),
                      ]),
                      Row(children: [
                        Switch(
                          value: isLocationOn,
                          onChanged: (value) {
                            setState(() {
                              isLocationOn = value;
                            });
                          },
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      );
  }
}