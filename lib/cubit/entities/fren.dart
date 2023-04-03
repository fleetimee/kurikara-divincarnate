class MyFriend {
  final String name;
  final String imageUrl;
  final String xp;

  MyFriend({
    required this.name,
    required this.imageUrl,
    required this.xp,
  });
}

final List<MyFriend> allMyFren = [
  MyFriend(
    name: 'Miko',
    imageUrl: 'assets/images/miko.jpg',
    xp: '4367',
  ),
  MyFriend(
    name: 'Gura',
    imageUrl: 'assets/images/gura.jpg',
    xp: '4367',
  ),
  MyFriend(
    name: 'Pikamee',
    imageUrl: 'assets/images/pikamee.jpg',
    xp: '4367',
  ),
];
