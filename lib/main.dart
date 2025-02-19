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
import 'package:account/Cybersecurity.dart'; // นำเข้าหน้ารายละเอียดคอร์ส
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InstructorProvider()), // เพิ่ม Provider ของ InstructorProvider
        ChangeNotifierProvider(create: (_) => RegistrationProvider()),
        ChangeNotifierProvider(create: (context) => InstructorProvider()), // เพิ่ม Provider ของ RegistrationProvider
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

    // เช็คว่าผู้ใช้ลงทะเบียนคอร์สไปแล้วหรือยัง
    final isRegistered = provider.instructors.any((instructor) => instructor.isRegistered);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cybersecurity Courses',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: instructors.isEmpty
          ? Center(child: Text('ไม่มีหลักสูตรที่แสดง'))
          : ListView.builder(
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
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${instructor.courseName}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey.shade900,
                          ),
                        ),
                        if (instructor.isRegistered)
                          IconButton(
                            onPressed: () {
                              // ไปหน้าเนื้อหาคอร์สเมื่อกด
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Cybersecurity(
                                    course: instructor,
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.description, color: Colors.blueGrey.shade700),
                          ),
                      ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Participants: ${instructor.participantsCount}',
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
                                      color: Colors.red,
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
                                            title: const Text('ยืนยันการยกเลิก'),
                                            content: const Text('คุณแน่ใจหรือว่าต้องการยกเลิกการลงทะเบียน?'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('ยกเลิก'),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  // ทำการยกเลิกการลงทะเบียน
                                                  provider.cancelRegistration(instructor);
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('ยืนยัน'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.cancel, color: Colors.red.shade600),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // เช็คว่าผู้ใช้ลงทะเบียนคอร์สไปแล้วหรือยัง
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
            // ไปหน้า RegistrationScreen เพื่อลงทะเบียน
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Registrationscreen()),
            );
            
            // อัพเดตหน้าหลักหลังจากกลับจากหน้า RegistrationScreen
            if (result != null && result == 'success') {
              // ทำการรีเฟรชข้อมูล หรือดำเนินการที่ต้องการหลังจากลงทะเบียนเสร็จ
            }
          }
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


