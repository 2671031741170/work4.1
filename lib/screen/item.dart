import 'package:flutter/material.dart';
import '../models/foodmenu.dart';

class Item extends StatefulWidget {
  final List<FoodMenu> emp;
  const Item({super.key, required this.emp});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.emp.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ชื่ออาหาร: ${widget.emp[index].name}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text("ส่วนประกอบ: ${widget.emp[index].component}"),
                    Text("ราคา: ${widget.emp[index].price} บาท"),
                    Text("ประเภท: ${widget.emp[index].foodType.ty}"),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}