import 'package:flutter/material.dart';
import '../model/instructor.dart';

class NetworkSecurity extends StatelessWidget {
  final Instructor course;

  const NetworkSecurity({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.courseName),
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with rounded corners and shadow
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/ns.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
              ),
            ),
            SizedBox(height: 20),
            
            // Course Name with bigger font and custom styling
            Text(
              'ชื่อคอร์ส: ${course.courseName}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade800,
              ),
            ),
            SizedBox(height: 10),
            
            // Instructor Name and Education with nice spacing
            Text(
              'ผู้สอน: ${course.instructorName}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'การศึกษา: ${course.education}',
              style: TextStyle(fontSize: 16, color: Colors.blueGrey.shade500),
            ),
            SizedBox(height: 6),
            Text(
              'จำนวนผู้เข้าร่วม: ${course.participantsCount}',
              style: TextStyle(fontSize: 16, color: Colors.blueGrey.shade500),
            ),
            SizedBox(height: 20),
            
            // Course Content section title
            Text(
              'เนื้อหาของคอร์ส:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade700,
              ),
            ),
            SizedBox(height: 10),

            // List of course contents with bullet points and slight indentation
            buildCourseContent('บทนำสู่การรักษาความปลอดภัยของเครือข่าย (Introduction to Network Security)', 1),
            buildCourseContent('ไฟร์วอลล์และการรักษาความปลอดภัยของเครือข่าย (Firewalls and Network Security)', 2),
            buildCourseContent('ระบบตรวจจับและป้องกันการบุกรุก (IDS/IPS)', 3),
            buildCourseContent('เครือข่ายส่วนตัวเสมือน (VPN)', 4),
            buildCourseContent('เทคนิคการเข้ารหัสในเครือข่าย (Network Encryption Techniques)', 5),
            buildCourseContent('โปรโตคอลและเทคโนโลยีความปลอดภัย (Security Protocols)', 6),
            buildCourseContent('การโจมตีเครือข่ายที่พบบ่อยและการป้องกัน (Common Network Attacks)', 7),
            buildCourseContent('กรณีศึกษาจากเหตุการณ์จริง (Case Studies)', 8),
            buildCourseContent('การใช้เครื่องมือและเทคนิคต่าง ๆ ในการรักษาความปลอดภัย (Practical Tools)', 9),
            buildCourseContent('การสร้างแผนการรักษาความปลอดภัยสำหรับองค์กร (Network Security Plan)', 10),

            SizedBox(height: 20),

            // Conclusion with nice padding and bold text
            Text(
              'บทสรุป:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'คอร์สนี้จะช่วยให้ผู้เรียนเข้าใจเกี่ยวกับการปกป้องเครือข่ายจากภัยคุกคามทางไซเบอร์ที่หลากหลาย และสามารถนำความรู้ไปใช้ในการสร้างและดูแลรักษาความปลอดภัยของเครือข่ายในองค์กรได้อย่างมีประสิทธิภาพ.',
              style: TextStyle(fontSize: 16, color: Colors.blueGrey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function for content items
  Widget buildCourseContent(String text, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blueGrey.shade200,
            ),
            child: Text(
              '$index',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade800,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.blueGrey.shade600),
            ),
          ),
        ],
      ),
    );
  }
}
