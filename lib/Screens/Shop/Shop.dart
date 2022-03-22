import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:lottie/lottie.dart';

class ShopMerch extends StatefulWidget {
  const ShopMerch({Key? key}) : super(key: key);

  @override
  State<ShopMerch> createState() => _ShopMerchState();
}

class _ShopMerchState extends State<ShopMerch> {


  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Shop ACE'),
        toolbarHeight: 70,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Icon(Icons.shopping_cart,color: Colors.grey,size: 30,),
      ),


        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GFCarousel(
              items: imageList.map(
                (url) {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          child: Image.network(url,
                              fit: BoxFit.cover, width: 1000.0),
                        ),
                      ),
                    ],
                  );
                },
              ).toList(),
              onPageChanged: (index) {
                setState(() {
                  index;
                });
              },
            )
          ],
        ),
      ],
    ));
  }
}
