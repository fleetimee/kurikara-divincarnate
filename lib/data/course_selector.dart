class CourseSelector {
  final String day;
  final String logoUrl;
  final String routeName;
  final bool isUnlocked;

  CourseSelector({
    required this.day,
    required this.logoUrl,
    this.routeName = '',
    required this.isUnlocked,
  });
}

final List<CourseSelector> allCourseSelector = [
  CourseSelector(
    day: 'Day 1',
    logoUrl: 'assets/images/chicken.png',
    isUnlocked: true,
  ),
  CourseSelector(
    day: 'Day 2',
    logoUrl: 'assets/images/books.png',
    isUnlocked: true,
  ),
  CourseSelector(
    day: 'Day 3',
    logoUrl: 'assets/images/car.png',
    isUnlocked: true,
  ),
  CourseSelector(
    day: 'Day 4',
    logoUrl: 'assets/images/tree.png',
    routeName: '/course_initial',
    isUnlocked: true,
  ),
  CourseSelector(
    day: 'Day 5',
    logoUrl: 'assets/images/building.png',
    isUnlocked: true,
  ),
  CourseSelector(
    day: 'Day 6',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  CourseSelector(
    day: 'Day 7',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  CourseSelector(
    day: 'Day 8',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  CourseSelector(
    day: 'Day 9',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  CourseSelector(
    day: 'Day 10',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  CourseSelector(
    day: 'Day 11',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  CourseSelector(
    day: 'Day 12',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  CourseSelector(
    day: 'Day 13',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  CourseSelector(
    day: 'Day 14',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  CourseSelector(
    day: 'Day 15',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
];
