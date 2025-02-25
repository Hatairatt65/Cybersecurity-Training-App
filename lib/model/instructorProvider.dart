import 'package:flutter/foundation.dart';
import 'instructor.dart';
import 'package:flutter/material.dart';

class InstructorProvider with ChangeNotifier {
  List<Instructor> _instructors = [
  Instructor(courseName: 'Cybersecurity 101', instructorName: 'จอห์น โด', education: 'ปริญญาโทด้านความปลอดภัยทางไซเบอร์', participantsCount: 25, isRegistered: false),
  Instructor(courseName: 'Network Security', instructorName: 'อลิซ บราวน์', education: 'ปริญญาตรีด้านเทคโนโลยีสารสนเทศ', participantsCount: 15, isRegistered: false),
  Instructor(courseName: 'Ethical Hacking', instructorName: 'ไมค์ จอห์นสัน', education: 'ปริญญาโทด้านความปลอดภัยทางไอที', participantsCount: 40, isRegistered: false),
  Instructor(courseName: 'Penetration Testing', instructorName: 'เดวิด ลี', education: 'ปริญญาตรีด้านความปลอดภัยทางไซเบอร์', participantsCount: 20, isRegistered: false),
  Instructor(courseName: 'Cloud Security', instructorName: 'ซาร่า วิลเลียมส์', education: 'ปริญญาเอกด้าน Cloud Computing Security', participantsCount: 30, isRegistered: false),
  Instructor(courseName: 'Digital Forensics', instructorName: 'แมทธิว เทย์เลอร์', education: 'ปริญญาตรีด้าน Computer Science', participantsCount: 22, isRegistered: false),
  Instructor(courseName: 'Cryptography Basics', instructorName: 'โซเฟีย โรดริเกซ', education: 'ปริญญาโทด้าน Cybersecurity', participantsCount: 18, isRegistered: false),
  Instructor(courseName: 'IoT Security', instructorName: 'เจมส์ สมิธ', education: 'ปริญญาเอกด้าน Embedded Systems', participantsCount: 12, isRegistered: false),
  Instructor(courseName: 'Advanced Malware Analysis', instructorName: 'เอมิลี่ คลาร์ก', education: 'ปริญญาโทด้าน Reverse Engineering', participantsCount: 27, isRegistered: false),
  Instructor(courseName: 'AI in Cybersecurity', instructorName: 'โรเบิร์ต มิลเลอร์', education: 'ปริญญาตรีด้าน Artificial Intelligence', participantsCount: 35, isRegistered: false),
  Instructor(courseName: 'Cyber Threat Intelligence', instructorName: 'เควิน โรบินสัน', education: 'ปริญญาโทด้าน Cyber Threat Analysis', participantsCount: 21, isRegistered: false),
  Instructor(courseName: 'Incident Response', instructorName: 'ลินดา วอล์คเกอร์', education: 'ปริญญาโทด้าน Cyber Defense', participantsCount: 28, isRegistered: false),
  Instructor(courseName: 'Secure Coding Practices', instructorName: 'แดเนียล อีแวนส์', education: 'ปริญญาตรีด้าน Software Engineering', participantsCount: 19, isRegistered: false),
  Instructor(courseName: 'Blockchain Security', instructorName: 'วิคตอเรีย อดัมส์', education: 'ปริญญาเอกด้าน Blockchain Technology', participantsCount: 16, isRegistered: false),
  Instructor(courseName: 'Mobile App Security', instructorName: 'นิโคลัส เทรซี่', education: 'ปริญญาโทด้าน Mobile Security', participantsCount: 24, isRegistered: false),
];


  List<Instructor> get instructors => _instructors;

  void addInstructor(Instructor instructor) {
    _instructors.add(instructor);
    notifyListeners();
  }
  

  void registerCourse(String courseName) {
    // ยกเลิกคอร์สเดิมก่อนลงคอร์สใหม่
    final oldCourseIndex = _instructors.indexWhere((instructor) => instructor.isRegistered);
    if (oldCourseIndex != -1) {
      _instructors[oldCourseIndex] = _instructors[oldCourseIndex].copyWith(isRegistered: false);
    }

    // ลงทะเบียนคอร์สใหม่
    final newCourseIndex = _instructors.indexWhere((instructor) => instructor.courseName == courseName);
    if (newCourseIndex != -1) {
      _instructors[newCourseIndex] = _instructors[newCourseIndex].copyWith(isRegistered: true);
      notifyListeners();
    }
  }

  void cancelRegistration(Instructor instructor) {
    final index = _instructors.indexWhere((i) => i.courseName == instructor.courseName);
    if (index != -1) {
      _instructors[index] = _instructors[index].copyWith(isRegistered: false);
      notifyListeners();
    }
  }

  void refreshData() {
    notifyListeners();
  }
}
