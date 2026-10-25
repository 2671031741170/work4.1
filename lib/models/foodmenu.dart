enum FoodType {
  tum(ty: "ต้ม"),
  yang(ty: "ย่าง"),
  thot(ty: "ทอด"),
  op(ty: "อบ"),
  heak(ty: "สุขภาพ");

  const FoodType({required this.ty});
  final String ty;
}

enum Foodpic {
  menu1(namefood: "สุกี้", image: "assets/images/1.png"),
  menu2(namefood: "สลัดผักรวม", image: "assets/images/2.png"),
  menu3(namefood: "สเต็กหมู", image: "assets/images/3.png"),
  menu4(namefood: "สเต็กเนื้อ", image: "assets/images/4.png"),
  menu5(namefood: "แฮมเบอร์เกอร์", image: "assets/images/5.png"),
  menu6(namefood: "พิษซ่า", image: "assets/images/6.png"),
  menu7(namefood: "ก๋วยเตี๋ยว", image: "assets/images/7.png");

  const Foodpic({required this.namefood, required this.image});
  final String namefood;
  final String image;
}

class FoodMenu {
  String name;
  String component;
  int price;
  FoodType foodType;
  Foodpic foodpic;

  FoodMenu({
    required this.name,
    required this.component,
    required this.price,
    required this.foodType,
    required this.foodpic,
  });
}