import 'package:flutter/material.dart';
import 'package:healthacker2/pages/AddMonthlyPeroid.dart';
import 'package:healthacker2/pages/doctor.dart';
import 'package:healthacker2/pages/medicine.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeContent extends StatelessWidget {
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
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xFF00C853),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              PieChart(
                                dataMap: dataMap,
                                chartType: ChartType.ring,
                                colorList: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(51, 0, 0, 0)],
                                legendOptions: LegendOptions(showLegends: false),
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValues: false,
                                  showChartValueBackground: false,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(FontAwesomeIcons.capsules, color: Color.fromARGB(255, 255, 255, 255), size: 24),
                                  SizedBox(height: 4),
                                  Text(
                                    '${dataMap["Completed"]?.toInt() ?? 0}%',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: const Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 98, 52, 222),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.local_hospital_sharp, color: Colors.white, size: 24),
                                SizedBox(width: 8),
                                Text("Next Appointment", style: TextStyle(color: Colors.white, fontSize: 18)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text("Activity", style: TextStyle(color: Colors.white70)),
                            Text("Hospital Name", style: TextStyle(color: Colors.white70)),
                            Text("Feb 17", style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
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
