import 'package:flutter/material.dart';
import '../widgets/bottomnavbar.dart';
import '../layout/main_layout.dart';

class ChatNotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003765),
      appBar: AppBar(
        automaticallyImplyLeading: false, // ❌ เอาปุ่มย้อนกลับออก
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Chat",
          style: TextStyle(color: Colors.white), // ✅ ตั้งค่าสีตัวหนังสือให้ขาว
        ),
        actions: const [
          Icon(Icons.notifications, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            _buildMessageBubble(
              "Hello, Thanyarat!",
              time: "06:07 PM",
            ),
            const SizedBox(height: 20),
            _buildMessageBubble(
              "Do you have any medication to take after dinner at 6 PM today?\nHave you taken it yet?",
              time: "06:07 PM",
              withButtons: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(String message, {String? time, bool withButtons = false}) {
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
                Text(
                  message,
                  style: const TextStyle(color: Colors.black87, fontSize: 16),
                ),
                if (withButtons) ...[
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("❌ Skip", style: TextStyle(color: Colors.black87)),
                      Text("✅ Done", style: TextStyle(color: Colors.black87)),
                    ],
                  )
                ]
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
