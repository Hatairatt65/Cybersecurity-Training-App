class Instructor {
  final String courseName;
  final String instructorName;
  final String education;
  final int participantsCount;
  final bool isRegistered;

  Instructor({
    required this.courseName,
    required this.instructorName,
    required this.education,
    required this.participantsCount,
    required this.isRegistered,
  });

  // ✅ เพิ่มคอนสตรักเตอร์ `empty`
  factory Instructor.empty() {
    return Instructor(
      courseName: '',
      instructorName: '',
      education: '',
      participantsCount: 0,
      isRegistered: false,
    );
  }

  Instructor copyWith({
    String? courseName,
    String? instructorName,
    String? education,
    int? participantsCount,
    bool? isRegistered,
  }) {
    return Instructor(
      courseName: courseName ?? this.courseName,
      instructorName: instructorName ?? this.instructorName,
      education: education ?? this.education,
      participantsCount: participantsCount ?? this.participantsCount,
      isRegistered: isRegistered ?? this.isRegistered,
    );
  }
}
