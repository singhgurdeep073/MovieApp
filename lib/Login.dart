import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie_com/ForgetPassword.dart';
import 'package:movie_com/Homepage.dart';
import 'package:movie_com/ImagePicker.dart';

import 'package:movie_com/NavigationBar.dart';
import 'package:movie_com/main.dart';
import 'package:movie_com/registation.dart';
import 'package:shared_preferences/shared_preferences.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _LOginState();
}

class _LOginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible=false;


  final email = TextEditingController();
  final Pass = TextEditingController();
   void _login() {

     String _email = email.text;
     Navigator.pushReplacement(
       context,
       MaterialPageRoute(
         builder: (context) => homePage(name:_email,),
       ),
     );
   }
  @override
  void initState2() {
    super.initState();
    _loadSavedLoginData();
  }
  void _loadSavedLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email.text = prefs.getString('username') ?? '';
      Pass.text = prefs.getString('password') ?? '';
    });
  }
  void logind(e, p) async {
    try {
      // Send GET request to the API with query parameters
      final response = await http.get(
        Uri.parse('http://www.paji.store/WebService1.asmx/LoginApi?email=$e&password=$p'),
      );
      if(response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        for (var item in jsonList) {
          String massage = item['msg'].toString();
          if(massage=="1")
          {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('username',email.text);
            await prefs.setString('password',Pass.text);
          Get.to(
            homePage(name: email.text),
              transition: Transition.size,

          );
          Get.snackbar(colorText:Colors.white ,
              backgroundGradient: LinearGradient(colors: [
                Colors.blueAccent,
                Colors.white,
                Colors.blueAccent,]),


              "Login Success", "Find Your info");
          }
          else{
            Get.snackbar(
                backgroundGradient: LinearGradient(colors: [
                  Colors.blueAccent,
                  Colors.white,
                  Colors.blueAccent,]),
                colorText:Colors.white ,
                "Invalid Id or Password","Check Your Info");
          }
        }
      }
      else {
        print('Login failed');
      }}
    catch (e) {
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height*1,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://e0.pxfuel.com/wallpapers/653/834/desktop-wallpaper-red-border-amoled-black.jpg"),
                    fit: BoxFit.cover)
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                  children: [
                    Image.asset("images/MyMovie.png",height: MediaQuery.of(context).size.height*.35,),

                    TextFormField(
                      controller: email,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        labelText: 'Gmail',
                        labelStyle: TextStyle(
                            fontSize: 13.0, color: Colors.red.shade100,
                        ),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.red.shade100,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      maxLength: 6,
                      controller: Pass,
                      style: TextStyle(color: Colors.white),
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        labelText: "Password",
                        prefixIcon: Icon(
                          Icons.password_rounded,
                          color: Colors.red.shade100,
                        ),
                        labelStyle: TextStyle(
                            fontSize: 13.0, color: Colors.red.shade100,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,color: Colors.white,),
                          onPressed: () {
                            setState(() {passwordVisible = !passwordVisible;},
                            );
                          },
                        ),
                        alignLabelWithHint: false,

                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 200.0),
                      child: GestureDetector(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context){
                              return Forget();
                            }));},
                          child: Text("Forget Password ",style: TextStyle(fontSize: 15,color: Colors.white),)),
                    ),
                    SizedBox(height: 16.0),
                    GestureDetector(
                      onTap:(){
                          _login();
                        logind(email.text,Pass.text);
                      },
                      child:   Container(

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                            gradient: LinearGradient(colors: [
                              Colors.white,
                              Colors.red.shade100
                            ])

                        ),
                        height: 50,width: 250,
                        child: Center(child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.black87),),),
                      ),),
                    SizedBox(height: 10,),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context){
                            return Registation();
                          }));

                        },
                        child: Text("Create Account ",style: TextStyle(fontSize: 15,color: Colors.white),)),

                  ]
              ),
            ),
          ),
        )        );
  }
}
