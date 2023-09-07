import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      GestureDetector(
        onTap: (){

          Get.bottomSheet(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue,
                child: Wrap(
                    children:[
                      ListTile(
                        title: Icon(Icons.light_mode,color: Colors.white,),
                        leading: Text('Dark Theme'),
                        onTap: (){
                          Get.changeTheme(ThemeData.dark());
                        },
                      ),
                      ListTile(
                        title: Icon(Icons.lightbulb_circle_rounded,color: Colors.white,),
                        leading: Text('Light Theme'),
                        onTap: (){
                          Get.changeTheme(ThemeData.light());
                        },
                      ),
                    ] ),
              ),
            ),
          );
        },child: Center(child: Text("Bottom")),

      ),
    );
  }
}
