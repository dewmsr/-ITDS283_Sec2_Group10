import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/appointment.dart';
import '../db/database.dart';

class ChatNotificationPage extends StatefulWidget {
  @override
  State<ChatNotificationPage> createState() => _ChatNotificationPageState();
}

class _ChatNotificationPageState extends State<ChatNotificationPage> {
  List<AppointmentModel> _todayAppointments = [];

  @override
  void initState() {
    super.initState();
    _loadTodayAppointments();
  }

  Future<void> _loadTodayAppointments() async {
    final db = DatabaseHelper();
    final all = await db.getAllAppointments();
    final today = DateTime.now();

    // กรองเฉพาะที่ตรงกับวันนี้
    setState(() {
      _todayAppointments = all.where((a) =>
        a.startTime.year == today.year &&
        a.startTime.month == today.month &&
        a.startTime.day == today.day
      ).toList();
    });
  }

  Future<void> _updateStatus(int id, String status) async {
    await DatabaseHelper().updateAppointmentStatus(id, status);
    await _loadTodayAppointments(); // รีโหลดใหม่หลังอัปเดต
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003765),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Chat", style: TextStyle(color: Colors.white)),
        actions: const [Icon(Icons.notifications, color: Colors.white), SizedBox(width: 16)],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        padding: const EdgeInsets.all(20),
        child: _todayAppointments.isEmpty
            ? const Text("You have no reminders today.")
            : ListView.builder(
                itemCount: _todayAppointments.length,
                itemBuilder: (context, index) {
                  final appt = _todayAppointments[index];
                  return Column(
                    children: [
                      _buildMessageBubble(
                        "You have an appointment: ${appt.title} at ${appt.location}\nTime: ${DateFormat('h:mm a').format(appt.startTime)}",
                        time: DateFormat('hh:mm a').format(DateTime.now()),
                        withButtons: appt.status == 'pending',
                        onDone: () => _updateStatus(appt.id!, 'done'),
                        onSkip: () => _updateStatus(appt.id!, 'skipped'),
                        status: appt.status,
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
      ),
    );
  }

  Widget _buildMessageBubble(
    String message, {
    String? time,
    bool withButtons = false,
    VoidCallback? onDone,
    VoidCallback? onSkip,
    String status = 'pending',
  }) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 300),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.blueAccent.shade100),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message, style: const TextStyle(color: Colors.black87, fontSize: 16)),
                const SizedBox(height: 12),
                if (withButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: onSkip,
                        child: const Text("❌ Skip", style: TextStyle(color: Colors.black87)),
                      ),
                      GestureDetector(
                        onTap: onDone,
                        child: const Text("✅ Done", style: TextStyle(color: Colors.black87)),
                      ),
                    ],
                  )
                else
                  Center(
                    child: Text(
                      status == 'done' ? '✅ Marked as Done' : '❌ Skipped',
                      style: TextStyle(
                        color: status == 'done' ? Colors.green : Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(time ?? "", style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
