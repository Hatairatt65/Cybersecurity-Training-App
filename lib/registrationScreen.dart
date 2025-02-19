import 'package:flutter/material.dart';

class Registrationscreen extends StatefulWidget {
  @override
  _RegistrationscreenState createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends State<Registrationscreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController instructorNameController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController participantsCountController = TextEditingController();

  bool _isRegistering = false;

  void register() async {
    if (_isRegistering) return; // ป้องกันการกดซ้ำ
    setState(() {
      _isRegistering = true;
    });

    try {
      final response = await registerUser(
        emailController.text,
        passwordController.text,
        instructorNameController.text, // เพิ่ม instructorName
        educationController.text, // เพิ่ม education
        int.tryParse(participantsCountController.text) ?? 0, // เพิ่ม participantsCount
      );

      if (response.success) {
        showSuccessMessage("ลงทะเบียนสำเร็จ!");
        Navigator.pushReplacementNamed(context, '/dashboard');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ลงทะเบียน")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            TextField(controller: instructorNameController, decoration: InputDecoration(labelText: "ชื่อผู้สอน")),
            TextField(controller: educationController, decoration: InputDecoration(labelText: "การศึกษา")),
            TextField(controller: participantsCountController, decoration: InputDecoration(labelText: "จำนวนผู้เข้าร่วม"), keyboardType: TextInputType.number),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isRegistering ? null : register,
              child: _isRegistering ? CircularProgressIndicator() : Text("ลงทะเบียน"),
            ),
          ],
        ),
      ),
    );
  }
}

// ฟังก์ชันสมมุติสำหรับการลงทะเบียน
Future<Response> registerUser(String email, String password, String instructorName, String education, int participantsCount) async {
  await Future.delayed(Duration(seconds: 2)); // จำลองการเรียก API
  return Response(success: true, message: "Success");
}

void showSuccessMessage(String message) {
  print(message); // แสดงผลเป็นข้อความแจ้งเตือน
}

void showErrorMessage(String message) {
  print(message); // แสดงผลเป็นข้อความแจ้งเตือนข้อผิดพลาด
}

class Response {
  final bool success;
  final String message;
  Response({required this.success, required this.message});
}
