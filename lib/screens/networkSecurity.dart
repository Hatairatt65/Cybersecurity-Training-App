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
      body: SingleChildScrollView(  // เพิ่ม SingleChildScrollView ที่นี่
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/ns.png",
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'ชื่อคอร์ส: ${course.courseName}',
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
              'เนื้อหาของคอร์ส:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. **บทนำสู่การรักษาความปลอดภัยของเครือข่าย (Introduction to Network Security)**: บทเรียนแรกจะอธิบายถึงหลักการพื้นฐานของการรักษาความปลอดภัยเครือข่าย รวมถึงภัยคุกคามที่พบบ่อย ๆ และวิธีการป้องกันที่ใช้ในเครือข่าย เช่น การควบคุมการเข้าถึง (Access Control) และการตรวจจับการบุกรุก (Intrusion Detection).',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. **ไฟร์วอลล์และการรักษาความปลอดภัยของเครือข่าย (Firewalls and Network Security)**: ในส่วนนี้จะพูดถึงประเภทต่าง ๆ ของไฟร์วอลล์ ทั้งแบบฮาร์ดแวร์และซอฟต์แวร์ การตั้งค่าต่าง ๆ ของไฟร์วอลล์ และวิธีการที่ไฟร์วอลล์ช่วยป้องกันการโจมตีจากภายนอกเครือข่าย เช่น การป้องกัน DDoS (Distributed Denial of Service) และการเข้าถึงที่ไม่ได้รับอนุญาต.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '3. **ระบบตรวจจับและป้องกันการบุกรุก (Intrusion Detection and Prevention Systems - IDS/IPS)**: เรียนรู้เกี่ยวกับระบบ IDS/IPS ที่ช่วยตรวจจับและป้องกันกิจกรรมที่ไม่พึงประสงค์ในเครือข่าย เช่น การโจมตีแบบ Denial of Service (DoS) และการบุกรุกที่พยายามทำให้เกิดความเสียหายต่อเครือข่าย.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '4. **เครือข่ายส่วนตัวเสมือน (Virtual Private Networks - VPN)**: ทำความเข้าใจเกี่ยวกับ VPN และวิธีการที่ VPN ใช้ในการสร้างการเชื่อมต่อที่ปลอดภัยระหว่างผู้ใช้กับเครือข่ายภายนอก เช่น การใช้ในการเชื่อมต่อกับเครือข่ายองค์กรจากระยะไกล และการป้องกันข้อมูลที่ส่งผ่านอินเทอร์เน็ต.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '5. **เทคนิคการเข้ารหัสในเครือข่าย (Network Encryption Techniques)**: เรียนรู้เกี่ยวกับเทคนิคการเข้ารหัสที่ใช้ในการปกป้องข้อมูลในเครือข่าย เช่น SSL/TLS, IPsec, และการเข้ารหัสข้อมูลในการส่งข้อมูลทางอินเทอร์เน็ต.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '6. **โปรโตคอลและเทคโนโลยีความปลอดภัย (Security Protocols and Technologies)**: การศึกษาเกี่ยวกับโปรโตคอลความปลอดภัยที่สำคัญ เช่น SSL/TLS, IPSec และการใช้เทคโนโลยีต่าง ๆ เช่น NAT (Network Address Translation) ในการป้องกันภัยคุกคามในเครือข่าย.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '7. **การโจมตีเครือข่ายที่พบบ่อยและการป้องกัน (Common Network Attacks and Mitigations)**: การทำความเข้าใจเกี่ยวกับการโจมตีในเครือข่ายที่พบมาก เช่น DDoS (Distributed Denial of Service), การโจมตีแบบ Man-in-the-Middle (MITM), Phishing และวิธีการป้องกันการโจมตีเหล่านี้.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '8. **กรณีศึกษาจากเหตุการณ์จริง (Case Studies)**: การศึกษากรณีศึกษาจากเหตุการณ์ความปลอดภัยที่เกิดขึ้นจริงในโลกไซเบอร์ โดยวิเคราะห์สาเหตุและผลกระทบจากเหตุการณ์นั้น ๆ พร้อมวิธีการที่ใช้ในการแก้ไขปัญหาดังกล่าว.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '9. **การใช้เครื่องมือและเทคนิคต่าง ๆ ในการรักษาความปลอดภัย (Practical Tools and Techniques)**: เรียนรู้การใช้เครื่องมือที่สำคัญในงานรักษาความปลอดภัย เช่น Wireshark, Nmap, และ Metasploit เพื่อทดสอบการป้องกันเครือข่ายและตรวจจับช่องโหว่.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '10. **การสร้างแผนการรักษาความปลอดภัยสำหรับองค์กร (Building a Network Security Plan)**: การออกแบบแผนการรักษาความปลอดภัยสำหรับองค์กร และการวางมาตรการป้องกันต่าง ๆ ที่เหมาะสมกับขนาดและลักษณะของเครือข่าย.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'บทสรุป: คอร์สนี้จะช่วยให้ผู้เรียนเข้าใจเกี่ยวกับการปกป้องเครือข่ายจากภัยคุกคามทางไซเบอร์ที่หลากหลาย และสามารถนำความรู้ไปใช้ในการสร้างและดูแลรักษาความปลอดภัยของเครือข่ายในองค์กรได้อย่างมีประสิทธิภาพ.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
