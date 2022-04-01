import 'ShopModal.dart';

class Restaurant {
  String name;
  String waitTime;
  String distance;
  String label;
  String logoUrl;
  String desc;
  num score;
  Map<String, List<Food>> menu;
  Restaurant({
    required this.name,
    required this.waitTime,
    required this.distance,
    required this.label,
    required this.logoUrl,
    required this.desc,
    required this.score,
    required this.menu,
  });

  static Restaurant generateRestaurant() {
    return Restaurant(
        name: 'SHOP ACE !',
        waitTime: "Get it Next Day",
        distance: '2.4km',
        label: 'Quality Assured',
        logoUrl: 'assets/images/acelogo.png',
        desc: 'Get all your Merch here!',
        score: 4.7,
        menu: {
          'Trending': Food.generateRecommendFoods(),
          'Latest Collection': Food.generatePopularFood()!,
          'Accessories': [],
          'Hoddies': [],
        });
  }
}
