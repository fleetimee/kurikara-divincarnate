class Stats {
  final String title;
  final String value;
  final String imageUrl;

  Stats({
    required this.title,
    required this.value,
    required this.imageUrl,
  });
}

class Education {
  final String title;
  final String value;
  final String imageUrl;
  final double percentage;

  Education({
    required this.title,
    required this.value,
    required this.imageUrl,
    required this.percentage,
  });
}

final List<Stats> allStats = [
  Stats(
    title: 'Activity',
    value: '13',
    imageUrl: 'assets/images/heart_bigger.png',
  ),
  Stats(
    title: 'Total XP',
    value: '4',
    imageUrl: 'assets/images/crown_bigger.png',
  ),
];

final List<Education> allEducations = [
  Education(
    title: 'Reading',
    value: '80/100',
    imageUrl: 'assets/images/book-stack1.png',
    percentage: 0.8,
  ),
  Education(
    title: 'Speaking',
    value: '60/100',
    imageUrl: 'assets/images/podcast-2.png',
    percentage: 0.6,
  ),
];
