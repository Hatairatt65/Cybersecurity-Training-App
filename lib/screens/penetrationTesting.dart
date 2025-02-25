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
        elevation: 6,
      ),
      body: SingleChildScrollView(  // เพิ่ม SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/pt.jpg",
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildTitleText('Course Name: ${course.courseName}', FontWeight.bold, Colors.blueGrey.shade900),
            SizedBox(height: 6),
            _buildSubtitleText('Instructor: ${course.instructorName}', Colors.blueGrey.shade700),
            _buildSubtitleText('Education: ${course.education}', Colors.blueGrey.shade700),
            _buildSubtitleText('Participants: ${course.participantsCount}', Colors.blueGrey.shade700),
            SizedBox(height: 20),
            _buildTitleText('Course Content:', FontWeight.bold, Colors.blueGrey.shade900),
            SizedBox(height: 16),
            _buildCourseContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleText(String text, FontWeight fontWeight, Color color) {
    return Text(
      text,
      style: TextStyle(fontSize: 22, fontWeight: fontWeight, color: color),
    );
  }

  Widget _buildSubtitleText(String text, Color color) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, color: color),
    );
  }

  Widget _buildCourseContent() {
    return Column(
      children: [
        _buildContentItem(
            '1. **Introduction to Penetration Testing**',
            'เรียนรู้พื้นฐานของการทดสอบการเจาะระบบ ซึ่งเป็นการจำลองการโจมตีจากแฮ็กเกอร์เพื่อค้นหาช่องโหว่ที่อาจทำให้ระบบหรือเครือข่ายถูกโจมตี'),
        _buildContentItem(
            '2. **Penetration Testing Tools**',
            'การใช้เครื่องมือในการทดสอบการเจาะระบบ เช่น Nmap, Metasploit, Burp Suite, และ Wireshark เพื่อวิเคราะห์ช่องโหว่และการโจมตี'),
        _buildContentItem(
            '3. **Reconnaissance Phase**',
            'การเก็บข้อมูลเกี่ยวกับเป้าหมาย เช่น การค้นหาข้อมูล DNS, ที่อยู่ IP และการสำรวจเครือข่ายเพื่อเตรียมการโจมตี'),
        _buildContentItem(
            '4. **Vulnerability Assessment**',
            'การประเมินช่องโหว่ที่พบในระบบ รวมถึงการทดสอบความปลอดภัยของเครือข่ายหรือแอปพลิเคชันเพื่อวิเคราะห์ความเสี่ยงที่อาจเกิดขึ้น'),
        _buildContentItem(
            '5. **Exploitation Phase**',
            'การใช้ช่องโหว่ที่พบในการเจาะระบบ เพื่อให้สามารถเข้าถึงข้อมูลสำคัญหรือควบคุมระบบได้'),
        _buildContentItem(
            '6. **Post-Exploitation**',
            'การประเมินความเสียหายที่เกิดขึ้นหลังจากการเจาะระบบ เช่น การขยายสิทธิ์การเข้าถึงหรือการปลูกฝังแผนการโจมตีในระยะยาว'),
        _buildContentItem(
            '7. **Social Engineering in Penetration Testing**',
            'การใช้เทคนิคจิตวิทยาในการหลอกลวงผู้ใช้หรือพนักงานเพื่อให้ข้อมูลหรือเข้าถึงระบบที่ไม่ได้รับอนุญาต'),
        _buildContentItem(
            '8. **Wireless Network Penetration Testing**',
            'การทดสอบช่องโหว่ของเครือข่ายไร้สาย (Wi-Fi) เพื่อป้องกันการโจมตีจากแฮ็กเกอร์ที่ใช้เทคนิคการแฮ็กเครือข่ายไร้สาย'),
        _buildContentItem(
            '9. **Web Application Penetration Testing**',
            'การทดสอบช่องโหว่ในแอปพลิเคชันเว็บ เช่น SQL Injection, Cross-Site Scripting (XSS), และการทดสอบความปลอดภัยของ API'),
        _buildContentItem(
            '10. **Ethical Hacking vs. Black Hat Hacking**',
            'การเปรียบเทียบระหว่างแฮ็กเกอร์ที่ทำงานเพื่อจริยธรรม (Ethical Hacking) กับแฮ็กเกอร์ที่ทำการโจมตีโดยไม่ชอบธรรม (Black Hat Hacking)'),
        _buildContentItem(
            '11. **Penetration Testing Methodologies**',
            'การศึกษาวิธีการทดสอบการเจาะระบบต่างๆ เช่น OWASP, PTES, OSCP ที่ช่วยให้การทดสอบมีความมีระเบียบและครอบคลุม'),
        _buildContentItem(
            '12. **Reporting and Documentation**',
            'การรายงานผลการทดสอบการเจาะระบบ ซึ่งรวมถึงการบันทึกช่องโหว่ที่พบ วิธีการโจมตีที่ใช้ และคำแนะนำในการป้องกัน'),
        _buildContentItem(
            '13. **Legal and Ethical Considerations**',
            'การทำความเข้าใจเกี่ยวกับข้อกฎหมายและจริยธรรมในการทำ Penetration Testing และการปฏิบัติตามแนวทางที่ถูกต้อง'),
        _buildContentItem(
            '14. **Advanced Penetration Testing Techniques**',
            'การเรียนรู้เทคนิคการทดสอบการเจาะระบบขั้นสูงที่ใช้ในองค์กรหรือการทดสอบระบบที่มีการป้องกันสูง'),
        SizedBox(height: 20),
        Text(
          'Conclusion: คอร์สนี้จะช่วยให้ผู้เรียนเข้าใจเทคนิคและเครื่องมือในการทำ Penetration Testing และเตรียมความพร้อมในการป้องกันระบบจากการโจมตีได้อย่างมีประสิทธิภาพ',
          style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
        ),
      ],
    );
  }

  Widget _buildContentItem(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade900,
            ),
          ),
          SizedBox(height: 6),
          Text(
            content,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
