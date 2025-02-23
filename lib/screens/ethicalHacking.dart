import 'package:flutter/material.dart';
import '../model/instructor.dart';

class EthicalHacking extends StatelessWidget {
  final Instructor course;

  const EthicalHacking({super.key, required this.course});

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
                "assets/images/eh.jpg",
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
              '1. **Introduction to Ethical Hacking**: คอร์สนี้เริ่มต้นด้วยการแนะนำเกี่ยวกับการแฮ็กเชิงจริยธรรม ซึ่งจะอธิบายถึงแนวคิดพื้นฐาน วัตถุประสงค์และบทบาทของการแฮ็กเชิงจริยธรรมในด้านความปลอดภัยไซเบอร์ โดยเน้นถึงความสำคัญของการแฮ็กเชิงจริยธรรมในการปกป้องระบบและเครือข่ายจากการโจมตีของผู้ไม่หวังดี',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. **Footprinting and Reconnaissance**: การรวบรวมข้อมูลเกี่ยวกับระบบเป้าหมาย (footprinting) และการสอดส่องหาข้อมูล (reconnaissance) เพื่อทำความเข้าใจระบบและหาช่องโหว่ที่อาจถูกโจมตี โดยการใช้เครื่องมือและเทคนิคต่างๆ ที่สามารถช่วยในการรวบรวมข้อมูลนี้ได้',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '3. **Scanning Networks**: การสแกนเครือข่ายเพื่อหาผู้ใช้ที่ทำงานอยู่ (active devices) และตรวจหาช่องโหว่ที่อาจเกิดขึ้น รวมถึงการสแกนพอร์ตเพื่อค้นหาโครงสร้างของเครือข่ายและระบบที่อาจมีความเสี่ยงสูง เช่น เครื่องมือ Nmap ที่นิยมใช้ในกระบวนการนี้',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '4. **Enumeration**: การเก็บข้อมูลเพิ่มเติมเกี่ยวกับระบบหรือเครือข่ายหลังจากการสแกน เช่น การค้นหาชื่อผู้ใช้ (usernames) หรือการแชร์ทรัพยากร (shared resources) ที่อาจเป็นช่องทางที่แฮ็กเกอร์สามารถใช้เพื่อเข้าถึงระบบได้',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '5. **Vulnerability Analysis**: การวิเคราะห์ช่องโหว่ที่พบในระบบเพื่อประเมินความเสี่ยงและความรุนแรงของการโจมตี โดยการหาช่องโหว่ที่อาจทำให้ระบบไม่ปลอดภัยและการอุดช่องโหว่เหล่านั้นให้เร็วที่สุดเพื่อป้องกันการโจมตี',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '6. **System Hacking**: ในหัวข้อนี้จะเน้นการแฮ็กระบบเพื่อเข้าถึงข้อมูลที่ไม่ได้รับอนุญาต เช่น การใช้งานเทคนิคการโจมตีทางระบบที่อาจเกิดขึ้น รวมถึงวิธีการทดสอบและรักษาความปลอดภัยของระบบให้ปลอดภัยจากการโจมตี',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '7. **Trojan Horses, Viruses, and Worms**: เรียนรู้เกี่ยวกับโปรแกรมที่เป็นอันตราย เช่น ม้าโทรจัน (Trojan Horses), ไวรัส (Viruses) และหนอน (Worms) ซึ่งสามารถส่งผลกระทบต่อเครือข่ายหรือระบบ และการตรวจจับและป้องกันโปรแกรมเหล่านี้ในฐานะแฮ็กเกอร์ที่เชี่ยวชาญ',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '8. **Sniffing**: การใช้งานเครื่องมือ sniffing เพื่อดักจับและตรวจสอบข้อมูลที่ถูกส่งในเครือข่าย เช่น รหัสผ่าน (passwords), คุกกี้ (session cookies) และข้อมูลที่อ่อนไหวอื่นๆ ซึ่งเป็นหนึ่งในวิธีการที่แฮ็กเกอร์ใช้ในการโจมตีเครือข่าย',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '9. **Social Engineering**: การใช้กลยุทธ์ทางจิตวิทยาเพื่อหลอกลวงและให้ข้อมูลที่สำคัญแก่ผู้โจมตี โดยใช้เทคนิคในการโจมตีแบบ Social Engineering และวิธีป้องกันไม่ให้ถูกหลอกลวงโดยการใช้เทคนิคนี้',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '10. **Web Application Hacking**: การเรียนรู้เกี่ยวกับช่องโหว่ที่พบในแอปพลิเคชันเว็บและการทดสอบการโจมตีด้วยเครื่องมือต่างๆ เช่น Burp Suite ซึ่งช่วยให้แฮ็กเกอร์สามารถหาช่องโหว่ที่อาจเกิดขึ้น เช่น SQL Injection หรือ Cross-Site Scripting (XSS)',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '11. **Wireless Network Hacking**: การเรียนรู้เกี่ยวกับช่องโหว่ของเครือข่ายไร้สาย (Wi-Fi) และวิธีการทดสอบความปลอดภัยของเครือข่ายไร้สาย เช่น การตรวจสอบความปลอดภัยของการเข้ารหัสข้อมูลและการสร้างจุดเชื่อมต่อหลอก (Rogue Access Points)',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '12. **Cloud Computing Security**: เรียนรู้เกี่ยวกับความท้าทายด้านความปลอดภัยที่เกิดขึ้นในระบบคลาวด์ (Cloud) และวิธีการป้องกันการโจมตีที่อาจเกิดขึ้นบนระบบคลาวด์ เช่น การรักษาความปลอดภัยข้อมูลและการใช้งานบริการคลาวด์ให้ปลอดภัย',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '13. **Penetration Testing Methodologies**: การเรียนรู้เกี่ยวกับวิธีการทดสอบการเจาะระบบ (Penetration Testing) ที่ได้รับการยอมรับ เช่น OWASP, PTES และ OSCP เพื่อทดสอบความปลอดภัยของระบบในองค์กร',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '14. **Reporting and Ethics**: การรายงานผลการทดสอบและช่องโหว่ที่พบในการทำงานแฮ็กเชิงจริยธรรม โดยมีการอธิบายเกี่ยวกับหน้าที่และจริยธรรมของแฮ็กเกอร์ในการรายงานช่องโหว่ที่พบให้กับเจ้าของระบบอย่างถูกต้องและรับผิดชอบ',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Conclusion: คอร์สนี้ช่วยให้นักเรียนได้รับทักษะในการทำการแฮ็กเชิงจริยธรรมในลักษณะที่รับผิดชอบและมีการควบคุม โดยเมื่อจบคอร์ส นักเรียนจะมีความสามารถในการปกป้องระบบ เครือข่าย และข้อมูลจากการโจมตีที่เกิดจากแฮ็กเกอร์',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}