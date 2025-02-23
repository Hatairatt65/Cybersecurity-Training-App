import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/instructorProvider.dart';
import 'package:intl/intl.dart';
import '../model/instructor.dart';

class Registrationscreen extends StatefulWidget {
  @override
  _RegistrationscreenState createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends State<Registrationscreen> {
  bool _isRegistering = false;
  String? selectedCourse;
  String? instructorName;
  String? education;
  int? participantsCount;
  DateTime? registrationDate;

  @override
  Widget build(BuildContext context) {
    final instructorProvider = Provider.of<InstructorProvider>(context);
    final courses = instructorProvider.instructors.map((instructor) => instructor.courseName).toList();

    return Scaffold(
      appBar: AppBar(title: Text("ลงอบรมหลักสูตร")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown for Course Selection
            DropdownButton<String>(
              value: selectedCourse,
              hint: Text("เลือกหลักสูตร"),
              onChanged: (newValue) {
                setState(() {
                  selectedCourse = newValue;
                  if (newValue != null) {
                    final selectedInstructor = instructorProvider.instructors.firstWhere((instructor) => instructor.courseName == newValue);
                    instructorName = selectedInstructor.instructorName;
                    education = selectedInstructor.education;
                    participantsCount = selectedInstructor.participantsCount;
                  }
                });
              },
              items: courses.map<DropdownMenuItem<String>>((String course) {
                return DropdownMenuItem<String>(
                  value: course,
                  child: Text(course),
                );
              }).toList(),
            ),
            
            // รายละเอียดของ Course ที่เลือก
            if (selectedCourse != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ผู้สอน: $instructorName"),
                  Text("จำนวนผู้เข้าร่วม: $participantsCount"),
                  Text("การศึกษา: $education"),
                ],
              ),
            
            SizedBox(height: 20),

            // วันที่และเวลา
            if (registrationDate != null)
              Text("ลงอบรมเมื่อ: ${DateFormat('dd/MM/yyyy HH:mm').format(registrationDate!)}"),
            
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isRegistering ? null : register,
              child: _isRegistering ? CircularProgressIndicator() : Text("ลงอบรม"),
            ),
          ],
        ),
      ),
    );
  }

 void register() async {
  if (_isRegistering || selectedCourse == null) {
    showErrorMessage("กรุณาเลือกหลักสูตรก่อน");
    return;
  }

  setState(() {
    _isRegistering = true;
  });

  try {
    final response = await registerUser(selectedCourse ?? "");

    if (response.success) {
      final provider = Provider.of<InstructorProvider>(context, listen: false);
      provider.registerCourse(selectedCourse!); // อัพเดตสถานะการลงทะเบียนของหลักสูตร

      setState(() {
        registrationDate = DateTime.now();
      });

      showSuccessMessage("ลงอบรมสำเร็จ!");
      Navigator.pushReplacementNamed(context, '/courses'); // ไปยังหน้า CoursesPage
    } else {
      showErrorMessage(response.message);
    }
  } catch (e) {
    showErrorMessage("เกิดข้อผิดพลาด: $e");
  } finally {
    setState(() {
      _isRegistering = false;
    });
  }
}

  Future<Response> registerUser(String courseName) async {
    await Future.delayed(Duration(seconds: 2)); // จำลองการเรียก API
    return Response(success: true, message: "Success");
  }

  void showSuccessMessage(String message) {
    print(message); // แสดงผลเป็นข้อความแจ้งเตือน
  }

  void showErrorMessage(String message) {
    print(message); // แสดงผลเป็นข้อความแจ้งเตือนข้อผิดพลาด
  }
}

class Response {
  final bool success;
  final String message;
  Response({required this.success, required this.message});
}