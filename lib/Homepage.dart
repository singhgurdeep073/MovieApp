import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_com/ImagePicker.dart';

class homePage extends StatefulWidget {
  final String name;
  const homePage({super.key,required this.name});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 200,

        shape: BeveledRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(95)),
            side: BorderSide(strokeAlign: Checkbox.width,
               style:BorderStyle.solid)),

        child:  ListView(
          children: <Widget>[
            Container(height: MediaQuery.of(context).size.width*.40,width:MediaQuery.of(context).size.width*1,
decoration: BoxDecoration(
  image: DecorationImage(image: AssetImage("images/MyMovie.png"))
),
              child: Column(
                children: [
                  Spacer(),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(widget.name)
                          ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),

            new ListTile(

              title: new Text(
                'Profile & Security',
                style: TextStyle(
                  fontSize: 16.0,


                ),
              ),
              onTap: () {
                Get.bottomSheet(
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                      ),

                      child: Wrap(
                          children:[
                            ListTile(
                            leading: Icon(Icons.light_mode,color: Colors.white,),
                           title: Text('Dark Theme'),
                              onTap: (){
                                Get.changeTheme(ThemeData.dark());
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.lightbulb_circle_rounded,color: Colors.white,),
                              title: Text('Light Theme'),
                              onTap: (){
                                Get.changeTheme(ThemeData.light());
                              },
                            ),
                          ] ),
                    ),
                  ),
                );

              },
              leading:  Icon(
                Icons.person,
                size: 26.0,

              ),
            ),
            ListTile(
              title: new Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 16.0,

                ),
              ),
              onTap: () {
Get.to(Profile_Pic());
              },
              leading: new Icon(
                Icons.notifications,
                size: 26.0,

              ),
            ),
            new ListTile(
              title: new Text(
                'Favorites',
                style: TextStyle(
                  fontSize: 16.0,

                ),
              ),
              onTap: () {

                Navigator.pop(context);
              },
              leading: new Icon(
                Icons.favorite,
                size: 26.0,

              ),
            ),
            new Divider(
        thickness: 1,
            ),
            new ListTile(
              title: new Text(
                'About WelakaOne',
                style: TextStyle(
                  fontSize: 16.0,

                ),
              ),
              onTap: () {

              },
              leading: new Icon(
                Icons.info_outline,
                size: 26.0,

              ),
            ),
            new Divider(
           thickness: 1,
            ),
            new ListTile(

              title: new Text(
                'Close Menu',
                style: TextStyle(
                  fontSize: 16.0,

                ),
              ),
              onTap: () {

                Navigator.pop(context);
              },
              leading: new Icon(
                Icons.close,
                size: 26.0,

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                color: Colors.black87,
                child: ListTile(
                  onTap: () {

                  },
                  title:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      new Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      new Icon(
                        Icons.logout,
                        size: 26.0,
                        color: Colors.white,
                      ),

                    ],),
                ),),)],),
      ),
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
