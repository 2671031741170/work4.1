enum FriendImg {
  img1(image: "assets/images/8.png"),
  img2(image: "assets/images/9.png"),
  img3(image: "assets/images/10.png"),
  img4(image: "assets/images/11.png");

  const FriendImg({required this.image});
  final String image;
}

class FriendData {
  FriendData({
    required this.name,
    required this.nickname,
    required this.age,
    required this.hometown,
    required this.food,
    required this.activity,
    required this.image,
  });

  String name;
  String nickname;
  int age;
  String hometown;
  String food;
  String activity;
  FriendImg image;
}