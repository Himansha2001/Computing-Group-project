import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medication Reminder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MedicationReminderPage(),
    );
  }
}

class MedicationReminderPage extends StatefulWidget {
  @override
  _MedicationReminderPageState createState() => _MedicationReminderPageState();
}

class _MedicationReminderPageState extends State<MedicationReminderPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TimeOfDay? _selectedTime;

  final List<Map<String, dynamic>> _reminders = [
    // {'title': 'Reminder 1', 'date': DateTime.now()},
    // {'title': 'Reminder 2', 'date': DateTime.now().add(Duration(days: 1))},
  ];

  final _titleController = TextEditingController();

  void _addReminder() {
    if (_selectedDay != null && _selectedTime != null) {
      setState(() {
        _reminders.add({
          'title': _titleController.text,
          'date': DateTime(
            _selectedDay!.year,
            _selectedDay!.month,
            _selectedDay!.day,
            _selectedTime!.hour,
            _selectedTime!.minute,
          ),
        });
        _titleController.clear();
        _selectedDay = null;
        _selectedTime = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication Reminder'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 01, 01),
            calendarFormat: _calendarFormat,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            }, lastDay: DateTime(2050),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _reminders.length,
              itemBuilder: (context, index) {
                final reminder = _reminders[index];
                return ListTile(
                  title: Text(reminder['title']),
                  subtitle: Text(reminder['date'].toString()),
                );
              },
            ),
          ),
          if (_selectedDay != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TimePicker(
                    initialTime: TimeOfDay.now(),
                    onChanged: (time) {
                      setState(() {
                        _selectedTime = time;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Appinment details',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (_selectedDay != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _addReminder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text('Add Reminder'),
              ),
            ),
        ],
      ),
    );
  }
}

class TimePicker extends StatefulWidget {
  final TimeOfDay initialTime;
  final ValueChanged<TimeOfDay?> onChanged;

  TimePicker({required this.initialTime, required this.onChanged});

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay? _time;

  @override
  void initState() {
    super.initState();
    _time = widget.initialTime;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              showTimePicker(
                context: context,
                initialTime: _time!,
              ).then((time) {
                if (time != null) {
                  setState(() {
                    _time = time;
                  });
                  widget.onChanged(_time);
                }
              });
            },
            child: Text(
              _time!.format(context),
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}