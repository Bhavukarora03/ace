import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ace/Constants/Constants.dart';

import '../../Modals/Items.dart';



class FoodList extends StatelessWidget {
  final int? selected;
  final Function? callback;
  final Restaurant? restaurant;
  const FoodList({
    Key? key,
    this.selected,
    this.callback,
    this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catagory = restaurant!.menu.keys.toList();
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 30),
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => callback!(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: selected == index ? kPrimaryColor : Colors.white,
              ),
              child: Text(catagory[index],
                  style: TextStyle(
                      color:
                      selected == index ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          separatorBuilder: (_, index) =>  SizedBox(
            width: 20,
          ),
          itemCount: catagory.length),
    );
  }
}
