import 'package:flutter/material.dart';
import '../models/foodmenu.dart';
import 'item.dart';
import '../main.dart';

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _component = '';
  int _price = 0;
  FoodType _foodType = FoodType.tum;
  Foodpic _foodpic = Foodpic.menu1;

  List<FoodMenu> emp = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เพิ่มข้อมูล"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          // ✅ เพิ่ม SingleChildScrollView ตามภาพ
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "ชื่ออาหาร",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณาป้อนชื่ออาหาร";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),

                TextFormField(
                  maxLength: 100,
                  decoration: const InputDecoration(
                    label: Text(
                      "ส่วนประกอบสำคัญ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณาป้อนส่วนประกอบสำคัญ";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _component = value!;
                  },
                ),

                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text(
                      "ราคา",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onSaved: (value) {
                    _price = int.parse(value.toString());
                  },
                ),

                // Dropdown ชนิดอาหาร
                DropdownButtonFormField(
                  value: _foodType,
                  decoration: const InputDecoration(
                    label: Text(
                      "ชนิดอาหาร",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  items: FoodType.values.map((key) {
                    return DropdownMenuItem(
                      value: key,
                      child: Text(key.ty),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _foodType = value!;
                    });
                  },
                ),

                // Dropdown เลือกรูปภาพ มีชื่อ + รูป
                DropdownButtonFormField(
                  value: _foodpic,
                  decoration: const InputDecoration(
                    label: Text(
                      "เลือกรูปภาพ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  items: Foodpic.values.map((pic) {
                    return DropdownMenuItem(
                      value: pic,
                      child: Row(
                        children: [
                          Text(pic.namefood),
                          const SizedBox(width: 10),
                          Image.asset(
                            pic.image,
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _foodpic = value!;
                    });
                  },
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: 100,
                  height: 80,
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.amber,
                    ),
                    onPressed: () {},
                  ),
                ),

                const SizedBox(height: 20),

                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      setState(() {
                        emp.add(FoodMenu(
                          name: _name,
                          component: _component,
                          price: _price,
                          foodType: _foodType,
                          foodpic: _foodpic,
                        ));
                      });

                      _formKey.currentState!.reset();

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyApp(),
                        ),
                      );

                      print(emp.length);
                    }
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    "บันทึก",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}