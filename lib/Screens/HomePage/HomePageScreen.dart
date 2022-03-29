import 'package:ace/Controller/AuthController.dart';

import 'package:ace/Screens/Profile/ProfileScreen.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:video_player/video_player.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';

import 'package:google_fonts/google_fonts.dart';

import '../Navigation/bottomNavigation.dart';

final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final VideoPlayerController videoPlayerController;

  @override
  void initState() {
    videoPlayerController =
        VideoPlayerController.asset('assets/videos/ACE_hack.mp4')
          ..addListener(() {
            setState(() {});
          })
          ..setLooping(true)
          ..initialize().then((_) => videoPlayerController);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

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
  int _counter = 0;
  bool isOpened = false;
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
''',
    '''
Get Into
ACE
''',
    '''
Get Into
ACE
'''
  ];

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  final List<String> _cardTitle = ['Learn GIT', 'Upcoming Hack'];

  final List<String> _svgString = [
    "assets/icons/.svg",
    "assets/icons/.svg",
    "assets/icons/.svg",
    "assets/icons/.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return SideMenu(
        key: _endSideMenuKey,
        type: SideMenuType.slideNRotate,
        menu: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: buildMenu(),
        ),
        onChange: (_isOpened) {
          setState(() => isOpened = _isOpened);
        },
        child: SideMenu(
            key: _sideMenuKey,
            menu: buildMenu(),
            type: SideMenuType.slideNRotate,
            onChange: (_isOpened) {
              setState(() => isOpened = _isOpened);
            },
            child: IgnorePointer(
              ignoring: isOpened,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  leading: IconButton(
                      onPressed: () => toggleMenu(true),
                      icon: Icon(Icons.menu)),
                  toolbarHeight: 80,
                  backgroundColor: Colors.black,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(45)),
                  ),
                ),


                body: CustomScrollView(
                  slivers: [
                    _header(),
                    _videoCard(),
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
              ),
            )));
  }

  Widget _videoCard() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          videoPlayerController != null
              ? GestureDetector(
                  dragStartBehavior: DragStartBehavior.start,
                  onTap: () {
                    setState(() {
                      videoPlayerController.value.isPlaying
                          ? videoPlayerController.pause()
                          : videoPlayerController.play();
                    });
                  },
                  child: Container(
                    height: 250,
                    width: 600,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    margin:
                        const EdgeInsets.only(left: 22, right: 22, bottom: 22),
                    child: AspectRatio(
                      aspectRatio: videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(videoPlayerController),
                    ),
                  ),
                )
              : CircularProgressIndicator()
        ],
      ),
    );
  }

  Widget _recommendedCards(Color gradient1, Color gradient2) {
    return Container(
      height: 185,
      width: 339,
      margin: const EdgeInsets.only(left: 22, bottom: 25, top: 22),
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
              // child: SvgPicture.asset(
              //   'assets/pics/Vector.svg',
              //   width: 339,
              // ),
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
              children: [
                Text(
                  _cardTitle[0],
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
                  "New Ace Hour is Live!",
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
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
              _recommendedCards(
                  const Color(0xff441DFC), const Color(0xff4E81EB)),
              _recommendedCards(
                  const Color(0xffFC67A7), const Color(0xffF6815B)),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _recentGrid() {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 22, right: 22),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 18,
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
                const Positioned(
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(30),
                    ),
                    // child: SvgPicture.asset(
                    //   'assets/pics/VectorSmallTop.svg',
                    //   width: 164,
                    // ),
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(30),
                    ),

                    // child: SvgPicture.asset(
                    //   'assets/pics/VectorSmallBottom.svg',
                    //   width: 164,
                    // ),
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
                // Positioned(
                //   left: 25,
                //   bottom: 20,
                //   //child: SvgPicture.asset(_svgString[index]),
                // ),
              ],
            ),
          );
        }, childCount: 4),
      ),
    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GFAvatar(
                  radius: 40,
                  backgroundImage: controller.googleSignUser.value != null
                      ? Image.network(
                              controller.googleSignUser.value?.photoUrl ?? '')
                          .image
                      : AssetImage('assets/images/profileavatar.webp'),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Hello, Bhavuk",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
            title: const Text("Home"),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.verified_user,
                size: 20.0, color: Colors.white),
            title: const Text("Profile"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.monetization_on,
                size: 20.0, color: Colors.white),
            title: const Text("Wallet"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.shopping_cart,
                size: 20.0, color: Colors.white),
            title: const Text("Cart"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.star_border, size: 20.0, color: Colors.white),
            title: const Text("Favorites"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.settings, size: 20.0, color: Colors.white),
            title: const Text("Settings"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
// Widget _draweritems(){
//   return Drawer(
//     elevation: 0,
//     child: Column(
//       children: <Widget>[
//         const SizedBox(
//           height: 30,
//         ),
//         DrawerHeader(
//             child: GFAvatar(
//           radius: 100,
//           backgroundImage: controller.googleSignUser.value != null
//               ? Image.network(controller.googleSignUser.value?.photoUrl ?? '')
//                   .image
//               : AssetImage('assets/images/profileavatar.webp'),
//         )),
//         const SizedBox(
//           height: 20,
//         ),
//         GestureDetector(
//           onTap: () {
//             Get.to(() => ProfileScreen());
//           },
//           child: Text(
//             'Profile',
//             style: GoogleFonts.catamaran(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         const SizedBox(
//           height: 45,
//         ),
//         GestureDetector(
//           onTap: () {},
//           child: Text(
//             'Settings',
//             style: GoogleFonts.catamaran(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         const SizedBox(
//           height: 45,
//         ),
//         Text(
//           'About',
//           style: GoogleFonts.catamaran(
//             fontSize: 18,
//             fontWeight: FontWeight.w700,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(
//           height: 45,
//         ),
//         GestureDetector(
//           onTap: () {
//             controller.GoogleSignoutMethod();
//           },
//           child: Text(
//             'Log Out',
//             style: GoogleFonts.catamaran(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ],
//     ),
//   );
// }
