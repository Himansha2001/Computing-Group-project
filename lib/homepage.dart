import 'package:flutter/material.dart';
import 'package:health_buddy/visits.dart';
import 'package:health_buddy/ChatBotScreen.dart';
import 'package:health_buddy/MedicationReminderPage.dart';

void main() {
  runApp(HealthApp());
}

class HealthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Buddy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Health Buddy'),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 24, 93, 150),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => visits()),
                  );
                  // Navigate to doctors visits screen
                },
                child: Text('Doctors Visits'),
              ),
              SizedBox(height: 20), // Add space between buttons
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MedicationReminderPage()),
                  );
                  // Navigate to medication reminder screen
                },
                child: Text('Medication Reminder'),
              ),
              SizedBox(height: 20), // Add space between buttons
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen()),
                  );
                  // Navigate to online help screen
                },
                child: Text('Online Help'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
