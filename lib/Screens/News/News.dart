
import 'package:ace/Controller/AuthController.dart';
import 'package:ace/Strings_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:shimmer/shimmer.dart';

class NewsView extends StatefulWidget {
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> with TickerProviderStateMixin {
  final projectsController = Get.put(AuthController());

  String? img = '';
  String? title = '';
  String content = '';
  String upperTag = '';
  String? madeBy = "";

  @override
  void initState() {
    super.initState();
    projectsController.projectsRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() => projectsController.isLoadingData.value
          ? Shimmer.fromColors(
              baseColor: Colors.black87,
              highlightColor: Colors.blueGrey,
              child: WidgetlistView())
          : WidgetlistView()),
    );
  }
  Widget WidgetlistView() {
    return ListView.builder(
      itemCount: projectsController.projects_list?.card?.length,
      itemBuilder: (BuildContext context, int index) {
        try {
          img = projectsController.projects_list!.card![index].images;
        } catch (e) {}
        try {
          title = projectsController.projects_list!.card![index].title;
        } catch (e) {}
        try {
          madeBy = projectsController.projects_list!.card![index].madeby;
        } catch (e) {}

        try {
          content = projectsController.projects_list!.card![index].content!;
        } catch (e) {}
        try {
          upperTag = projectsController.projects_list!.card![index].tools!;
        } catch (e) {}

        return Padding(
          padding: EdgeInsets.all(25),
          child: SlimyCard(
            color: Slimycolors[index % Slimycolors.length],
            width: 400,
            topCardHeight: 200,
            bottomCardHeight: 400,
            borderRadius: 12,
            topCardWidget: _widget01(),
            bottomCardWidget: _widget02(),
            slimeEnabled: true,
          ),
        );
      },
    );
  }
  Widget _widget01() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,
            image: DecorationImage(
                image: NetworkImage(img!),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.white12.withOpacity(0.8), BlendMode.dstATop)),
          ),
        ),
        Positioned(
            left: -20,
            top: -10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                  shape: BoxShape.rectangle),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  title!,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )),
      ],
    );
  }
  Widget _widget02() {
    return SingleChildScrollView(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Text(
              content,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
                shape: BoxShape.rectangle),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                upperTag,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
