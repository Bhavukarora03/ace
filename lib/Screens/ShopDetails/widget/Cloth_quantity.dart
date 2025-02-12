import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../../../Constants/Constants.dart';
import '../../Modals/ShopModal.dart';


class FoodQuantity extends StatelessWidget {
  final Food? food;
  const FoodQuantity({
    Key? key,
    this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: 40,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(-0.3, 0),
              child: Container(
                height: double.maxFinite,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '\₹',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    food!.price!.toString(),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
            Align(
              alignment: Alignment(0.1, 0),
              child: Container(
                height: double.maxFinite,
                width: 130,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: (){

                    }, icon: LineIcon(LineIcons.minus, color: Colors.white,size: 20,)),


                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Text(
                        food!.quantity!.toString(),
                      ),
                    ),

                    IconButton(onPressed: (){}, icon: Icon(Icons.add, color: Colors.white, size: 20,)),
                    ],
                ),
              ),
            ),
          ],
        ));
  }
}
