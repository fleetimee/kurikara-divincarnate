class HomeCourse {
  final String courseName;
  final String logoUrl;
  final String routeName;
  final int currentCourse;
  final int totalCourse;
  final bool isUnlocked;

  HomeCourse({
    required this.courseName,
    this.logoUrl = '',
    required this.currentCourse,
    this.routeName = '',
    required this.totalCourse,
    required this.isUnlocked,
  });
}

final List<HomeCourse> allHomeCourse = [
  HomeCourse(
    courseName: '1A',
    logoUrl: 'assets/images/chicken.png',
    currentCourse: 5,
    routeName: '/course_selector',
    totalCourse: 6,
    isUnlocked: true,
  ),
  HomeCourse(
    courseName: '1B',
    logoUrl: 'assets/images/chicken.png',
    currentCourse: 0,
    totalCourse: 8,
    isUnlocked: false,
  ),
  HomeCourse(
    courseName: '1C',
    logoUrl: 'assets/images/chicken.png',
    currentCourse: 0,
    totalCourse: 8,
    isUnlocked: false,
  ),
  HomeCourse(
    courseName: '1D',
    logoUrl: 'assets/images/chicken.png',
    currentCourse: 0,
    totalCourse: 8,
    isUnlocked: false,
  ),
  HomeCourse(
    courseName: '1E',
    logoUrl: 'assets/images/chicken.png',
    currentCourse: 0,
    totalCourse: 8,
    isUnlocked: false,
  ),
  HomeCourse(
    courseName: '1F',
    logoUrl: 'assets/images/chicken.png',
    currentCourse: 0,
    totalCourse: 8,
    isUnlocked: false,
  ),
  HomeCourse(
    courseName: '1G',
    logoUrl: 'assets/images/chicken.png',
    currentCourse: 0,
    totalCourse: 8,
    isUnlocked: false,
  ),
  HomeCourse(
    courseName: '1H',
    logoUrl: 'assets/images/chicken.png',
    currentCourse: 0,
    totalCourse: 8,
    isUnlocked: false,
  ),
  HomeCourse(
    courseName: '1I',
    logoUrl: 'assets/images/chicken.png',
    currentCourse: 0,
    totalCourse: 8,
    isUnlocked: false,
  ),
];
