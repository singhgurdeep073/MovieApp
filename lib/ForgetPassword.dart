import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_com/Login.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';



class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  final _form = GlobalKey<FormState>();
  bool passwordVisible=false;
  final email = TextEditingController();
  final Pass = TextEditingController();
  void logind(e, p) async {
    try {
      // Send GET request to the API with query parameters
      final response = await http.get(
        Uri.parse('http://www.paji.store/WebService1.asmx/NewPass?email=$e&pass=$p'),
      );
      if(response.statusCode == 200) {

        print(response.body);
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
          key: _form,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://e0.pxfuel.com/wallpapers/653/834/desktop-wallpaper-red-border-amoled-black.jpg"),
                    fit: BoxFit.cover)
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                  children: [
                    Image.asset("images/MyMovie.png",height: 250,),
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
                        labelText: "New Password",
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
                    SizedBox(height: 16.0),
                    GestureDetector(
                      onTap:(){
                       Get.to(login());
                       logind(email.text,Pass.text);
                       Get.snackbar(
                           backgroundGradient: LinearGradient(colors: [
                             Colors.blueAccent,
                             Colors.white,
                             Colors.blueAccent,]),
                             colorText: Colors.white,
                           "Password Update","You Can Login Now");
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
                        child: Center(child: Text('Submit',style: TextStyle(fontSize: 20,color: Colors.black87),),),
                      ),),
                    SizedBox(height: 10,),

                  ]
              ),
            ),
          ),
        )        );
  }
}
