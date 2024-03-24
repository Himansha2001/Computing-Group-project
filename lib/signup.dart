import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Full Name'),
            TextFormField(
              decoration: InputDecoration(hintText: 'Enter your full name'),
            ),
            SizedBox(height: 16),
            Text('Email'),
            TextFormField(
              decoration: InputDecoration(hintText: 'Enter your email'),
            ),
            SizedBox(height: 16),
            Text('Phone Number'),
            TextFormField(
              decoration: InputDecoration(hintText: 'Enter your phone number'),
            ),
            SizedBox(height: 16),
            Text('Address'), // Add address field
            TextFormField(
              decoration: InputDecoration(hintText: 'Enter your address'),
            ),
            SizedBox(height: 16),
            Text('Gender'),
            DropdownButton<String>(
              items: ['Male', 'Female', 'Other']
                  .map((gender) => DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              onChanged: (value) {
                // Handle gender selection
              },
              value: 'Male', // Set initial value
            ),
            SizedBox(height: 16),
            Text('Medical History'),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your medical history (e.g., diabetic)',
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Handle signup button press
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

