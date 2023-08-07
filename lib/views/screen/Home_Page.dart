import 'package:animator_planet/models/planet_lists.dart';
import 'package:animator_planet/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:animation_list/animation_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back.png"),
              fit: BoxFit.cover,
            ),
          ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 20),
            child: Text("Galaxy Planets",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ),
            Expanded(
                child: AnimationList(
                  duration: 4000,
                  reBounceDepth: 0,
                  physics: BouncingScrollPhysics(),
                  children: Planet.planetList.map((e) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, 'detail',arguments: Planet.planetList.indexOf(e));
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 150,
                        width: w,
                        decoration: BoxDecoration(
                          color: MyColors.bgContainer.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Row(
                          children: [
                            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              width: 100,
                              child: Hero(
                                tag: e['file'],
                                child: ModelViewer(
                                    src: "https://modelviewer.dev/shared-assets/models/Astronaut.glb",
                                  autoRotate: true,
                                ),
                              ),
                            ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(e['name'],style: GoogleFonts.akshar(fontSize: 20,color: MyColors.white),),
                                Text(e['type'], style: TextStyle(fontSize: 16, color: MyColors.grey),),
                                Text(e['radius'], style: TextStyle(fontSize: 16, color: MyColors.grey),),
                                Text(e['year'], style: TextStyle(fontSize: 16, color: MyColors.grey),),

                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                )
            )
          ],
        ),
        ),

    );
  }
}
