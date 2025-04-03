import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003366),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Text(
                'Create an account',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),

              _buildInputField(firstNameController, 'Enter Your First Name'),
              SizedBox(height: 15),
              _buildInputField(lastNameController, 'Enter Your Last Name'),
              SizedBox(height: 15),
              _buildInputField(emailController, 'Enter Your Email'),
              SizedBox(height: 15),
              _buildInputField(phoneController, 'Enter Your Phone Number'),
              SizedBox(height: 15),
              _buildInputField(passwordController, 'Enter Your Password',
                  isPassword: true),

              SizedBox(height: 30),
             ElevatedButton(
              onPressed: () {
                final firstName = firstNameController.text;
                final lastName = lastNameController.text;
                final email = emailController.text;
                final phone = phoneController.text;
                final password = passwordController.text;

                // บันทึกข้อมูล (คุณสามารถเชื่อม Firebase/SQLite/Provider ที่นี่)
                print('Saved: $firstName $lastName / $email / $phone / $password');

                // กลับไปหน้า Login
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.black),
              ),
            ),


              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",
                      style: TextStyle(color: Colors.white)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // ย้อนกลับไปหน้า login
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hint,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white70),
        suffixIcon: isPassword
            ? Icon(Icons.visibility_off, color: Colors.white)
            : null,
        filled: true,
        fillColor: const Color(0xFF01497C),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
