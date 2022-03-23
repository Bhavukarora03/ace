import 'package:flutter/material.dart';
import 'package:ace/Constants/Constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../CustomAppBar/CustomAppBar.dart';
import '../Modals/Items.dart';
import 'Widgets/item_list.dart';
import 'Widgets/shop_info.dart';
import 'Widgets/shop_lis_view.dart';

class ShopMerch extends StatefulWidget {
  const ShopMerch({Key? key}) : super(key: key);

  @override
  State<ShopMerch> createState() => _ShopMerchState();
}

class _ShopMerchState extends State<ShopMerch> {
  var selected = 0;
  final pageController = PageController();
  final restaurant = Restaurant.generateRestaurant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        elevation: 5,
        backgroundColor: Colors.black,

      ),
      backgroundColor: kBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          RestaurantInfo(),
          FoodList(
            selected: selected,
            restaurant: restaurant,
            callback: (int index) {
              setState(() {
                selected = index;
              });
              pageController.jumpToPage(index);
            },
          ),
          Expanded(
              child: FoodListView(
                selected: selected,
                callback: (int index) {
                  setState(() {
                    selected = index;
                  });
                },
                pageController: pageController,
                restaurant: restaurant,
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 60,
            child: SmoothPageIndicator(
              controller: pageController,
              count: restaurant.menu.length,
              effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                  width: 8,
                  height: 8,
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                activeDotDecoration: DotDecoration(
                  width: 10,
                  height: 10,
                  color: kBackground,
                  borderRadius: BorderRadius.circular(10),
                  dotBorder: DotBorder(
                    color: kPrimaryColor,
                    padding: 2,
                    width: 2,
                  ),
                ),
              ),
              onDotClicked: (index) => pageController.jumpToPage(index),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 2,
        backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
