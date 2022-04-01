class Food {
  String? imgUrl;
  String? desc;
  String? name;
  String? waitTIme;
  num? score;
  String? cal;
  num? price;
  num? quantity;
  List<String> ingredients;
  String? about;
  bool highLight;
  Food(
      {this.imgUrl,
        this.desc,
        this.name,
        this.waitTIme,
        this.score,
        this.cal,
        this.price,
        this.quantity,
        required this.ingredients,
        this.about,
        this.highLight = false});
  static List<Food> generateRecommendFoods() {
    return [
      Food(
        imgUrl: 'assets/images/sample2.png',
        desc: 'No1. in sales',
        name: 'ACE Hoddie',
        waitTIme: '50min',
        score: 4.8,
        cal: '',
        price: 499,
        quantity: 1,
        ingredients: [
          'S', 'M', 'L', 'XL', 'XXL'
        ],
        about:
        "This is The ACE Store's Grey Melange Oversized T-Shirt. Crafted from cotton, "
            " this oversized t-shirt for men is your go-to choice for every casual occasion as "
            "it keeps you at ease through every season.",
        highLight: true,
      ),
      Food(
        imgUrl: 'assets/images/sample3.png',
        desc: 'No1. in sales',
        name: 'HACKVSIT MERCH',
        waitTIme: '50min',
        score: 4.8,
        cal: '',
        price: 499,
        quantity: 1,
        ingredients: ['S', 'M', 'L', 'XL', 'XXL'
        ],
        about:
        ' A vibrant Thai sausage made with ground chicken, plus its spicy chile dip, from Chef Parnass Savang of Atlanta\'s Talat Market.',
        highLight: false,
      ),
      Food(
        imgUrl: 'assets/images/sample1.png',
        desc: 'No1. in sales',
        name: 'TECHDAY MERCH',
        waitTIme: '50min',
        score: 4.8,
        cal: '',
        price: 299,
        quantity: 1,
        ingredients: [
          'S', 'M', 'L', 'XL', 'XXL'
        ],
        about:
        'A ratatouille is, by its very definition, a combination of vegetables fried and then simmered in a tomato sauce.',
        highLight: false,
      )
    ];
  }

  static List<Food>? generatePopularFood() {
    return [
      Food(
          imgUrl: 'assets/images/dish4.png',
          desc: 'Most Popular',
          name: 'Tomato Chicken',
          waitTIme: '50min',
          score: 4.8,
          cal: '325 Kcal',
          price: 12,
          quantity: 1,
          ingredients: [
            'S','M', 'L', 'XL', 'XXL'
          ],
          about:
          'Tomato Chicken Curry (Tamatar Murgh) is an Indian chicken curry cooked with lots of fresh tomatoes and mild spices. It goes very well with Indian bread or steamed rice.',
          highLight: false),
      Food(
          imgUrl: 'assets/images/dish1.png',
          desc: 'Most Popular',
          name: 'Soba Soup',
          waitTIme: '50min',
          score: 4.8,
          cal: '325 Kcal',
          price: 12,
          quantity: 1,
          ingredients: [
            'S', 'M', 'L', 'XL', 'XXL'
          ],
          about:
          'Soba Noodle Soup, or Toshikoshi Soba, symbolizes good luck in the new year and is traditionally eaten by the Japanese on the 31st of December.',
          highLight: false),
    ];
  }
}
