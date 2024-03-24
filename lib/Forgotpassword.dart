import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Forgot Password')),
        body: ForgotPasswordPage(),
      ),
    );
  }
}

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  void _sendPasswordResetEmail() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text,
      );
      // Display a success message or navigate to a confirmation screen.
      print('Password reset email sent successfully.');
    } catch (e) {
      // Handle any errors (e.g., invalid email, user not found).
      print('Error sending password reset email: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.lock, size: 100, color: Colors.grey),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20),
          RaisedButton(
            child: Text('Send Email', style: TextStyle(color: Colors.white)),
            onPressed: _sendPasswordResetEmail,
            color: Colors.blue,
          ),
          FlatButton(
            child: Text('Sign In', style: TextStyle(color: Colors.grey)),
            onPressed: () {
              // Navigate to the sign-in page.
            },
          ),
        ],
      ),
    );
  }
  
  RaisedButton({required Text child, required void Function() onPressed, required MaterialColor color}) {}
  
  FlatButton({required Text child, required Null Function() onPressed}) {}
}
