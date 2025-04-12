import 'package:flutter/material.dart';
import '../pages/homepage.dart';
import '../pages/signup.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003765),
      body: Stack(
        children: [
          // พื้นที่ฟอร์ม login
         Positioned.fill(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.22),
                      Text(
                        "Hi, Welcome Back!",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Email", style: TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "example@gmail.com",
                          fillColor: Color(0xFF003366),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Password", style: TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          suffixIcon: Icon(Icons.visibility, color: Colors.white),
                          fillColor: Color(0xFF003366),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/homepage');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE3D322),
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Login', style: TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account ? ", style: TextStyle(color: Colors.white, fontSize: 16)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignUpPage()),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Color(0xFFFFF264),
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),


                        ],
                      ),
                      SizedBox(height: 120),
                    ],
                  ),
                ),
              ),

          // รูปภาพล่างสุด
          Align(
  alignment: Alignment.bottomRight,
  child: Padding(
    padding: const EdgeInsets.only(right: 0, bottom: 0),
    child: Image.asset(
      'assets/images/medicine 1.png',
      height: 340, 
      fit: BoxFit.contain,
            ),
          ),
          
        ),
      ],
      ),
      
    );
  }
}
