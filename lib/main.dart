import 'package:flutter/material.dart';
import 'package:account/addTrainingScreen.dart';
import 'screens/registrationscreen.dart';
import 'package:account/editTrainingScreen.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:account/model/transaction.dart';
import 'package:account/provider/trainingProvider.dart';
import 'model/instructorProvider.dart';
import 'model/instructor.dart';
import 'model/registrationProvider.dart';
import 'screens/Cybersecurity.dart';
import 'screens/ethicalHacking.dart';
import 'screens/networkSecurity.dart';
import 'screens/penetrationTesting.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                InstructorProvider()), // เพิ่ม Provider ของ InstructorProvider
        ChangeNotifierProvider(create: (_) => RegistrationProvider()),
        ChangeNotifierProvider(
            create: (context) =>
                InstructorProvider()), // เพิ่ม Provider ของ RegistrationProvider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TrainingProvider()),
      ],
      child: MaterialApp(
        title: 'Cybersecurity Training',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          fontFamily: 'Roboto',
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const TrainingHomePage(title: 'Cybersecurity Training'),
      ),
    );
  }
}

class TrainingHomePage extends StatefulWidget {
  const TrainingHomePage({super.key, required this.title});

  final String title;

  @override
  State<TrainingHomePage> createState() => _TrainingHomePageState();
}

class _TrainingHomePageState extends State<TrainingHomePage> {
  bool _showLatest = true;

  @override
  void initState() {
    super.initState();
    Provider.of<TrainingProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 64, 83, 92),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 64, 83, 92),
              ),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.book, color: Colors.blueGrey.shade700),
                    title: const Text(
                      'Courses',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CoursesPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.quiz, color: Colors.blueGrey.shade700),
                    title: const Text(
                      'Quizzes',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizzesPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/cst.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
              ),
              Text(
                'ความสำคัญของความปลอดภัยทางไซเบอร์',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade700,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'ในยุคดิจิทัลที่การเชื่อมต่ออินเทอร์เน็ตกลายเป็นส่วนสำคัญของชีวิตประจำวัน ความปลอดภัยทางไซเบอร์จึงกลายเป็นประเด็นที่ไม่อาจมองข้ามได้ ทุกวันมีผู้คนจำนวนมากที่ตกเป็นเหยื่อของการโจมตีทางไซเบอร์ ...\n\n'
                'การปกป้องข้อมูลส่วนบุคคลและทรัพยากรทางธุรกิจจากการโจมตีทางไซเบอร์ เช่น การแฮ็กข้อมูล การขโมยข้อมูลส่วนบุคคล และการโจมตีประเภทอื่น ๆ เป็นสิ่งที่องค์กรและบุคคลทุกคนต้องให้ความสำคัญ\n\n'
                'ภัยคุกคามทางไซเบอร์มีหลายประเภท ตั้งแต่การโจมตีที่เรียกว่า "Phishing" หรือการหลอกลวงผ่านอีเมล์ไปจนถึงการโจมตีแบบ "Denial-of-Service" (DoS) ที่ทำให้ระบบไม่สามารถให้บริการได้ตามปกติ การโจมตีเหล่านี้มีผลกระทบที่ร้ายแรงต่อทั้งบุคคลและองค์กร\n\n'
                'การฝึกอบรมด้านความปลอดภัยทางไซเบอร์จึงมีบทบาทสำคัญในการเตรียมความพร้อมให้กับบุคลากรในองค์กรในการรับมือกับภัยคุกคามที่อาจเกิดขึ้นได้ในโลกออนไลน์ บุคลากรที่มีความรู้และทักษะในการป้องกันภัยคุกคามไซเบอร์สามารถช่วยลดโอกาสในการเกิดเหตุการณ์ที่ไม่พึงประสงค์\n\n'
                'การใช้มาตรการป้องกันต่าง ๆ เช่น การใช้รหัสผ่านที่มีความปลอดภัยสูง การเข้ารหัสข้อมูล การตรวจสอบความปลอดภัยของระบบ และการฝึกอบรมการใช้เครื่องมือป้องกันภัยคุกคามจะช่วยให้สามารถป้องกันภัยจากการโจมตีได้\n\n'
                'ระบบรักษาความปลอดภัยต้องประกอบด้วยหลายขั้นตอน เช่น การใช้ไฟร์วอลล์ (Firewall) เพื่อป้องกันการเข้าถึงที่ไม่ได้รับอนุญาตจากภายนอก การใช้ระบบการตรวจจับการบุกรุก (Intrusion Detection Systems - IDS) เพื่อเฝ้าระวังและตรวจจับกิจกรรมที่น่าสงสัยในระบบ และการใช้ซอฟต์แวร์ป้องกันไวรัสเพื่อป้องกันมัลแวร์\n\n'
                'นอกจากนี้ การรักษาความปลอดภัยทางไซเบอร์ยังเป็นการเสริมสร้างความมั่นคงให้กับธุรกิจ โดยเฉพาะในยุคที่การโจมตีทางไซเบอร์สามารถทำให้ระบบทำงานผิดพลาด และอาจส่งผลให้เกิดการสูญเสียข้อมูลหรือความเสียหายต่อชื่อเสียงขององค์กร\n\n'
                'การสร้างแผนรับมือเหตุการณ์ (Incident Response Plan) ก็เป็นส่วนสำคัญที่ช่วยให้การตอบสนองต่อการโจมตีเกิดขึ้นได้อย่างรวดเร็วและมีประสิทธิภาพ เช่น การสำรองข้อมูลอย่างสม่ำเสมอเพื่อป้องกันการสูญหายของข้อมูลสำคัญ หากเกิดการโจมตีข้อมูลหรือระบบ\n\n'
                'สิ่งที่องค์กรต้องทำคือการให้ความรู้แก่พนักงานทุกคน เพื่อให้เข้าใจถึงความสำคัญของการรักษาความปลอดภัยในระดับบุคคล การฝึกอบรมเกี่ยวกับการใช้งานโปรแกรมหรือเครื่องมือต่าง ๆ ที่ช่วยในการป้องกันภัยคุกคาม เช่น การใช้ซอฟต์แวร์แอนตี้ไวรัสที่อัปเดตอยู่เสมอ\n\n'
                'การรักษาความปลอดภัยทางไซเบอร์จึงเป็นกระบวนการที่ต้องใช้ทั้งเทคโนโลยีและการฝึกอบรมที่เหมาะสม ทุกคนในองค์กรไม่ว่าจะเป็นผู้บริหารหรือพนักงาน ต้องมีส่วนร่วมในการรักษาความปลอดภัยทางไซเบอร์ เพื่อให้สามารถป้องกันและตอบสนองต่อภัยคุกคามได้อย่างมีประสิทธิภาพ\n\n'
                'การเสริมสร้างความรู้และทักษะด้านความปลอดภัยทางไซเบอร์ไม่เพียงแต่จะช่วยปกป้องทรัพยากรภายในองค์กร แต่ยังช่วยให้ผู้ใช้งานในองค์กรสามารถปฏิบัติตามมาตรฐานความปลอดภัยที่กำหนดไว้และลดความเสี่ยงจากภัยคุกคามทางไซเบอร์ที่เกิดขึ้นในทุก ๆ วัน',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InstructorProvider>(context);
    final instructors =
        provider.instructors.take(15).toList(); // ดึง 15 รายการแรก
    final isRegistered =
        provider.instructors.any((instructor) => instructor.isRegistered);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cybersecurity Courses',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.blueGrey.shade800,
        elevation: 8.0,
        shape: RoundedRectangleBorder(),
      ),
      body: instructors.isEmpty
          ? Center(
              child: Text(
                'ไม่มีหลักสูตรที่แสดง',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ListView.builder(
              itemCount: instructors.length,
              itemBuilder: (context, index) {
                final instructor = instructors[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  elevation: 15.0, // เพิ่มมิติให้การ์ด
                  shadowColor: Colors.blueGrey.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // ทำให้การ์ดนุ่มนวลขึ้น
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade50, Colors.blueGrey.shade100],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${instructor.courseName}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                          if (instructor.isRegistered)
                            IconButton(
                              onPressed: () {
                                Widget courseScreen;
                                switch (instructor.courseName) {
                                  case 'Cybersecurity':
                                    courseScreen =
                                        Cybersecurity(course: instructor);
                                    break;
                                  case 'Ethical Hacking':
                                    courseScreen =
                                        EthicalHacking(course: instructor);
                                    break;
                                  case 'Network Security':
                                    courseScreen =
                                        NetworkSecurity(course: instructor);
                                    break;
                                  case 'Penetration Testing':
                                    courseScreen =
                                        PenetrationTesting(course: instructor);
                                    break;
                                  default:
                                    courseScreen =
                                        Cybersecurity(course: instructor);
                                    break;
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => courseScreen),
                                );
                              },
                              icon: Icon(Icons.description,
                                  color: Colors.blueGrey.shade700),
                            ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '👩‍🏫 ผู้สอน: ${instructor.instructorName}',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey.shade600),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '🎓 การศึกษา: ${instructor.education}',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blueGrey.shade500),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '🧑‍🤝‍🧑 จำนวนผู้เข้าร่วม: ${instructor.participantsCount}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green.shade700,
                                  ),
                                ),
                                if (instructor.isRegistered)
                                  Row(
                                    children: [
                                      Text(
                                        'กำลังอบรม',
                                        style: TextStyle(
                                          color: Colors.red.shade700,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'ยืนยันการยกเลิก'),
                                                content: const Text(
                                                    'คุณแน่ใจหรือว่าต้องการยกเลิกการลงทะเบียน?'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('ยกเลิก'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () async {
                                                      provider
                                                          .cancelRegistration(
                                                              instructor);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('ยืนยัน'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: Icon(Icons.cancel,
                                            color: Colors.red.shade600),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          final result = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Registrationscreen()),
                                          );

                                          if (result != null &&
                                              result == 'success') {
                                            final oldCourse =
                                                provider.instructors.firstWhere(
                                              (instructor) =>
                                                  instructor.isRegistered,
                                              orElse: () => Instructor.empty(),
                                            );

                                            if (oldCourse.isRegistered) {
                                              provider.cancelRegistration(
                                                  oldCourse);
                                            }
                                            provider.refreshData();
                                          }
                                        },
                                        icon: Icon(Icons.edit,
                                            color: Colors.orange.shade700),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (isRegistered) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('ไม่สามารถลงทะเบียนได้'),
                  content: Text('คุณได้ลงคอร์สอบรมแล้วเพียง 1 คอร์สเท่านั้น'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('ตกลง'),
                    ),
                  ],
                );
              },
            );
          } else {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Registrationscreen()),
            );

            if (result != null && result == 'success') {
              // ทำการรีเฟรชข้อมูล หรือดำเนินการที่ต้องการหลังจากลงทะเบียนเสร็จ
            }
          }
        },
        label: Text(
          'ลงอบรม',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        icon: Icon(Icons.school, color: Colors.white),
        backgroundColor: Colors.blueGrey.shade700,
        elevation: 15.0,
      ),
    );
  }
}

class QuizzesPage extends StatefulWidget {
  const QuizzesPage({super.key});

  @override
  _QuizzesPageState createState() => _QuizzesPageState();
}

class _QuizzesPageState extends State<QuizzesPage> {
  final List<Map<String, dynamic>> _quizQuestions = [
    {
      "question": "คำถามที่ 1 ข้อใดคือแนวทางที่ดีที่สุดในการเลือกใช้รหัสผ่าน?",
      "options": [
        "ใช้รหัสผ่านที่ง่ายและจำได้ง่าย",
        "ใช้รหัสผ่านที่ประกอบด้วยตัวอักษรและตัวเลข",
        "ใช้รหัสผ่านที่ประกอบด้วยตัวอักษรพิเศษ, ตัวเลข และตัวอักษรใหญ่-เล็ก",
        "ใช้รหัสผ่านเดียวสำหรับทุกเว็บไซต์"
      ],
      "answer":
          "ใช้รหัสผ่านที่ประกอบด้วยตัวอักษรพิเศษ, ตัวเลข และตัวอักษรใหญ่-เล็ก"
    },
    {
      "question": "คำถามที่ 2 ข้อใดคือการโจมตีแบบ phishing?",
      "options": [
        "การแอบแฝงตัวเป็นผู้ใช้ที่ถูกต้อง",
        "การโจมตีผ่านเครือข่าย",
        "การโจมตีเพื่อขโมยข้อมูลทางการเงิน",
        "การโจมตีโดยการใช้มัลแวร์"
      ],
      "answer": "การแอบแฝงตัวเป็นผู้ใช้ที่ถูกต้อง"
    },
    {
      "question":
          "คำถามที่ 3 ข้อใดคือเครื่องมือที่ใช้ในการตรวจสอบความปลอดภัยของเว็บไซต์?",
      "options": ["Wireshark", "Metasploit", "Burp Suite", "Kali Linux"],
      "answer": "Burp Suite"
    },
    {
      "question": "คำถามที่ 4 การใช้งาน VPN ช่วยป้องกันความปลอดภัยอย่างไร?",
      "options": [
        "การเข้ารหัสการเชื่อมต่อระหว่างเครื่องผู้ใช้และเซิร์ฟเวอร์",
        "ป้องกันการโจมตีทางฟิชชิ่ง",
        "ป้องกันการโจมตีจากแฮกเกอร์ในเครือข่ายไร้สาย",
        "ไม่เกี่ยวข้องกับความปลอดภัย"
      ],
      "answer": "การเข้ารหัสการเชื่อมต่อระหว่างเครื่องผู้ใช้และเซิร์ฟเวอร์"
    },
    {
      "question":
          "คำถามที่ 5 การอัพเดตซอฟต์แวร์เป็นประจำช่วยป้องกันการโจมตีทางไซเบอร์ได้อย่างไร?",
      "options": [
        "ช่วยป้องกันช่องโหว่ที่อาจถูกแฮกเกอร์ใช้โจมตี",
        "ทำให้ซอฟต์แวร์ทำงานได้เร็วขึ้น",
        "ไม่เกี่ยวข้องกับความปลอดภัย",
        "ช่วยในการเชื่อมต่ออินเทอร์เน็ตได้ดีขึ้น"
      ],
      "answer": "ช่วยป้องกันช่องโหว่ที่อาจถูกแฮกเกอร์ใช้โจมตี"
    },
    {
      "question": "คำถามที่ 6 ข้อใดคือการโจมตีแบบ DDoS?",
      "options": [
        "การโจมตีด้วยการใช้มัลแวร์",
        "การโจมตีด้วยการดักจับข้อมูล",
        "การโจมตีด้วยการส่งคำขอจากหลายๆ เครื่องเพื่อทำให้เซิร์ฟเวอร์ล่ม",
        "การโจมตีเพื่อขโมยข้อมูลส่วนตัว"
      ],
      "answer": "การโจมตีด้วยการส่งคำขอจากหลายๆ เครื่องเพื่อทำให้เซิร์ฟเวอร์ล่ม"
    },
    {
      "question": "คำถามที่ 7 ข้อใดคือวิธีการป้องกันการโจมตีแบบ SQL Injection?",
      "options": [
        "การใช้ SSL/TLS",
        "การใช้ prepared statements ในการเขียน query",
        "การใช้รหัสผ่านที่ซับซ้อน",
        "การใช้ VPN"
      ],
      "answer": "การใช้ prepared statements ในการเขียน query"
    },
    {
      "question":
          "คำถามที่ 8 ในการจัดการกับความปลอดภัยในองค์กร ควรมีนโยบายด้านความปลอดภัยใดบ้าง?",
      "options": [
        "การใช้รหัสผ่านที่แข็งแกร่ง",
        "การอบรมการใช้งานเครื่องมือความปลอดภัย",
        "การจำกัดสิทธิ์การเข้าถึงข้อมูล",
        "ทุกข้อ"
      ],
      "answer": "ทุกข้อ"
    },
    {
      "question": "คำถามที่ 9 ข้อใดคือฟังก์ชันหลักของการใช้ Firewalls?",
      "options": [
        "ป้องกันการเข้าถึงข้อมูลจากแหล่งที่ไม่รู้จัก",
        "ป้องกันการโจมตี DDoS",
        "ป้องกันการทำงานของมัลแวร์",
        "การเข้ารหัสข้อมูล"
      ],
      "answer": "ป้องกันการเข้าถึงข้อมูลจากแหล่งที่ไม่รู้จัก"
    },
    {
      "question":
          "คำถามที่ 10 การใช้รหัสผ่านที่ยาวกว่าช่วยให้มั่นคงปลอดภัยขึ้นอย่างไร?",
      "options": [
        "เพิ่มความยากในการเดารหัสผ่าน",
        "ทำให้ผู้ใช้จำรหัสผ่านได้ง่ายขึ้น",
        "ทำให้การโจมตีด้วย brute force ยากขึ้น",
        "ไม่ส่งผลต่อความปลอดภัย"
      ],
      "answer": "เพิ่มความยากในการเดารหัสผ่าน"
    },
    {
      "question":
          "คำถามที่ 11 การใช้ซอฟต์แวร์อัพเดตอัตโนมัติช่วยป้องกันภัยคุกคามทางไซเบอร์ได้อย่างไร?",
      "options": [
        "ป้องกันช่องโหว่จากการที่ซอฟต์แวร์ล้าสมัย",
        "ทำให้เครื่องทำงานเร็วขึ้น",
        "ทำให้ซอฟต์แวร์ถูกแฮกได้ง่ายขึ้น",
        "ไม่มีผลต่อความปลอดภัย"
      ],
      "answer": "ป้องกันช่องโหว่จากการที่ซอฟต์แวร์ล้าสมัย"
    },
    {
      "question": "คำถามที่ 12 ข้อใดคือลักษณะของการโจมตีแบบ Man-in-the-Middle?",
      "options": [
        "การดักจับการสื่อสารระหว่างผู้ใช้กับเซิร์ฟเวอร์",
        "การปลอมแปลงเว็บไซต์เพื่อขโมยข้อมูล",
        "การขโมยรหัสผ่านจากการเชื่อมต่อที่ไม่ปลอดภัย",
        "ทุกข้อ"
      ],
      "answer": "ทุกข้อ"
    },
    {
      "question": "คำถามที่ 13 ข้อใดคือความหมายของคำว่า 'Zero-Day Attack'?",
      "options": [
        "การโจมตีที่เกิดขึ้นทันทีที่ช่องโหว่ถูกค้นพบ",
        "การโจมตีที่ใช้เวลานานในการวางแผน",
        "การโจมตีที่ใช้การลักลอบข้อมูล",
        "การโจมตีที่ไม่สามารถป้องกันได้"
      ],
      "answer": "การโจมตีที่เกิดขึ้นทันทีที่ช่องโหว่ถูกค้นพบ"
    },
    {
      "question":
          "คำถามที่ 14 การใช้การตรวจสอบแบบ Two-Factor Authentication (2FA) ช่วยเพิ่มความปลอดภัยได้อย่างไร?",
      "options": [
        "ต้องใช้ทั้งรหัสผ่านและโค้ดที่ได้รับจากอุปกรณ์อื่น",
        "ต้องใช้รหัสผ่านที่ยากขึ้น",
        "ต้องใช้การเข้ารหัสแบบสองชั้น",
        "ต้องใช้รหัสผ่านที่เปลี่ยนทุกครั้ง"
      ],
      "answer": "ต้องใช้ทั้งรหัสผ่านและโค้ดที่ได้รับจากอุปกรณ์อื่น"
    },
    {
      "question":
          "คำถามที่ 15 การป้องกันภัยคุกคามทางไซเบอร์ที่ดีที่สุดคือการทำ?",
      "options": [
        "การอบรมให้ผู้ใช้รู้จักการปฏิบัติตามหลักความปลอดภัย",
        "การใช้ซอฟต์แวร์ป้องกันไวรัส",
        "การติดตั้งไฟร์วอลล์",
        "ทุกข้อ"
      ],
      "answer": "ทุกข้อ"
    }
  ];

  Map<int, String?> _selectedAnswers = {};
  int _score = 0;
  int _highestScore = 0; // ตัวแปรเก็บคะแนนสูงสุด
  int _latestScore = 0; // ตัวแปรเก็บคะแนนล่าสุด

  void _submitQuiz() {
    setState(() {
      _score = 0;

      // คำนวณคะแนน
      for (int i = 0; i < _quizQuestions.length; i++) {
        if (_selectedAnswers[i] == _quizQuestions[i]['answer']) {
          _score++;
        }
      }

      // เก็บคะแนนล่าสุด
      _latestScore = _score;

      // อัพเดทคะแนนสูงสุด
      if (_score > _highestScore) {
        _highestScore = _score;
      }
    });

    // แสดงผลคะแนน
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ผลการทดสอบ'),
          content: Text(
              'คะแนนล่าสุดของคุณ: $_latestScore / ${_quizQuestions.length}\n'
              'คะแนนสูงสุดที่ทำได้: $_highestScore / ${_quizQuestions.length}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedAnswers.clear();
                  _score = 0;
                });
                Navigator.of(context).pop();
              },
              child: const Text('ลองใหม่'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _quizQuestions.length,
                itemBuilder: (context, index) {
                  var question = _quizQuestions[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            question['question'],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          ...question['options']
                              .map<Widget>((option) => RadioListTile<String>(
                                    title: Text(option),
                                    value: option,
                                    groupValue: _selectedAnswers[index],
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedAnswers[index] = value;
                                      });
                                    },
                                  ))
                              .toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _submitQuiz,
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 18, // ขนาดตัวอักษรใหญ่ขึ้น
                  fontWeight: FontWeight.bold, // ตัวอักษรหนา
                  color: Colors.white, // สีตัวอักษร
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 67, 161, 29), // สีพื้นหลังปุ่ม
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: 30), // เพิ่มความกว้างของปุ่ม
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30), // ปรับมุมให้โค้งมนมากขึ้น
                ),
                elevation: 5, // เพิ่มเงาให้ปุ่มมีมิติ
                shadowColor: Colors.green.withOpacity(0.3), // เงาสีเขียวอ่อน
              ),
            ),
          ],
        ),
      ),
    );
  }
}
