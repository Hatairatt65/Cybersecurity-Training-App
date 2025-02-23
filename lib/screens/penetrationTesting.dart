import 'package:flutter/material.dart';
import '../model/instructor.dart';

class PenetrationTesting extends StatelessWidget {
  final Instructor course;

  const PenetrationTesting({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.courseName),
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: SingleChildScrollView(  // เพิ่ม SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/pt.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Course Name: ${course.courseName}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Instructor: ${course.instructorName}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 6),
            Text(
              'Education: ${course.education}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              'Participants: ${course.participantsCount}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Course Content:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. **Introduction to Penetration Testing**: เรียนรู้พื้นฐานของการทดสอบการเจาะระบบ ซึ่งเป็นการจำลองการโจมตีจากแฮ็กเกอร์เพื่อค้นหาช่องโหว่ที่อาจทำให้ระบบหรือเครือข่ายถูกโจมตี',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. **Penetration Testing Tools**: การใช้เครื่องมือในการทดสอบการเจาะระบบ เช่น Nmap, Metasploit, Burp Suite, และ Wireshark เพื่อวิเคราะห์ช่องโหว่และการโจมตี',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '3. **Reconnaissance Phase**: การเก็บข้อมูลเกี่ยวกับเป้าหมาย เช่น การค้นหาข้อมูล DNS, ที่อยู่ IP และการสำรวจเครือข่ายเพื่อเตรียมการโจมตี',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '4. **Vulnerability Assessment**: การประเมินช่องโหว่ที่พบในระบบ รวมถึงการทดสอบความปลอดภัยของเครือข่ายหรือแอปพลิเคชันเพื่อวิเคราะห์ความเสี่ยงที่อาจเกิดขึ้น',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '5. **Exploitation Phase**: การใช้ช่องโหว่ที่พบในการเจาะระบบ เพื่อให้สามารถเข้าถึงข้อมูลสำคัญหรือควบคุมระบบได้',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '6. **Post-Exploitation**: การประเมินความเสียหายที่เกิดขึ้นหลังจากการเจาะระบบ เช่น การขยายสิทธิ์การเข้าถึงหรือการปลูกฝังแผนการโจมตีในระยะยาว',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '7. **Social Engineering in Penetration Testing**: การใช้เทคนิคจิตวิทยาในการหลอกลวงผู้ใช้หรือพนักงานเพื่อให้ข้อมูลหรือเข้าถึงระบบที่ไม่ได้รับอนุญาต',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '8. **Wireless Network Penetration Testing**: การทดสอบช่องโหว่ของเครือข่ายไร้สาย (Wi-Fi) เพื่อป้องกันการโจมตีจากแฮ็กเกอร์ที่ใช้เทคนิคการแฮ็กเครือข่ายไร้สาย',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '9. **Web Application Penetration Testing**: การทดสอบช่องโหว่ในแอปพลิเคชันเว็บ เช่น SQL Injection, Cross-Site Scripting (XSS), และการทดสอบความปลอดภัยของ API',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '10. **Ethical Hacking vs. Black Hat Hacking**: การเปรียบเทียบระหว่างแฮ็กเกอร์ที่ทำงานเพื่อจริยธรรม (Ethical Hacking) กับแฮ็กเกอร์ที่ทำการโจมตีโดยไม่ชอบธรรม (Black Hat Hacking)',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '11. **Penetration Testing Methodologies**: การศึกษาวิธีการทดสอบการเจาะระบบต่างๆ เช่น OWASP, PTES, OSCP ที่ช่วยให้การทดสอบมีความมีระเบียบและครอบคลุม',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '12. **Reporting and Documentation**: การรายงานผลการทดสอบการเจาะระบบ ซึ่งรวมถึงการบันทึกช่องโหว่ที่พบ วิธีการโจมตีที่ใช้ และคำแนะนำในการป้องกัน',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '13. **Legal and Ethical Considerations**: การทำความเข้าใจเกี่ยวกับข้อกฎหมายและจริยธรรมในการทำ Penetration Testing และการปฏิบัติตามแนวทางที่ถูกต้อง',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '14. **Advanced Penetration Testing Techniques**: การเรียนรู้เทคนิคการทดสอบการเจาะระบบขั้นสูงที่ใช้ในองค์กรหรือการทดสอบระบบที่มีการป้องกันสูง',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Conclusion: คอร์สนี้จะช่วยให้ผู้เรียนเข้าใจเทคนิคและเครื่องมือในการทำ Penetration Testing และเตรียมความพร้อมในการป้องกันระบบจากการโจมตีได้อย่างมีประสิทธิภาพ',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
