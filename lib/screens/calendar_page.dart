import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  String _note = ''; // Variable to store the note

  Map<DateTime, List<String>> _events = {}; // Map to store events (notes) for each day

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2023, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              // Handle format changes
            },
            onPageChanged: (focusedDay) {
              // Handle page changes
            },
            eventLoader: (day) => _events[day] ?? [],
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _note = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Add note',
                suffixIcon: IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    // Save the note for the selected day
                    _saveNote();
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _getNotesForSelectedDay(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _saveNote() {
    if (_note.isNotEmpty) {
      setState(() {
        // Add the note to the list of events for the selected day
        _events[_selectedDay] = _events[_selectedDay] ?? [];
        _events[_selectedDay]!.add(_note);
        _note = ''; // Clear the note field after saving
      });
    }
  }

  List<Widget> _getNotesForSelectedDay() {
    List<Widget> notes = [];
    if (_events.containsKey(_selectedDay)) {
      notes.addAll(
        _events[_selectedDay]!.map((note) => Card(
              child: ListTile(
                title: Text(note),
              ),
            )),
      );
    }
    return notes;
  }
}
