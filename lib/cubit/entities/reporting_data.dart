class ReportingData {
  final String classReporting;
  final String imageUrl;
  final bool isUnlocked;
  final String routeName;

  ReportingData({
    required this.classReporting,
    required this.imageUrl,
    required this.isUnlocked,
    this.routeName = '',
  });
}

final List<ReportingData> reportingData = [
  ReportingData(
    classReporting: '1A',
    imageUrl: 'assets/images/reporting1.png',
    routeName: '/reportingdetail',
    isUnlocked: true,
  ),
  ReportingData(
    classReporting: '1B',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: '2A',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: '2B',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: '3A',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: '3B',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: '4A',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: '4B',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: '5A',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: '5B',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: '6A',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: '6B',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
];
