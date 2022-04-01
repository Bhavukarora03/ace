import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../../Constants/Constants.dart';
import '../../Modals/ShopModal.dart';
import 'Cloth_quantity.dart';

class FoodDetail extends StatelessWidget {
  final Food? food;
  FoodDetail({this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        color: kBackground,
        child: Column(
          children: [
            Text(
              food!.name!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconText(
                  Icons.access_time_outlined,
                  Colors.blue,
                  food!.waitTIme!,
                ),
                _buildIconText(
                  Icons.star_outlined,
                  Colors.amber,
                  food!.score!.toString(),
                ),
                _buildIconText(
                  Icons.local_fire_department_outlined,
                  Colors.red,
                  food!.cal!,
                ),
              ],
            ),
            SizedBox(
              height: 39,
            ),
            FoodQuantity(food: food),
            SizedBox(
              height: 39,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Sizes Available',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                height: 80,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Text(
                                food!.ingredients[index],
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                    separatorBuilder: (_, index) => SizedBox(
                          width: 5,
                        ),
                    itemCount: food!.ingredients.length),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'About',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                food!.about!,
                style: TextStyle(fontSize: 16, wordSpacing: 1.2, height: 1.5),
              ),
            ),
            SizedBox(height: 20),
          ],
        ));
  }

  _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
