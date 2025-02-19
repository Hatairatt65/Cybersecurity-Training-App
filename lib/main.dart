import 'package:flutter/material.dart';
import 'package:account/addTrainingScreen.dart';
import 'registrationscreen.dart';
import 'package:account/editTrainingScreen.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:account/model/transaction.dart';
import 'package:account/provider/trainingProvider.dart';
import 'model/instructorProvider.dart';
import 'model/instructor.dart';
import 'model/registration.dart';
import 'model/registrationProvider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InstructorProvider()), // เพิ่ม Provider ของ InstructorProvider
        ChangeNotifierProvider(create: (_) => RegistrationProvider()), // เพิ่ม Provider ของ RegistrationProvider
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

  void _toggleSort(String? value) {
    setState(() {
      if (value != null) {
        _showLatest = value == 'Latest';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 64, 83, 92),
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: _showLatest ? 'Latest' : 'Oldest',
              onChanged: _toggleSort,
              dropdownColor: Colors.blueGrey.shade50,
              style: TextStyle(color: Colors.blueGrey.shade700, fontWeight: FontWeight.w500),
              iconEnabledColor: Colors.blueGrey.shade700,
              items: ['Latest', 'Oldest']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.blueGrey.shade700),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Courses'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CoursesPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Quizzes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizzesPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Consumer<TrainingProvider>(
        builder: (context, provider, child) {
          if (provider.transactions.isEmpty) {
            return const Center(
              child: Text(
                'ไม่มีรายการ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
              ),
            );
          }

          List<TransactionItem> transactions = _showLatest
              ? provider.latestTransactions
              : provider.oldestTransactions;

          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              TransactionItem data = transactions[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.white,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  title: Text(
                    data.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.blueGrey.shade800,
                    ),
                  ),
                  subtitle: Text(
                    'วันที่บันทึกข้อมูล: ${DateFormat('dd/MM/yyyy HH:mm').format(data.dateTime)}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.blueGrey.shade300,
                    child: FittedBox(
                      child: Text(
                        data.amount.toStringAsFixed(0),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('ยืนยันการลบ'),
                            content: const Text('คุณแน่ใจหรือว่าต้องการลบรายการนี้?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('ยกเลิก'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  provider.deleteTransaction(data);
                                  Navigator.of(context).pop();
                                },
                                child: const Text('ยืนยัน'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.delete, color: Colors.red.shade600),
                  ),
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditTrainingScreen(item: data)),
                    );

                    if (result == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('อัพเดตข้อมูลสำเร็จ')),
                      );
                    }
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTrainingScreen()),
          );
          if (result != null && result is Map<String, dynamic>) {
            Provider.of<TrainingProvider>(context, listen: false)
                .addTransaction(TransactionItem(
              title: result['title'],
              amount: result['amount'],
              dateTime: DateTime.now(),
            ));
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blueGrey.shade600,
        elevation: 6,
      ),
    );
  }
}

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InstructorProvider>(context); // ใช้ InstructorProvider
    final instructors = provider.instructors.take(10).toList(); // ดึง 10 รายการแรก

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cybersecurity Courses',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: ListView.builder(
        itemCount: instructors.length,
        itemBuilder: (context, index) {
          final instructor = instructors[index];
          return Card(
            margin: EdgeInsets.all(15),
            elevation: 10,
            shadowColor: Colors.blueGrey.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(15),
              title: Text(
                '${instructor.courseName}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey.shade900,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    'Instructor: ${instructor.instructorName}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey.shade600,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Education: ${instructor.education}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey.shade500,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Participants: ${instructor.participantsCount}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Registrationscreen()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blueGrey.shade600,
        elevation: 8,
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
    "options": ["ใช้รหัสผ่านที่ง่ายและจำได้ง่าย", "ใช้รหัสผ่านที่ประกอบด้วยตัวอักษรและตัวเลข", "ใช้รหัสผ่านที่ประกอบด้วยตัวอักษรพิเศษ, ตัวเลข และตัวอักษรใหญ่-เล็ก", "ใช้รหัสผ่านเดียวสำหรับทุกเว็บไซต์"],
    "answer": "ใช้รหัสผ่านที่ประกอบด้วยตัวอักษรพิเศษ, ตัวเลข และตัวอักษรใหญ่-เล็ก"
  },
  {
    "question": "คำถามที่ 2 ข้อใดคือการโจมตีแบบ phishing?",
    "options": ["การแอบแฝงตัวเป็นผู้ใช้ที่ถูกต้อง", "การโจมตีผ่านเครือข่าย", "การโจมตีเพื่อขโมยข้อมูลทางการเงิน", "การโจมตีโดยการใช้มัลแวร์"],
    "answer": "การแอบแฝงตัวเป็นผู้ใช้ที่ถูกต้อง"
  },
  {
    "question": "คำถามที่ 3 ข้อใดคือเครื่องมือที่ใช้ในการตรวจสอบความปลอดภัยของเว็บไซต์?",
    "options": ["Wireshark", "Metasploit", "Burp Suite", "Kali Linux"],
    "answer": "Burp Suite"
  },
  {
    "question": "คำถามที่ 4 การใช้งาน VPN ช่วยป้องกันความปลอดภัยอย่างไร?",
    "options": ["การเข้ารหัสการเชื่อมต่อระหว่างเครื่องผู้ใช้และเซิร์ฟเวอร์", "ป้องกันการโจมตีทางฟิชชิ่ง", "ป้องกันการโจมตีจากแฮกเกอร์ในเครือข่ายไร้สาย", "ไม่เกี่ยวข้องกับความปลอดภัย"],
    "answer": "การเข้ารหัสการเชื่อมต่อระหว่างเครื่องผู้ใช้และเซิร์ฟเวอร์"
  },
  {
    "question": "คำถามที่ 5 การอัพเดตซอฟต์แวร์เป็นประจำช่วยป้องกันการโจมตีทางไซเบอร์ได้อย่างไร?",
    "options": ["ช่วยป้องกันช่องโหว่ที่อาจถูกแฮกเกอร์ใช้โจมตี", "ทำให้ซอฟต์แวร์ทำงานได้เร็วขึ้น", "ไม่เกี่ยวข้องกับความปลอดภัย", "ช่วยในการเชื่อมต่ออินเทอร์เน็ตได้ดีขึ้น"],
    "answer": "ช่วยป้องกันช่องโหว่ที่อาจถูกแฮกเกอร์ใช้โจมตี"
  },
  {
    "question": "คำถามที่ 6 ข้อใดคือการโจมตีแบบ DDoS?",
    "options": ["การโจมตีด้วยการใช้มัลแวร์", "การโจมตีด้วยการดักจับข้อมูล", "การโจมตีด้วยการส่งคำขอจากหลายๆ เครื่องเพื่อทำให้เซิร์ฟเวอร์ล่ม", "การโจมตีเพื่อขโมยข้อมูลส่วนตัว"],
    "answer": "การโจมตีด้วยการส่งคำขอจากหลายๆ เครื่องเพื่อทำให้เซิร์ฟเวอร์ล่ม"
  },
  {
    "question": "คำถามที่ 7 ข้อใดคือวิธีการป้องกันการโจมตีแบบ SQL Injection?",
    "options": ["การใช้ SSL/TLS", "การใช้ prepared statements ในการเขียน query", "การใช้รหัสผ่านที่ซับซ้อน", "การใช้ VPN"],
    "answer": "การใช้ prepared statements ในการเขียน query"
  },
  {
    "question": "คำถามที่ 8 ในการจัดการกับความปลอดภัยในองค์กร ควรมีนโยบายด้านความปลอดภัยใดบ้าง?",
    "options": ["การใช้รหัสผ่านที่แข็งแกร่ง", "การอบรมการใช้งานเครื่องมือความปลอดภัย", "การจำกัดสิทธิ์การเข้าถึงข้อมูล", "ทุกข้อ"],
    "answer": "ทุกข้อ"
  },
  {
    "question": "คำถามที่ 9 ข้อใดคือฟังก์ชันหลักของการใช้ Firewalls?",
    "options": ["ป้องกันการเข้าถึงข้อมูลจากแหล่งที่ไม่รู้จัก", "ป้องกันการโจมตี DDoS", "ป้องกันการทำงานของมัลแวร์", "การเข้ารหัสข้อมูล"],
    "answer": "ป้องกันการเข้าถึงข้อมูลจากแหล่งที่ไม่รู้จัก"
  },
  {
    "question": "คำถามที่ 10 การใช้รหัสผ่านที่ยาวกว่าช่วยให้มั่นคงปลอดภัยขึ้นอย่างไร?",
    "options": ["เพิ่มความยากในการเดารหัสผ่าน", "ทำให้ผู้ใช้จำรหัสผ่านได้ง่ายขึ้น", "ทำให้การโจมตีด้วย brute force ยากขึ้น", "ไม่ส่งผลต่อความปลอดภัย"],
    "answer": "เพิ่มความยากในการเดารหัสผ่าน"
  },
  {
    "question": "คำถามที่ 11 การใช้ซอฟต์แวร์อัพเดตอัตโนมัติช่วยป้องกันภัยคุกคามทางไซเบอร์ได้อย่างไร?",
    "options": ["ป้องกันช่องโหว่จากการที่ซอฟต์แวร์ล้าสมัย", "ทำให้เครื่องทำงานเร็วขึ้น", "ทำให้ซอฟต์แวร์ถูกแฮกได้ง่ายขึ้น", "ไม่มีผลต่อความปลอดภัย"],
    "answer": "ป้องกันช่องโหว่จากการที่ซอฟต์แวร์ล้าสมัย"
  },
  {
    "question": "คำถามที่ 12 ข้อใดคือลักษณะของการโจมตีแบบ Man-in-the-Middle?",
    "options": ["การดักจับการสื่อสารระหว่างผู้ใช้กับเซิร์ฟเวอร์", "การปลอมแปลงเว็บไซต์เพื่อขโมยข้อมูล", "การขโมยรหัสผ่านจากการเชื่อมต่อที่ไม่ปลอดภัย", "ทุกข้อ"],
    "answer": "ทุกข้อ"
  },
  {
    "question": "คำถามที่ 13 ข้อใดคือความหมายของคำว่า 'Zero-Day Attack'?",
    "options": ["การโจมตีที่เกิดขึ้นทันทีที่ช่องโหว่ถูกค้นพบ", "การโจมตีที่ใช้เวลานานในการวางแผน", "การโจมตีที่ใช้การลักลอบข้อมูล", "การโจมตีที่ไม่สามารถป้องกันได้"],
    "answer": "การโจมตีที่เกิดขึ้นทันทีที่ช่องโหว่ถูกค้นพบ"
  },
  {
    "question": "คำถามที่ 14 การใช้การตรวจสอบแบบ Two-Factor Authentication (2FA) ช่วยเพิ่มความปลอดภัยได้อย่างไร?",
    "options": ["ต้องใช้ทั้งรหัสผ่านและโค้ดที่ได้รับจากอุปกรณ์อื่น", "ต้องใช้รหัสผ่านที่ยากขึ้น", "ต้องใช้การเข้ารหัสแบบสองชั้น", "ต้องใช้รหัสผ่านที่เปลี่ยนทุกครั้ง"],
    "answer": "ต้องใช้ทั้งรหัสผ่านและโค้ดที่ได้รับจากอุปกรณ์อื่น"
  },
  {
    "question": "คำถามที่ 15 การป้องกันภัยคุกคามทางไซเบอร์ที่ดีที่สุดคือการทำ?",
    "options": ["การอบรมให้ผู้ใช้รู้จักการปฏิบัติตามหลักความปลอดภัย", "การใช้ซอฟต์แวร์ป้องกันไวรัส", "การติดตั้งไฟร์วอลล์", "ทุกข้อ"],
    "answer": "ทุกข้อ"
  }
];

  Map<int, String?> _selectedAnswers = {};
  int _score = 0;

  void _submitQuiz() {
    setState(() {
      _score = 0;

      // คำนวณคะแนน
      for (int i = 0; i < _quizQuestions.length; i++) {
        if (_selectedAnswers[i] == _quizQuestions[i]['answer']) {
          _score++;
        }
      }
    });

    // แสดงผลคะแนน
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ผลการทดสอบ'),
          content: Text('คุณได้คะแนน: $_score / ${_quizQuestions.length}'),
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
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              child: const Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 67, 161, 29),
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),  // ปรับมุมให้โค้งมน
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


