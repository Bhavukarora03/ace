import 'package:ace/Screens/Shop/Widgets/shop_items.dart';
import 'package:flutter/material.dart';
import 'package:ace/Constants/Constants.dart';

import '../../Modals/Items.dart';

class FoodListView extends StatelessWidget {
  final int? selected;
  final Function? callback;
  final PageController? pageController;
  final Restaurant? restaurant;
  const FoodListView({
    Key? key,
    this.selected,
    this.callback,
    this.pageController,
    this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = restaurant!.menu.keys.toList();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback!(index),
        children: category
            .map((e) => ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {

              },
              child: FoodItem(
                food: restaurant!.menu[category[selected!]]![index],
              ),
            ),
            separatorBuilder: (_, index) => SizedBox(
              height: 15,
            ),
            itemCount: restaurant!.menu[category[selected!]]!.length))
            .toList(),
      ),
    );
  }
}
