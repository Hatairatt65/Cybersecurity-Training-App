import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// DatabaseHelper Class สำหรับการติดต่อกับฐานข้อมูล
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT NOT NULL,
      email TEXT NOT NULL,
      phoneNumber TEXT NOT NULL,
      password TEXT NOT NULL
    )
    ''');
  }

  // ฟังก์ชันสำหรับเพิ่มผู้ใช้ลงในฐานข้อมูล
  Future<int> createUser(Map<String, dynamic> user) async {
    final db = await instance.database;
    return await db.insert('users', user);
  }

  // ฟังก์ชันสำหรับดึงข้อมูลผู้ใช้ตาม email
  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final db = await instance.database;
    final result = await db.query('users', where: 'email = ?', whereArgs: [email]);
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }
}

void main() {
  runApp(MaterialApp(
    home: UserRegistrationPage(),
  ));
}

class UserRegistrationPage extends StatefulWidget {
  @override
  _UserRegistrationPageState createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  // ฟังก์ชันที่เพิ่มผู้ใช้ลงในฐานข้อมูล
  void addUser() async {
    Map<String, dynamic> newUser = {
      'username': 'mook',
      'email': 'Hatairatt65@nu.ac.th',
      'phoneNumber': '0954561451',
      'password': '1234',
    };

    // เรียกใช้ฟังก์ชัน createUser จาก DatabaseHelper
    await DatabaseHelper.instance.createUser(newUser);
    print('User added successfully');
  }

  @override
  void initState() {
    super.initState();
    addUser(); // เพิ่มผู้ใช้เมื่อหน้าถูกโหลด
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Registration')),
      body: Center(
        child: Text('User Added Successfully'),
      ),
    );
  }
}
