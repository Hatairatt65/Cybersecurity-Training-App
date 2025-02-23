import 'package:flutter/material.dart';
import '../model/instructor.dart';

class Cybersecurity extends StatelessWidget {
  final Instructor course;

  const Cybersecurity({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.courseName),
        backgroundColor: Colors.blueGrey.shade800,
        elevation: 6,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // รูปภาพหลักสูตร
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/cs.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
              ),
              SizedBox(height: 20),
              
              // ชื่อหลักสูตร
              Text(
                'ชื่อหลักสูตร: ${course.courseName}',
                style: TextStyle(
                  fontSize: 26, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.blueGrey.shade900
                ),
              ),
              SizedBox(height: 12),
              
              // ผู้สอน
              Text(
                'ผู้สอน: ${course.instructorName}',
                style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
              ),
              SizedBox(height: 8),
              
              // การศึกษา
              Text(
                'การศึกษา: ${course.education}',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              SizedBox(height: 8),
              
              // จำนวนผู้เข้าร่วม
              Text(
                'จำนวนผู้เข้าร่วม: ${course.participantsCount}',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              SizedBox(height: 24),
              
              // เนื้อหาหลักสูตร
              Text(
                'เนื้อหาหลักสูตร:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey.shade800),
              ),
              SizedBox(height: 12),
              
              // รายละเอียดเนื้อหาหลักสูตร
              _buildCourseContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCourseItem('1. ความสำคัญของความมั่นคงปลอดภัยไซเบอร์', 
          '   - ในโลกยุคดิจิทัล ข้อมูลส่วนบุคคลและข้อมูลทางธุรกิจมีความสำคัญสูงมาก การปกป้องข้อมูลเหล่านี้จากการโจมตีทางไซเบอร์จึงเป็นสิ่งที่ไม่สามารถละเลยได้\n'
          '   - ความปลอดภัยทางไซเบอร์ไม่เพียงแต่เกี่ยวข้องกับการปกป้องข้อมูลส่วนบุคคล แต่ยังเกี่ยวข้องกับการรักษาความมั่นคงของระบบไอทีทั้งในองค์กรและภาครัฐ\n'
          '   - การป้องกันการโจมตีไซเบอร์ที่อาจทำให้ข้อมูลรั่วไหลหรือล้มเหลวของระบบสำคัญจึงเป็นภารกิจหลักของนักวิชาการด้านไซเบอร์\n'
          '   - เทคโนโลยีการป้องกันภัยคุกคามทางไซเบอร์ต้องมีการพัฒนาและปรับตัวตามการโจมตีที่เปลี่ยนแปลงตลอดเวลา\n'
          '   - ความตระหนักรู้ด้านความปลอดภัยทางไซเบอร์เป็นสิ่งสำคัญที่จะช่วยลดความเสี่ยงและสร้างความมั่นใจให้กับผู้ใช้ในโลกออนไลน์'),
        SizedBox(height: 16),
        _buildCourseItem('2. ภัยคุกคามทางไซเบอร์ที่พบบ่อย', 
          '   - มัลแวร์ (Malware): เป็นโปรแกรมที่ถูกออกแบบมาเพื่อทำลายหรือเข้าถึงข้อมูลของผู้ใช้โดยไม่ได้รับอนุญาต เช่น ไวรัส โทรจัน และแรนซัมแวร์\n'
          '   - ฟิชชิง (Phishing): การหลอกลวงผู้ใช้ให้เปิดเผยข้อมูลส่วนบุคคลผ่านช่องทางต่าง ๆ เช่น อีเมลหรือเว็บไซต์ปลอมที่ดูเหมือนจริง\n'
          '   - การโจมตีแบบ DDoS (Distributed Denial of Service): การโจมตีที่มุ่งทำให้บริการหรือเว็บไซต์ไม่สามารถใช้งานได้โดยการส่งคำขอจำนวนมากจากหลายแหล่ง\n'
          '   - การแอบอ้างตัวตน (Impersonation): การปลอมตัวเป็นบุคคลหรือองค์กรที่เชื่อถือได้เพื่อหลอกลวงหรือขโมยข้อมูลจากเหยื่อ\n'
          '   - การโจมตีช่องโหว่ของซอฟต์แวร์ (Software Vulnerabilities): การใช้ช่องโหว่ของซอฟต์แวร์หรือระบบปฏิบัติการที่ไม่ได้รับการอัปเดตเพื่อเข้าไปโจมตี'),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildCourseItem(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey.shade800,
          ),
        ),
        SizedBox(height: 6),
        Text(
          content,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
        ),
      ],
    );
  }
}
