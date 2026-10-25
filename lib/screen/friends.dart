import 'package:flutter/material.dart';
import '../models/friendsdata.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  List<FriendData> friends = [
    FriendData(
      name: "สมชาย ปาร์ค",
      nickname: "ต้น",
      age: 20,
      hometown: "กรุงเทพฯ",
      food: "ส้มตำ,ไก่ย่าง",
      activity: "เล่นเกมส์,ดูหนัง",
      image: FriendImg.img1,
    ),
    FriendData(
      name: "โอเว่น หลอน",
      nickname: "โอเว่น",
      age: 20,
      hometown: "ชลบุรี",
      food: "ต้มยำกุ้ง",
      activity: "ฟังเพลง,ท่องเที่ยว",
      image: FriendImg.img2,
    ),
    FriendData(
      name: "นา ชัยเผือก",
      nickname: "นา",
      age: 21,
      hometown: "สมุทรปราการ",
      food: "ชาบูหม้อไฟ",
      activity: "ทานของหวาน,ดูแลสัตว์เลี้ยง",
      image: FriendImg.img3,
    ),
    FriendData(
      name: "ปิยะศรี แสนแดน",
      nickname: "โบว์",
      age: 22,
      hometown: "ขอนแก่น",
      food: "ไก่ย่างเขาสวนกวาง",
      activity: "อ่านหนังสือ,เขียนนิยาย",
      image: FriendImg.img4,
    ),
  ];

  Color getBgColor(int index) {
    List<Color> colors = [
      Colors.lightBlue.shade50,
      Colors.pink.shade50,
      Colors.green.shade50,
      Colors.yellow.shade50,
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ ไม่มี AppBar ที่นี่แล้วครับ
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: getBgColor(index),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ชื่อ-นามสกุล: ${friends[index].name}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("ชื่อเล่น: ${friends[index].nickname}"),
                      Text("อายุ: ${friends[index].age} ปี"),
                      Text("บ้านเกิด: ${friends[index].hometown}"),
                      Text("อาหารที่ชอบ: ${friends[index].food}"),
                      Text("กิจกรรมที่ชอบ: ${friends[index].activity}"),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  friends[index].image.image,
                  width: 70,
                  height: 70,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}