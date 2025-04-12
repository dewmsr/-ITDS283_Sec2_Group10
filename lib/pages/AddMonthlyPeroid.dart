
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Addmonthlyperiod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PeriodTracker(); 
  }
}


class PeriodTracker extends StatefulWidget {
  @override
  _PeriodTrackerState createState() => _PeriodTrackerState();
}

class _PeriodTrackerState extends State<PeriodTracker> {
  DateTime selectedDate = DateTime.now();
  String volume = '';
  String mood = '';
  String symptom = '';
  String sexDrive = '';

  // Map to store data for each day
  Map<String, Map<String, String>> periodData = {};

  // Function to handle day selection
  void selectDay(DateTime date) {
    setState(() {
      selectedDate = date;
      // Check if there's existing data for the selected date, if not initialize it
      if (!periodData.containsKey(DateFormat('yyyy-MM-dd').format(date))) {
        periodData[DateFormat('yyyy-MM-dd').format(date)] = {
          'volume': '',
          'mood': '',
          'symptom': '',
          'sexDrive': '',
        };
      }
      volume = periodData[DateFormat('yyyy-MM-dd').format(date)]!['volume']!;
      mood = periodData[DateFormat('yyyy-MM-dd').format(date)]!['mood']!;
      symptom = periodData[DateFormat('yyyy-MM-dd').format(date)]!['symptom']!;
      sexDrive = periodData[DateFormat('yyyy-MM-dd').format(date)]!['sexDrive']!;
    });
  }
  void CancelData(BuildContext context) {
  Navigator.pop(context);
}


  void saveData() {
    setState(() {
      // Save the current day data into the map
      periodData[DateFormat('yyyy-MM-dd').format(selectedDate)] = {
        'volume': volume,
        'mood': mood,
        'symptom': symptom,
        'sexDrive': sexDrive,
      };
    });
    print('Saved Data:\nVolume: $volume\nMood: $mood\nSymptom: $symptom\nSex Drive: $sexDrive');
  }

  Widget buildChoice(String category, String value, Function(String) onSelect) {
    return GestureDetector(
      onTap: () {
        setState(() {
          onSelect(value);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: (category == value) ? const Color.fromARGB(255, 98, 52, 222) : const Color.fromARGB(255, 234, 234, 234),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          value,
          style: TextStyle(
            color: (category == value) ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B2B54),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            selectDay(selectedDate.add(Duration(days: 1)));
          } else if (details.primaryVelocity! > 0) {
            selectDay(selectedDate.subtract(Duration(days: 1)));
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      DateFormat('EEEE, dd MMM yyyy').format(selectedDate),
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(7, (index) {
                          DateTime date = selectedDate.subtract(Duration(days: 3 - index));
                          bool isSelected = date.day == selectedDate.day;
                          return GestureDetector(
                            onTap: () => selectDay(date), // Select day on tap
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected ? const Color.fromARGB(255, 249, 113, 147) : Colors.grey.shade200,
                              ),
                              child: Center(
                                child: Text(
                                  '${date.day}',
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Text('Volume',
              style: TextStyle(fontSize: 16.0),),
              Row(
                children: [
                  buildChoice(volume, 'Heavy', (val) => volume = val),
                  buildChoice(volume, 'Medium', (val) => volume = val),
                  buildChoice(volume, 'Light', (val) => volume = val),
                  buildChoice(volume, 'Spotting', (val) => volume = val),
                ],
              ),
              SizedBox(height: 20),
              Text('Mood',
              style: TextStyle(fontSize: 16.0),),
              Row(
                children: [
                  buildChoice(mood, 'Happy', (val) => mood = val),
                  buildChoice(mood, 'Energetic', (val) => mood = val),
                  buildChoice(mood, 'Calm', (val) => mood = val),
                  buildChoice(mood, 'Swing', (val) => mood = val),
                  buildChoice(mood, 'Bad', (val) => mood = val),
                ],
              ),
              SizedBox(height: 20),
              Text('Symptoms',
              style: TextStyle(fontSize: 16.0),),
              Row(
                children: [
                  buildChoice(symptom, 'Fine', (val) => symptom = val),
                  buildChoice(symptom, 'Cramps', (val) => symptom = val),
                  buildChoice(symptom, 'Headache', (val) => symptom = val),
                  buildChoice(symptom, 'Acne', (val) => symptom = val),
                ],
              ),
              SizedBox(height: 20),
              Text('Sex Drive',
              style: TextStyle(fontSize: 16.0),),
              Column(
                children: [
                  Row(
                    children: [
                      buildChoice(sexDrive, 'Didn’t Have Sex', (val) => sexDrive = val),
                      buildChoice(sexDrive, 'Masturbation', (val) => sexDrive = val),
                    ],
                  ),
                  Row(
                    children: [
                      buildChoice(sexDrive, 'Protected Sex', (val) => sexDrive = val),
                      buildChoice(sexDrive, 'Unprotected Sex', (val) => sexDrive = val),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                        onPressed: () => CancelData(context),
                        child: Text("Cancel", style: TextStyle(color: Colors.red, fontSize: 18)),
                      ),
                    
                  
                  TextButton(
                              onPressed: saveData,
                              child: Text("Save", style: TextStyle(color: Colors.green, fontSize: 18)),
                            ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
