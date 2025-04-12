import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../layout/main_layout.dart';


class DoctorAppointmentPage extends StatefulWidget {
  @override
  _DoctorAppointmentPageState createState() => _DoctorAppointmentPageState();
}

class _DoctorAppointmentPageState extends State<DoctorAppointmentPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  bool isAllDay = false;
  bool isTitleActive = false;

  TimeOfDay startTime = TimeOfDay(hour: 9, minute: 0);
  TimeOfDay endTime = TimeOfDay(hour: 10, minute: 0);

  DateTime startDate = DateTime(2025, 4, 1);
  DateTime endDate = DateTime(2025, 4, 1);

  String reminder = "1 hour before";

  void _pickTime({required bool isStart}) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: isStart ? startTime : endTime,
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  void _pickDate({required bool isStart}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isStart ? startDate : endDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  void _onSave() {
    final startDT = DateTime(startDate.year, startDate.month, startDate.day, startTime.hour, startTime.minute);
    final endDT = DateTime(endDate.year, endDate.month, endDate.day, endTime.hour, endTime.minute);

    print("=== Doctor Appointment Saved ===");
    print("Title: ${titleController.text}");
    print("Location: ${locationController.text}");
    print("Note: ${noteController.text}");
    print("All Day: $isAllDay");
    print("Start: ${DateFormat('yyyy-MM-dd – hh:mm a').format(startDT)}");
    print("End: ${DateFormat('yyyy-MM-dd – hh:mm a').format(endDT)}");
    print("Reminder: $reminder");

    Navigator.pop(context);
  }

  void _onCancel() {
    Navigator.pop(context);
  }

  String formatDateTime(DateTime date, TimeOfDay time) {
    final dt = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    return DateFormat('EEE d MMM y h:mm a').format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF003765), Color(0xFF539CE4)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Doctor's Appointment",
                          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                      Icon(Icons.notifications, color: Colors.white),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            labelText: "Title"
                            
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.access_time),
                            SizedBox(width: 5),
                            Text("All day"),
                            Spacer(),
                            Switch(
                              value: isAllDay,
                              onChanged: (value) {
                                setState(() {
                                  isAllDay = value;
                                });
                              },
                            ),
                          ],
                        ),
                        if (!isAllDay) ...[
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Start", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () => _pickDate(isStart: true),
                                child: Text(DateFormat('y-MM-dd').format(startDate)),
                              ),
                              TextButton(
                                onPressed: () => _pickTime(isStart: true),
                                child: Text(startTime.format(context)),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("End", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () => _pickDate(isStart: false),
                                child: Text(DateFormat('y-MM-dd').format(endDate)),
                              ),
                              TextButton(
                                onPressed: () => _pickTime(isStart: false),
                                child: Text(endTime.format(context)),
                              ),
                            ],
                          ),
                        ],
                        Divider(),
                        TextField(
                          controller: locationController,
                          decoration: InputDecoration(
                            icon: Icon(Icons.location_on),
                            hintText: "Location",
                          ),
                        ),
                        Divider(),
                        Row(
                          children: [
                            Icon(Icons.notifications_active_outlined),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () => _showReminderOptions(),
                              child: Row(
                                children: [
                                  Text(reminder, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                  Icon(Icons.keyboard_arrow_down),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        TextField(
                          controller: noteController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            icon: Icon(Icons.note_alt_outlined),
                            hintText: "Note",
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: _onCancel,
                              child: Text("Cancel", style: TextStyle(color: Colors.red, fontSize: 18)),
                            ),
                            TextButton(
                              onPressed: _onSave,
                              child: Text("Save", style: TextStyle(color: Colors.green, fontSize: 18)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _showReminderOptions() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final options = [
          "30 minutes before",
          "1 hour before",
          "2 hours before",
          "5 hours before",
          "12 hours before",
          "1 day before",
          "3 days before",
          "1 week before",
        ];

        return ListView(
          shrinkWrap: true,
          children: options.map((option) {
            return ListTile(
              title: Text(option),
              trailing: reminder == option ? Icon(Icons.check, color: Colors.blue) : null,
              onTap: () {
                setState(() {
                  reminder = option;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
