import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'By using this app, you agree to the following terms and conditions...',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '1. Use of the App\n\nYou may use the app for personal and non-commercial purposes...',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 10),
              Text(
                '2. Privacy\n\nWe take your privacy seriously. Please read our Privacy Policy to learn how we handle your information...',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 10),
              Text(
                '3. Liability\n\nWe are not liable for any damages arising from the use of this app...',
                style: TextStyle(fontSize: 14),
              ),
              // Add more sections as needed
            ],
          ),
        ),
      ),
    );
  }
}
