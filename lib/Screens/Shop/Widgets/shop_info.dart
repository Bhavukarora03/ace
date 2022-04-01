import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:ace/Constants/Constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Modals/Items.dart';

class RestaurantInfo extends StatelessWidget {
  final restaurant = Restaurant.generateRestaurant();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style:
                      GoogleFonts.catamaran(fontSize: 35, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              restaurant.waitTime,
                              style: TextStyle(color: Colors.white),
                            )),


                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          restaurant.label,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.withOpacity(0.6),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                ClipRRect(

                  child: Image.asset(
                    restaurant.logoUrl,
                    width: 80,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),

          ],
        ));
  }
}
