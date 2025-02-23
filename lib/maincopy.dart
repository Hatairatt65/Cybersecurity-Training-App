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
import 'model/registration.dart';
import 'model/registrationProvider.dart';
import 'screens/Cybersecurity.dart'; // นำเข้าหน้ารายละเอียดคอร์ส
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