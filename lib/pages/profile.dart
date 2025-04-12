import 'package:flutter/material.dart';
import '../widgets/bottomnavbar.dart';
import '../layout/main_layout.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003765),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Profile'),
        actions: [
          Icon(Icons.settings, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            "Profile Page",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
