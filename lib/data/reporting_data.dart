class ReportingData {
  final String classReporting;
  final String numberReporting;
  final String imageUrl;
  final bool isUnlocked;
  final String routeName;

  ReportingData({
    required this.classReporting,
    required this.numberReporting,
    required this.imageUrl,
    required this.isUnlocked,
    this.routeName = '',
  });
}

final List<ReportingData> reportingData = [
  ReportingData(
    classReporting: 'A',
    numberReporting: '1',
    imageUrl: 'assets/images/reporting1.png',
    routeName: '/reportingdetail',
    isUnlocked: true,
  ),
  ReportingData(
    classReporting: 'B',
    numberReporting: '1',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: 'A',
    numberReporting: '2',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: 'B',
    numberReporting: '2',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),


  ReportingData(
    classReporting: 'A',
    numberReporting: '3',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: 'B',
    numberReporting: '3',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: 'A',
    numberReporting: '4',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: 'B',
    numberReporting: '4',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: 'A',
    numberReporting: '5',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: 'B',
    numberReporting: '5',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: 'A',
    numberReporting: '6',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
  ReportingData(
    classReporting: 'B',
    numberReporting: '6',
    imageUrl: 'assets/images/reporting2.png',
    isUnlocked: false,
  ),
];
