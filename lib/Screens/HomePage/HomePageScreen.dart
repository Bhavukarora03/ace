import 'package:ace/Controller/AuthController.dart';
import 'package:ace/Screens/News/News.dart';
import 'package:ace/Screens/Profile/ProfileScreen.dart';
import 'package:ace/Screens/Shop/Shop.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/intro_screen/gf_intro_screen_bottom_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ace/Screens/Navigation/bottomNavigation.dart';


import '../Navigation/bottomNavigation.dart';

GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthController controller = Get.put(AuthController());






  String headlinesHeads = 'Latest';

  static const _headlines = <String>[
    "Latest",
    "Trending",
    "New To you",
    "Tech News",
    "apple",
    "Flutter Jobs"
  ];
  final List<String> _title = [
    '''
Upcoming
Events
''',
    '''
ACE Magazine
''',
    '''
Hack
VSIT

''',
    '''
Get Into
ACE
'''
  ];

  final List<String> _cardTitle = ['Upcoming Projects', 'Upcoming Hack'];

  final List<String> _svgString = [
    "assets/icons/.svg",
    "assets/icons/.svg",
    "assets/icons/.svg",
    "assets/icons/.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: const Radius.circular(45)),
        ),
      ),
      key: scaffolKey,

      drawer: _DrawerBar(),
      drawerDragStartBehavior: DragStartBehavior.start,
      drawerEdgeDragWidth: 30,
      body:

      CustomScrollView(

        slivers: [
          _header(),
          _recommendation(),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16, left: 22),
              child: const Text(
                "Recent",
                style: TextStyle(
                  color: Color(0xff515979),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          _recentGrid(),
        ],
      ),
    );
  }

  Widget _recommendedCards(Color gradient1, Color gradient2) {
    return Container(
      height: 185,
      width: 339,
      margin: const EdgeInsets.only(left: 16, bottom: 25, top: 19),
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(26),
                bottomRight: Radius.circular(26),
              ),
              child: SvgPicture.asset(
                'assets/pics/Vector.svg',
                width: 339,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(26),
                bottomRight: Radius.circular(26),
              ),
              child: SvgPicture.asset(
                'assets/pics/Vector-1.svg',
                width: 339,
              ),
            ),
          ),
          Positioned(
            top: 28,
            left: 28,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Recommend",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "abc",
                  style: TextStyle(
                    color: Color(0xFFC6C3fc),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 25,
            left: 28,
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/headphone.svg',
                  width: 27,
                  height: 27,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(
                  'assets/icons/tape.svg',
                  width: 27,
                  height: 27,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.only(top: 20, left: 22, right: 22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                   "Hey, ${controller.googleSignUser.value?.displayName ?? ''}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'SF Pro Display',
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 2.2,
                      width: 33,
                      decoration: const BoxDecoration(
                        color: Color(0xff4271d3),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/icons/.svg",
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ..._headlines.map(
                  (headlinesHeadsText) => GestureDetector(
                    onTap: () {
                      setState(() {
                        headlinesHeads = headlinesHeadsText;
                      });
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      margin: const EdgeInsets.only(
                        left: 22,
                        right: 16.0,
                        top: 30.0,
                        bottom: 30.0,
                      ),
                      decoration: BoxDecoration(
                        color: headlinesHeads == headlinesHeadsText
                            ? const Color(0xff4A80F0)
                            : Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        headlinesHeadsText,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _recommendation() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 22, right: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _cardTitle[0],
                  style: const TextStyle(
                      color: Color(0xff515979),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  _cardTitle[1],
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _recommendedCards(const Color(0xff441DFC), const Color(0xff4E81EB)),
                _recommendedCards(const Color(0xffFC67A7), const Color(0xffF6815B)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _recentGrid() {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 22, right: 22),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 18,
          childAspectRatio: 155 / 113,
        ),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            margin: index % 2 == 0
                ? const EdgeInsets.only(right: 13)
                : const EdgeInsets.only(left: 13),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(30),
                    ),
                    child: SvgPicture.asset(
                      'assets/pics/VectorSmallTop.svg',
                      width: 164,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(30),
                    ),
                    child: SvgPicture.asset(
                      'assets/pics/VectorSmallBottom.svg',
                      width: 164,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: Text(
                    _title[index],
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  bottom: 20,
                  child: SvgPicture.asset(_svgString[index]),
                ),
              ],
            ),
          );
        }, childCount: 4),
      ),
    );
  }



  Widget _DrawerBar() {
    return Drawer(
      elevation: 0,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          DrawerHeader(
            child: CircleAvatar(
                radius: 60,
              backgroundImage: Image.network(controller.googleSignUser.value?.photoUrl ?? '').image,

          ),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {},
            child:  Text(
              'Profile',
              style: GoogleFonts.catamaran(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Settings',
              style: GoogleFonts.catamaran(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 45,
          ),
           Text(
            'About',
            style: GoogleFonts.catamaran(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 45,
          ),
        Text(
            'Log Out',
            style: GoogleFonts.catamaran(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }

}


