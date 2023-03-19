class ActiveStudents {
  final String studentName;
  final String imageUrl;

  ActiveStudents({
    required this.studentName,
    required this.imageUrl,
  });
}

final List<ActiveStudents> studentsData = [
  ActiveStudents(
    studentName: 'Pekora',
    imageUrl: 'assets/images/pekora.jpg',
  ),
  ActiveStudents(
    studentName: 'Gura',
    imageUrl: 'assets/images/gura.jpg',
  ),
  ActiveStudents(
    studentName: 'Kobo',
    imageUrl: 'assets/images/kobo.jpg',
  ),
  ActiveStudents(
    studentName: 'Miko',
    imageUrl: 'assets/images/miko.jpg',
  ),
  ActiveStudents(
    studentName: 'Pikamee',
    imageUrl: 'assets/images/pikamee.jpg',
  ),
];
