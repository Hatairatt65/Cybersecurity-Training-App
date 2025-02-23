import 'package:flutter/foundation.dart';
import 'instructor.dart';
import 'package:flutter/material.dart';

class InstructorProvider with ChangeNotifier {
  List<Instructor> _instructors = [
    Instructor(courseName: 'Cybersecurity 101', instructorName: 'จอห์น โด', education: 'ปริญญาโทด้านความปลอดภัยทางไซเบอร์', participantsCount: 25, isRegistered: false),
    Instructor(courseName: 'Network Security', instructorName: 'อลิซ บราวน์', education: 'ปริญญาตรีด้านเทคโนโลยีสารสนเทศ', participantsCount: 15, isRegistered: false),
    Instructor(courseName: 'Ethical Hacking', instructorName: 'ไมค์ จอห์นสัน', education: 'ปริญญาโทด้านความปลอดภัยทางไอที', participantsCount: 40, isRegistered: false),
    Instructor(courseName: 'Penetration Testing', instructorName: 'เดวิด ลี', education: 'ปริญญาตรีด้านความปลอดภัยทางไซเบอร์', participantsCount: 20, isRegistered: false),
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
