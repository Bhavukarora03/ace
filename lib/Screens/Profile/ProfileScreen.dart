import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      slivers: [

      ],

    );
  }
}

Widget _ProfileListView(){

  return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, Index){
    return Container();
  }
  );
}