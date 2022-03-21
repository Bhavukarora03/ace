// import 'package:ace/Screens/Authentication/AuthenticationScreen.dart';
// import 'package:concentric_transition/concentric_transition.dart';
// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
//
// class Home extends StatelessWidget {
//   Home({Key? key}) : super(key: key);
//
//   final data = [
//     CardPlanetData(
//       title: "We Are ACE",
//       subtitle: "The Technical Society of VSIT",
//       image: const AssetImage("assets/images/acelogo.png"),
//       backgroundColor: Colors.pink,
//       titleColor: Colors.white,
//       subtitleColor: Colors.white,
//       background: Text(''),
//     ),
//     CardPlanetData(
//       title: "We Build Stuff",
//       subtitle: "",
//       image: const AssetImage("assets/images/acelogo.png"),
//       backgroundColor: Colors.black,
//       titleColor: Colors.pink,
//       subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
//       background: Text(''),
//     ),
//     CardPlanetData(
//       title: "Lets Get you Signed in",
//       subtitle: "Shall we?",
//       image: const AssetImage("assets/images/acelogo.png"),
//       backgroundColor: Colors.lightBlue,
//       titleColor: Colors.white,
//       subtitleColor: Colors.white,
//       background: Container(),
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ConcentricPageView(
//         colors: data.map((e) => e.backgroundColor).toList(),
//         itemCount: data.length,
//         verticalPosition: 0.7,
//         radius: 30,
//         curve: Curves.easeInOutQuad,
//
//         direction: Axis.vertical,
//         //  physics: NeverScrollableScrollPhysics(),
//         onFinish: () {
//           Get.off(() => AuthenticationScreen());
//         },
//         itemBuilder: (int index, double value) {
//           return CardPlanet(data: data[index]);
//         },
//       ),
//     );
//   }
// }
//
// class CardPlanetData {
//   final String title;
//   final String subtitle;
//   final ImageProvider image;
//   final Color backgroundColor;
//   final Color titleColor;
//   final Color subtitleColor;
//   final Widget? background;
//
//   CardPlanetData({
//     required this.title,
//     required this.subtitle,
//     required this.image,
//     required this.backgroundColor,
//     required this.titleColor,
//     required this.subtitleColor,
//     this.background,
//   });
// }
//
// class CardPlanet extends StatelessWidget {
//   const CardPlanet({
//     required this.data,
//     Key? key,
//   }) : super(key: key);
//
//   final CardPlanetData data;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         if (data.background != null) data.background!,
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 100),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Spacer(flex: 3),
//               Flexible(
//                 flex: 20,
//                 child: Image(
//                   image: data.image,
//                   height: 100,
//                   width: 100,
//                 ),
//               ),
//               const Spacer(flex: 1),
//               Text(
//                 data.title.toUpperCase(),
//                 style: TextStyle(
//                   color: data.titleColor,
//                   fontSize: 25,
//                   fontWeight: FontWeight.w800,
//                   letterSpacing: 3,
//                 ),
//                 maxLines: 1,
//               ),
//               const Spacer(flex: 1),
//               Text(
//                 data.subtitle,
//                 style: TextStyle(
//                   color: data.subtitleColor,
//                   fontSize: 22,
//                 ),
//                 textAlign: TextAlign.center,
//                 maxLines: 2,
//               ),
//               const Spacer(flex: 10),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
