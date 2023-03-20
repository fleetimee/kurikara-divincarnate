class FollowersData {
  final String nameFollower;
  final String pointFollower;
  final String imageUrl;

  FollowersData({
    required this.nameFollower,
    required this.pointFollower,
    required this.imageUrl,
  });
}

final List<FollowersData> followersData = [
  FollowersData(
    nameFollower: 'Bluesky',
    pointFollower: '1234',
    imageUrl: 'assets/images/reporting1.png',
  ),
  FollowersData(
    nameFollower: 'Berry Benka',
    pointFollower: '5678',
    imageUrl: 'assets/images/reporting1.png',
  ),
];