import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_com/Homepage.dart';
import 'package:movie_com/Login.dart';


import 'package:get/get.dart';

class Splesh_Screen extends StatefulWidget {
  const Splesh_Screen({super.key});

  @override
  State<Splesh_Screen> createState() => _Splesh_ScreenState();
}

class _Splesh_ScreenState extends State<Splesh_Screen> {
  @override
  void initState() {
    super.initState();
   Timer(Duration(seconds: 5), () {

     Get.to(fullscreenDialog: true,duration: Duration(seconds: 1),
       transition:Transition.size,
      const login()

     );
   });

  }
  Widget build(BuildContext context) {
    return Scaffold(


        body:  Center(
          child: Container(
            height:MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://e0.pxfuel.com/wallpapers/653/834/desktop-wallpaper-red-border-amoled-black.jpg"),fit: BoxFit.cover)
            ),
            child: Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.10),
              child: Column(children:[

                Image.asset("images/MyMovie.png",height:MediaQuery.of(context).size.height*0.50,),
                Image.network("https://media.tenor.com/oqJo9GcbfjYAAAAi/welcome-images-server.gif",height:MediaQuery.of(context).size.height*.10,width: MediaQuery.of(context).size.width*.50,fit: BoxFit.cover,),
              ]),
            ),
          ),
        )
    );
  }
}
