import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../models/planet_lists.dart';
import '../../utils/color.dart';

class Detail_Page extends StatefulWidget {
  const Detail_Page({Key? key}) : super(key: key);

  @override
  State<Detail_Page> createState() => _Detail_PageState();
}

class _Detail_PageState extends State<Detail_Page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int? index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/back.png",),
         fit: BoxFit.cover
          )
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
              children: [
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(Planet.planetList[index]['name'], style: const TextStyle(fontSize: 20),),
      ),
      SizedBox(
          height: 500,
          child: Hero(
            tag: Planet.planetList[index]['file'],
            child: ModelViewer(
              src: Planet.planetList[index]['file'],
              autoRotate: true,
            ),
          ),
      ),
      const SizedBox(height: 30),
      Container(
          padding: const EdgeInsets.all(20),
          width: width,
          decoration: BoxDecoration(
            color: MyColors.bgContainer.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              const Text("Description", style: TextStyle(fontSize: 20),),
              const SizedBox(height: 5),
              Text(Planet.planetList[index]['des'], style: TextStyle(fontSize: 16, color: MyColors.grey),),
            ],
          ),
      ),
    ]
          ),
        )
    )
    );
  }
}
