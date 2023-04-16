class LessonSelector {
  final String day;
  final String logoUrl;
  final String routeName;
  final bool isUnlocked;

  LessonSelector({
    required this.day,
    required this.logoUrl,
    this.routeName = '',
    required this.isUnlocked,
  });
}

final List<LessonSelector> allLessonSelector = [
  LessonSelector(
    day: 'Lesson 1',
    logoUrl: 'assets/images/lesson.png',
    routeName: '/course_done',
    isUnlocked: true,
  ),
  LessonSelector(
    day: 'Lesson 2',
    logoUrl: 'assets/images/lesson.png',
    isUnlocked: true,
  ),
  LessonSelector(
    day: 'Lesson 3',
    logoUrl: 'assets/images/lesson.png',
    isUnlocked: true,
  ),
  LessonSelector(
    day: 'Lesson 4',
    logoUrl: 'assets/images/lesson.png',
    routeName: '/course_initial',
    isUnlocked: true,
  ),
  LessonSelector(
    day: 'Lesson 5',
    logoUrl: 'assets/images/lesson.png',
    isUnlocked: true,
  ),
  LessonSelector(
    day: 'Lesson 6',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  LessonSelector(
    day: 'Lesson 7',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  LessonSelector(
    day: 'Lesson 8',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  LessonSelector(
    day: 'Lesson 9',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  LessonSelector(
    day: 'Lesson 10',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  LessonSelector(
    day: 'Lesson 11',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  LessonSelector(
    day: 'Lesson 12',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  LessonSelector(
    day: 'Lesson 13',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  LessonSelector(
    day: 'Lesson 14',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
  LessonSelector(
    day: 'Lesson 15',
    logoUrl: 'assets/images/building.png',
    isUnlocked: false,
  ),
];
