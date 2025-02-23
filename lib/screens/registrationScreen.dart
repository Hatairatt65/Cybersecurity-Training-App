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
    final courses = instructorProvider.instructors
        .map((instructor) => instructor.courseName)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("ลงอบรมหลักสูตร"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "เลือกหลักสูตรเพื่อการพัฒนา",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 30),

                // การ์ดหลักสูตร
                Card(
                  elevation: 12, // เพิ่มเงาที่นุ่มนวล
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // มุมโค้งมนมากขึ้น
                  ),
                  color: Colors.white,
                  shadowColor: Colors.black.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "เลือกหลักสูตร:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 12),
                        DropdownButton<String>(
                          value: selectedCourse,
                          hint: Text("เลือกหลักสูตร",
                              style: TextStyle(color: Colors.grey)),
                          onChanged: (newValue) {
                            setState(() {
                              selectedCourse = newValue;
                              if (newValue != null) {
                                final selectedInstructor = instructorProvider
                                    .instructors
                                    .firstWhere((instructor) =>
                                        instructor.courseName == newValue);
                                instructorName =
                                    selectedInstructor.instructorName;
                                education = selectedInstructor.education;
                                participantsCount =
                                    selectedInstructor.participantsCount;
                              }
                            });
                          },
                          items: courses
                              .map<DropdownMenuItem<String>>((String course) {
                            return DropdownMenuItem<String>(
                              value: course,
                              child:
                                  Text(course, style: TextStyle(fontSize: 16)),
                            );
                          }).toList(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                          isExpanded: true,
                          dropdownColor: Colors.blueGrey.shade50,
                        ),

                        // ข้อมูลหลักสูตร
                        if (selectedCourse != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("👩‍🏫 ผู้สอน: $instructorName",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                                SizedBox(height: 8),
                                Text(
                                    "🧑‍🤝‍🧑 จำนวนผู้เข้าร่วม: $participantsCount",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                                SizedBox(height: 8),
                                Text("🎓 การศึกษา: $education",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                // วันที่ลงอบรม
                if (registrationDate != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "⏰ ลงอบรมเมื่อ: ${DateFormat('dd/MM/yyyy HH:mm').format(registrationDate!)}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey),
                    ),
                  ),

                SizedBox(height: 50),

                // ปุ่มลงอบรม
                ElevatedButton(
                  onPressed: _isRegistering ? null : register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey, // ใช้สีเทาอมฟ้า
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 12, // ความเงาของปุ่ม
                    shadowColor: Colors.blueGrey.withOpacity(0.2),
                  ),
                  child: _isRegistering
                      ? CircularProgressIndicator(color: Colors.white)
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.school,
                                color: Colors.white,
                                size: 28), // เปลี่ยนไอคอนเป็น send
                            SizedBox(width: 10),
                            Text(
                              "ลงอบรม",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
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
        final provider =
            Provider.of<InstructorProvider>(context, listen: false);
        provider.registerCourse(selectedCourse!);

        setState(() {
          registrationDate = DateTime.now();
        });

        showSuccessMessage("ลงอบรมสำเร็จ! 🎉");
        Navigator.pushReplacementNamed(context, '/courses');
      } else {
        showErrorMessage(response.message);
      }
    } catch (e) {
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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message, style: TextStyle(color: Colors.green))));
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message, style: TextStyle(color: Colors.red))));
  }
}

class Response {
  final bool success;
  final String message;
  Response({required this.success, required this.message});
}
