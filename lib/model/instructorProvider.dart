// instructorProvider.dart
import 'package:flutter/foundation.dart';
import 'instructor.dart';
import 'package:flutter/material.dart';

class InstructorProvider with ChangeNotifier {
  List<Instructor> _instructors = [
    Instructor(courseName: 'Cybersecurity 101', instructorName: 'จอห์น โด', education: 'ปริญญาโทด้านความปลอดภัยทางไซเบอร์', participantsCount: 25),
    Instructor(courseName: 'Advanced Cybersecurity', instructorName: 'เจน สมิธ', education: 'ปริญญาเอกด้านความปลอดภัยข้อมูล', participantsCount: 30),
    Instructor(courseName: 'Network Security', instructorName: 'อลิซ บราวน์', education: 'ปริญญาตรีด้านเทคโนโลยีสารสนเทศ', participantsCount: 15),
    Instructor(courseName: 'Ethical Hacking', instructorName: 'ไมค์ จอห์นสัน', education: 'ปริญญาโทด้านความปลอดภัยทางไอที', participantsCount: 40),
    Instructor(courseName: 'Penetration Testing', instructorName: 'เดวิด ลี', education: 'ปริญญาตรีด้านความปลอดภัยทางไซเบอร์', participantsCount: 20),
    ];

  List<Instructor> get instructors => _instructors;

  void addInstructor(Instructor instructor) {
    _instructors.add(instructor);
    notifyListeners();
  }
  void registerCourse(String courseName) {
    final instructor = _instructors.firstWhere((instructor) => instructor.courseName == courseName);
    instructor.isRegistered = true;
    notifyListeners();
  }
  void cancelRegistration(Instructor instructor) {
    // ตรวจสอบว่า instructor อยู่ในรายการหรือไม่
    if (_instructors.contains(instructor)) {
      // ทำการยกเลิกการลงทะเบียน
      instructor.isRegistered = false;
      notifyListeners(); // อัพเดต UI หลังจากยกเลิก
    }
  }
}
