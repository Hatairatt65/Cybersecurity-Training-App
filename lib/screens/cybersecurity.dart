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
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ ใส่รูปภาพตรงนี้
              Center(
                child: Image.asset(
                  "assets/images/cybersecurity.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'ชื่อหลักสูตร: ${course.courseName}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'ผู้สอน: ${course.instructorName}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 6),
              Text(
                'การศึกษา: ${course.education}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 6),
              Text(
                'จำนวนผู้เข้าร่วม: ${course.participantsCount}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'เนื้อหาหลักสูตร:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '1. ความสำคัญของความมั่นคงปลอดภัยไซเบอร์',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '   - ในโลกยุคดิจิทัล ข้อมูลส่วนบุคคลและข้อมูลทางธุรกิจมีความสำคัญสูงมาก การปกป้องข้อมูลเหล่านี้จากการโจมตีทางไซเบอร์จึงเป็นสิ่งที่ไม่สามารถละเลยได้\n'
                '   - ความปลอดภัยทางไซเบอร์ไม่เพียงแต่เกี่ยวข้องกับการปกป้องข้อมูลส่วนบุคคล แต่ยังเกี่ยวข้องกับการรักษาความมั่นคงของระบบไอทีทั้งในองค์กรและภาครัฐ\n'
                '   - การป้องกันการโจมตีไซเบอร์ที่อาจทำให้ข้อมูลรั่วไหลหรือล้มเหลวของระบบสำคัญจึงเป็นภารกิจหลักของนักวิชาการด้านไซเบอร์\n'
                '   - เทคโนโลยีการป้องกันภัยคุกคามทางไซเบอร์ต้องมีการพัฒนาและปรับตัวตามการโจมตีที่เปลี่ยนแปลงตลอดเวลา\n'
                '   - ความตระหนักรู้ด้านความปลอดภัยทางไซเบอร์เป็นสิ่งสำคัญที่จะช่วยลดความเสี่ยงและสร้างความมั่นใจให้กับผู้ใช้ในโลกออนไลน์',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '2. ภัยคุกคามทางไซเบอร์ที่พบบ่อย',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '   - มัลแวร์ (Malware): เป็นโปรแกรมที่ถูกออกแบบมาเพื่อทำลายหรือเข้าถึงข้อมูลของผู้ใช้โดยไม่ได้รับอนุญาต เช่น ไวรัส โทรจัน และแรนซัมแวร์\n'
                '   - ฟิชชิง (Phishing): การหลอกลวงผู้ใช้ให้เปิดเผยข้อมูลส่วนบุคคลผ่านช่องทางต่าง ๆ เช่น อีเมลหรือเว็บไซต์ปลอมที่ดูเหมือนจริง\n'
                '   - การโจมตีแบบ DDoS (Distributed Denial of Service): การโจมตีที่มุ่งทำให้บริการหรือเว็บไซต์ไม่สามารถใช้งานได้โดยการส่งคำขอจำนวนมากจากหลายแหล่ง\n'
                '   - การแอบอ้างตัวตน (Impersonation): การปลอมตัวเป็นบุคคลหรือองค์กรที่เชื่อถือได้เพื่อหลอกลวงหรือขโมยข้อมูลจากเหยื่อ\n'
                '   - การโจมตีช่องโหว่ของซอฟต์แวร์ (Software Vulnerabilities): การใช้ช่องโหว่ของซอฟต์แวร์หรือระบบปฏิบัติการที่ไม่ได้รับการอัปเดตเพื่อเข้าไปโจมตี',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
