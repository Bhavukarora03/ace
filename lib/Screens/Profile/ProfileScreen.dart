import 'package:ace/Controller/AuthController.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final ProfileController = Get.put(AuthController());

  void launchInstaUrl() async {
    if (!await launch(InstaUrl))
      throw 'Could not launch ${InstaUrl} ';
  }
  void launchLinkedinUrl() async {
    if (!await launch(LinkedUrl ))
      throw 'Could not launch ${LinkedUrl} ';
  }
  void launchTwitterUrl() async {
    if (!await launch(TwitterUrl ))
      throw 'Could not launch ${TwitterUrl}' ;
  }
  void launchFacebookUrl() async {
    if (!await launch( faceBookUrl ))
      throw 'Could not launch ${ faceBookUrl }';
  }
  void launchGithubUrll() async {
    if (!await launch( github))
      throw 'Could not launch ${github} ';
  }
  void launchInstUrl() async {
    if (!await launch(InstaUrl + LinkedUrl + TwitterUrl + faceBookUrl + github))
      throw 'Could not launch ${InstaUrl + LinkedUrl + TwitterUrl + faceBookUrl + github} ';
  }

  String InstaUrl = 'https://www.instagram.com/acevips/';
  String LinkedUrl = 'https://www.linkedin.com/company/vipsace/mycompany/';
  String TwitterUrl = 'https://twitter.com/VIPS_ACE';
  String faceBookUrl = 'https://www.facebook.com/vipsace';
  String github = 'https://github.com/ace-vsit';

  List<IconButton> leadingIcons = [
    IconButton(onPressed: () {}, icon: Icon(Icons.contact_support_outlined)),
    IconButton(onPressed: () {}, icon: Icon(Icons.contact_support_outlined)),
    IconButton(onPressed: () {}, icon: Icon(Icons.contact_support_outlined)),
    IconButton(onPressed: () {}, icon: Icon(Icons.contact_support_outlined)),
  ];
  List<String?> Subtitle = [
    'More abouyt us',
    'DM us your query',
    'Get in touch with the core',
    'Yes, You heard that right'
  ];
  List<String?> title = [
    'About Us',
    'Contact Us',
    'Want to get in',
    'Host your own Ace hour'
  ];

  List<Function> listTiletap = [() {}, () {}, () {}, () {}];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(child: Container()),
                Expanded(
                  flex: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        color: Colors.white),
                    child: Container(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: GFAvatar(
                                radius: 50,
                                backgroundImage: ProfileController.googleSignUser.value != null
                                    ? Image.network(ProfileController.googleSignUser.value?.photoUrl ?? '')
                                    .image
                                    : AssetImage('assets/images/profileavatar.webp'),
                              ),
                        ),
                        Text(
                          "Hey, ${ProfileController.googleSignUser.value?.displayName ?? ''}",
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
                        Expanded(
                          child: ListView.builder(
                            itemCount: title.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: ListTile(
                                  minLeadingWidth: 5,
                                  dense: true,
                                  leading: leadingIcons[index],
                                  textColor: Colors.black,
                                  title: Text(title[index] ?? ''),
                                  subtitle: Text(Subtitle[index] ?? ""),
                                  onTap: () {
                                    listTiletap[index];
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Divider(indent: 40,
                                  endIndent: 20,)
                              ),

                              Text("Find Us", style: TextStyle(fontSize: 14)),

                              Expanded(
                                  child: Divider(
                                    indent: 20,
                                    endIndent: 40,
                                  )
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                            padding:  EdgeInsets.only(bottom: 80),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                SignInButton.mini(
                                    buttonType: ButtonType.instagram,
                                    onPressed: () {
                                      launchInstaUrl();
                                    }),
                                SignInButton.mini(
                                    buttonType: ButtonType.linkedin,
                                    onPressed: () {
                                     launchLinkedinUrl();
                                    }),

                                SignInButton.mini(
                                    buttonType: ButtonType.twitter,
                                    onPressed: () {
                                      launchTwitterUrl();
                                    }),
                                SignInButton.mini(
                                    buttonType: ButtonType.githubDark,
                                    onPressed: () {
                                     launchGithubUrll();
                                    })
                              ],
                            ),
                            )
                          ],
                        )
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
