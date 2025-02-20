// course_detail_page.dart
import 'package:flutter/material.dart';
import 'model/instructor.dart';

class Cybersecurity extends StatelessWidget {
  final Instructor course;

  const Cybersecurity({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.courseName),
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course Name: ${course.courseName}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Instructor: ${course.instructorName}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 6),
            Text(
              'Education: ${course.education}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              'Participants: ${course.participantsCount}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Course Content:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // คุณสามารถเพิ่มเนื้อหาหลักสูตรที่ต้องการได้ที่นี่
            Text(
              'รายละเอียดคอร์สเพิ่มเติม...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
