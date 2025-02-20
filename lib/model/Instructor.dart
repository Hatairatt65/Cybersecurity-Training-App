class Instructor {
  final String courseName;
  final String instructorName;
  final String education;
  final int participantsCount;
  bool isRegistered;

  Instructor({
    required this.courseName,
    required this.instructorName,
    required this.education,
    required this.participantsCount,
    this.isRegistered = false,
  });
}
