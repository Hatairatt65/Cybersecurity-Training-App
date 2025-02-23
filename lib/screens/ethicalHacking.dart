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
        elevation: 6,
      ),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/eh.jpg",
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildTitleText('ชื่อคอร์ส: ${course.courseName}', FontWeight.bold, Colors.blueGrey.shade900),
            SizedBox(height: 8),
            _buildSubtitleText('ผู้สอน: ${course.instructorName}', Colors.blueGrey.shade700),
            _buildSubtitleText('การศึกษา: ${course.education}', Colors.blueGrey.shade700),
            _buildSubtitleText('จำนวนผู้เรียน: ${course.participantsCount}', Colors.blueGrey.shade700),
            SizedBox(height: 20),
            _buildTitleText('เนื้อหาคอร์ส:', FontWeight.bold, Colors.blueGrey.shade900),
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
            '1. **Introduction to Ethical Hacking**',
            'คอร์สนี้เริ่มต้นด้วยการแนะนำเกี่ยวกับการแฮ็กเชิงจริยธรรม ซึ่งจะอธิบายถึงแนวคิดพื้นฐาน วัตถุประสงค์และบทบาทของการแฮ็กเชิงจริยธรรมในด้านความปลอดภัยไซเบอร์ โดยเน้นถึงความสำคัญของการแฮ็กเชิงจริยธรรมในการปกป้องระบบและเครือข่ายจากการโจมตีของผู้ไม่หวังดี'),
        _buildContentItem(
            '2. **Footprinting and Reconnaissance**',
            'การรวบรวมข้อมูลเกี่ยวกับระบบเป้าหมาย (footprinting) และการสอดส่องหาข้อมูล (reconnaissance) เพื่อทำความเข้าใจระบบและหาช่องโหว่ที่อาจถูกโจมตี โดยการใช้เครื่องมือและเทคนิคต่างๆ ที่สามารถช่วยในการรวบรวมข้อมูลนี้ได้'),
        _buildContentItem(
            '3. **Scanning Networks**',
            'การสแกนเครือข่ายเพื่อหาผู้ใช้ที่ทำงานอยู่ (active devices) และตรวจหาช่องโหว่ที่อาจเกิดขึ้น รวมถึงการสแกนพอร์ตเพื่อค้นหาโครงสร้างของเครือข่ายและระบบที่อาจมีความเสี่ยงสูง เช่น เครื่องมือ Nmap ที่นิยมใช้ในกระบวนการนี้'),
        _buildContentItem(
            '4. **Enumeration**',
            'การเก็บข้อมูลเพิ่มเติมเกี่ยวกับระบบหรือเครือข่ายหลังจากการสแกน เช่น การค้นหาชื่อผู้ใช้ (usernames) หรือการแชร์ทรัพยากร (shared resources) ที่อาจเป็นช่องทางที่แฮ็กเกอร์สามารถใช้เพื่อเข้าถึงระบบได้'),
        _buildContentItem(
            '5. **Vulnerability Analysis**',
            'การวิเคราะห์ช่องโหว่ที่พบในระบบเพื่อประเมินความเสี่ยงและความรุนแรงของการโจมตี โดยการหาช่องโหว่ที่อาจทำให้ระบบไม่ปลอดภัยและการอุดช่องโหว่เหล่านั้นให้เร็วที่สุดเพื่อป้องกันการโจมตี'),
        _buildContentItem(
            '6. **System Hacking**',
            'ในหัวข้อนี้จะเน้นการแฮ็กระบบเพื่อเข้าถึงข้อมูลที่ไม่ได้รับอนุญาต เช่น การใช้งานเทคนิคการโจมตีทางระบบที่อาจเกิดขึ้น รวมถึงวิธีการทดสอบและรักษาความปลอดภัยของระบบให้ปลอดภัยจากการโจมตี'),
        _buildContentItem(
            '7. **Trojan Horses, Viruses, and Worms**',
            'เรียนรู้เกี่ยวกับโปรแกรมที่เป็นอันตราย เช่น ม้าโทรจัน (Trojan Horses), ไวรัส (Viruses) และหนอน (Worms) ซึ่งสามารถส่งผลกระทบต่อเครือข่ายหรือระบบ และการตรวจจับและป้องกันโปรแกรมเหล่านี้ในฐานะแฮ็กเกอร์ที่เชี่ยวชาญ'),
        _buildContentItem(
            '8. **Sniffing**',
            'การใช้งานเครื่องมือ sniffing เพื่อดักจับและตรวจสอบข้อมูลที่ถูกส่งในเครือข่าย เช่น รหัสผ่าน (passwords), คุกกี้ (session cookies) และข้อมูลที่อ่อนไหวอื่นๆ ซึ่งเป็นหนึ่งในวิธีการที่แฮ็กเกอร์ใช้ในการโจมตีเครือข่าย'),
        _buildContentItem(
            '9. **Social Engineering**',
            'การใช้กลยุทธ์ทางจิตวิทยาเพื่อหลอกลวงและให้ข้อมูลที่สำคัญแก่ผู้โจมตี โดยใช้เทคนิคในการโจมตีแบบ Social Engineering และวิธีป้องกันไม่ให้ถูกหลอกลวงโดยการใช้เทคนิคนี้'),
        _buildContentItem(
            '10. **Web Application Hacking**',
            'การเรียนรู้เกี่ยวกับช่องโหว่ที่พบในแอปพลิเคชันเว็บและการทดสอบการโจมตีด้วยเครื่องมือต่างๆ เช่น Burp Suite ซึ่งช่วยให้แฮ็กเกอร์สามารถหาช่องโหว่ที่อาจเกิดขึ้น เช่น SQL Injection หรือ Cross-Site Scripting (XSS)'),
        _buildContentItem(
            '11. **Wireless Network Hacking**',
            'การเรียนรู้เกี่ยวกับช่องโหว่ของเครือข่ายไร้สาย (Wi-Fi) และวิธีการทดสอบความปลอดภัยของเครือข่ายไร้สาย เช่น การตรวจสอบความปลอดภัยของการเข้ารหัสข้อมูลและการสร้างจุดเชื่อมต่อหลอก (Rogue Access Points)'),
        _buildContentItem(
            '12. **Cloud Computing Security**',
            'เรียนรู้เกี่ยวกับความท้าทายด้านความปลอดภัยที่เกิดขึ้นในระบบคลาวด์ (Cloud) และวิธีการป้องกันการโจมตีที่อาจเกิดขึ้นบนระบบคลาวด์ เช่น การรักษาความปลอดภัยข้อมูลและการใช้งานบริการคลาวด์ให้ปลอดภัย'),
        _buildContentItem(
            '13. **Penetration Testing Methodologies**',
            'การเรียนรู้เกี่ยวกับวิธีการทดสอบการเจาะระบบ (Penetration Testing) ที่ได้รับการยอมรับ เช่น OWASP, PTES และ OSCP เพื่อทดสอบความปลอดภัยของระบบในองค์กร'),
        _buildContentItem(
            '14. **Reporting and Ethics**',
            'การรายงานผลการทดสอบและช่องโหว่ที่พบในการทำงานแฮ็กเชิงจริยธรรม โดยมีการอธิบายเกี่ยวกับหน้าที่และจริยธรรมของแฮ็กเกอร์ในการรายงานช่องโหว่ที่พบให้กับเจ้าของระบบอย่างถูกต้องและรับผิดชอบ'),
        SizedBox(height: 20),
        Text(
          'บทสรุป: คอร์สนี้ช่วยให้นักเรียนได้รับทักษะในการทำการแฮ็กเชิงจริยธรรมในลักษณะที่รับผิดชอบและมีการควบคุม โดยเมื่อจบคอร์ส นักเรียนจะมีความสามารถในการปกป้องระบบ เครือข่าย และข้อมูลจากการโจมตีที่เกิดจากแฮ็กเกอร์',
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
