import 'package:flutter/material.dart';
import 'package:account/addTrainingScreen.dart';
import 'package:account/editTrainingScreen.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:account/model/transaction.dart';
import 'package:account/provider/trainingProvider.dart';

void main() {
  runApp(const MyApp());
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
        title: 'Account',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade300),
          useMaterial3: true,
        ),
        home: const TrainingHomePage(title: 'Flutter Home Page'),
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
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.shade400, Colors.blue.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: _showLatest ? 'Latest' : 'Oldest',
              onChanged: _toggleSort,
              dropdownColor: Colors.white,
              style: TextStyle(color: Colors.purple.shade700, fontWeight: FontWeight.bold),
              iconEnabledColor: Colors.purple.shade700,
              items: ['Latest', 'Oldest']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.purple.shade700,
                      fontWeight: FontWeight.bold,
                    ),
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
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
                elevation: 6,
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
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.purple.shade800,
                    ),
                  ),
                  subtitle: Text(
                    'วันที่บันทึกข้อมูล: ${DateFormat('dd/MM/yyyy HH:mm').format(data.dateTime)}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.blue.shade400,
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
        backgroundColor: Colors.purple.shade400,
        elevation: 8,
      ),
    );
  }
}
