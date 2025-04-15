import 'package:flutter/material.dart';
import 'package:healthacker2/pages/AddMonthlyPeroid.dart';
import 'package:healthacker2/pages/doctor.dart';
import 'package:healthacker2/pages/medicine.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:intl/intl.dart';
import '../models/appointment.dart';
import '../db/database.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  AppointmentModel? nextAppointment;

  @override
  void initState() {
    super.initState();
    _loadNextAppointment();
  }

  Future<void> _loadNextAppointment() async {
    final all = await DatabaseHelper().getAllAppointments();
    final now = DateTime.now();

    final upcoming = all.where((a) => a.startTime.isAfter(now)).toList();
    upcoming.sort((a, b) => a.startTime.compareTo(b.startTime));

    setState(() {
      nextAppointment = upcoming.isNotEmpty ? upcoming.first : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    double imageHeight = 300;

    Map<String, double> dataMap = {
      "Completed": 80,
      "Remaining": 20,
    };

    return Scaffold(
      backgroundColor: Color(0xFF003765),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: imageHeight,
            child: Image.asset(
              'assets/images/HomePageTopNav.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Monthly Period Card
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.water_drop, color: Colors.white, size: 24),
                            SizedBox(width: 8),
                            Text("Monthly Period", style: TextStyle(color: Colors.white, fontSize: 18)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text("Next Period: 7 MAR 2025", style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Pie Chart กลมสวย
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFF00C853),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              PieChart(
                                dataMap: dataMap,
                                chartType: ChartType.ring,
                                ringStrokeWidth: 12,
                                colorList: [Colors.white, Colors.white.withOpacity(0.3)],
                                legendOptions: LegendOptions(showLegends: false),
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValues: false,
                                  showChartValueBackground: false,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(FontAwesomeIcons.capsules, color: Colors.white, size: 20),
                                  SizedBox(height: 4),
                                  Text(
                                    '${dataMap["Completed"]?.toInt() ?? 0}%',
                                    style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 30),

                        // Appointment Box สีม่วง
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF585AE2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.add_box_rounded, color: Colors.white),
                                    SizedBox(width: 8),
                                    Text("Next Appointment", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(height: 10),
                                if (nextAppointment != null) ...[
                                  Text(nextAppointment!.title, style: TextStyle(color: Colors.white, fontSize: 14)),
                                  SizedBox(height: 2),
                                  Text(nextAppointment!.location, style: TextStyle(color: Colors.white70)),
                                  SizedBox(height: 2),
                                  Text(
                                    DateFormat('EEE d MMM yyyy, h:mm a').format(nextAppointment!.startTime),
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ] else
                                  Text("No upcoming appointments", style: TextStyle(color: Colors.white70)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                  SizedBox(height: 20),

                  // Bottom Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildIconButton(
                        icon: Icons.local_hospital_sharp,
                        color: Color.fromARGB(255, 98, 52, 222),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DoctorAppointmentPage()),
                          );
                        },
                      ),
                      SizedBox(width: 20),
                      _buildIconButton(
                        icon: FontAwesomeIcons.capsules,
                        color: const Color.fromARGB(255, 57, 202, 91),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TakeMedicinePage()),
                          );
                        },
                      ),
                      SizedBox(width: 20),
                      _buildIconButton(
                        icon: Icons.water_drop,
                        color: Color.fromARGB(255, 255, 127, 159),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Addmonthlyperiod()),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Icon(icon, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}
