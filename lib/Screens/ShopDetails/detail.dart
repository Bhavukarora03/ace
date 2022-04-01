import 'package:ace/Screens/ShopDetails/widget/Cloth_detail.dart';
import 'package:ace/Screens/ShopDetails/widget/Cloth_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants/Constants.dart';
import '../CustomAppBar/CustomAppBar.dart';
import '../Modals/ShopModal.dart';

class DetailPage extends StatelessWidget {
  final Food food;
  const DetailPage({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: kPrimaryColor,

        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
      ),
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(


          children: [
           
            FoodImg(
              food: food,
            ),
            FoodDetail(
              food: food,
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 100,
        height: 56,
        child: RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.white30,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
                size: 30,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Text(
                  food.quantity!.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
     floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
