import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:movie_com/Login.dart';

class Registation extends StatefulWidget {
  const Registation({super.key});

  @override
  State<Registation> createState() => _RegistationState();
}

class _RegistationState extends State<Registation> {
  final formGlobalKey = GlobalKey <FormState>();

  final name = TextEditingController();
  final phone = TextEditingController();
  final _email = TextEditingController();
  final pass = TextEditingController();
  final conpass = TextEditingController();
  final add = TextEditingController();
  Future<void> register(nam, phone, email, pas, conpas, address) async {
    if (name.text.length <=0 && _email.text.length <=0 &&
        pass.text.length <=0 && conpass.text.length <=0 &&
        add.text.length <=0) {
     Get.snackbar(
         backgroundGradient: LinearGradient(colors: [
           Colors.blueAccent,
           Colors.white,
           Colors.blueAccent,]),


         "Registation Failed ", "Please Fill Your Detail Carefully.",colorText: Colors.white);
    }
    else {
      try {
        // Send GET request to the API with query parameters
        final response = await http.get(
          Uri.parse(
              'http://www.paji.store/WebService1.asmx/Registation?&Name=$nam&Phone=$phone&Email=$email&Password=$pas&Conformpass=$conpas&Address=$address'),
        );


        if (response.statusCode == 200) {
        Get.to(
            login());
        Get.snackbar(
            backgroundGradient: LinearGradient(colors: [
              Colors.blueAccent,
              Colors.white,
              Colors.blueAccent,]),
            colorText: Colors.white,

            "Register Successfully","Fill Up Yours Login Details ");
        }
        else {
        Get.snackbar(
            backgroundGradient: LinearGradient(colors: [
              Colors.blueAccent,
              Colors.white,
              Colors.blueAccent,]),

            "Invalid Id or Password", "Check Your Given Information");
        }
      } catch (e) {
        // Error occurred during the API call
        print('Error: $e');
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: formGlobalKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
          child:
          Container(
            height: MediaQuery.of(context).size.height*1,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(
                    "https://e0.pxfuel.com/wallpapers/653/834/desktop-wallpaper-red-border-amoled-black.jpg"),
                    fit: BoxFit.cover)
            ),
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Image.asset("images/MyMovie.png",fit: BoxFit.cover, height: 150,),
                  TextFormField(
                    controller: name,
                    style: TextStyle(color: Colors.white),
                    // Add your text form field properties
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
                      labelText: 'Name',

                      labelStyle: TextStyle(
                          fontSize: 13.0, color: Colors.red.shade100,
                      ),
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.red.shade100,
                      ),


                    ),
                  ),
                  SizedBox(height: 18,),
                  TextFormField(
                    controller: _email,
                    style: TextStyle(color: Colors.white),
                    // Add your text form field properties
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
                          fontSize: 13.0,color: Colors.red.shade100,
                      ),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.red.shade100,
                      ),


                    ),
                  ),
                  SizedBox(height: 18,),
                  TextFormField(
                    maxLength: 6,
                    cursorColor: Colors.redAccent,
                    controller: pass,
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    // Add your text form field properties
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
                      labelText: 'Password',

                      labelStyle: TextStyle(
                          fontSize: 13.0,color: Colors.red.shade100,
                      ),
                      prefixIcon: Icon(
                        Icons.password_rounded,
                        color: Colors.red.shade100,
                      ),


                    ),
                  ),
                  TextFormField(
                    maxLength: 6,
                    controller: conpass,
                    style: TextStyle(color: Colors.white),

                    obscureText: true,
                    // Add your text form field properties
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
                      labelText: 'Conform Password',

                      labelStyle: TextStyle(
                          fontSize: 13.0, color: Colors.red.shade100,
                      ),
                      prefixIcon: Icon(
                        Icons.verified,
                        color: Colors.red.shade100,
                      ),
                    ),
                  ),
                  TextFormField(
                    maxLength: 10,
                    controller: phone,
                    style: TextStyle(color: Colors.white),
                    // Add your text form field properties
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
                      labelText: 'Phone Number',

                      labelStyle: TextStyle(
                          fontSize: 13.0,color: Colors.red.shade100,
                      ),
                      prefixIcon: Icon(
                        Icons.phone_iphone,
                        color: Colors.red.shade100,
                      ),


                    ),
                  ),
                  TextFormField(

                    controller: add,
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
                      labelText: 'Address',
                      labelStyle: TextStyle(
                          fontSize: 13.0, color: Colors.red.shade100,
                      ),
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: Colors.red.shade100,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: () {
                      register(name.text, phone.text, _email.text, pass.text,
                          conpass.text, add.text);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white),
                          gradient: LinearGradient(colors: [
                            Colors.white,
                            Colors.red.shade100
                          ])

                      ),
                      height: 50, width: 250,
                      child: Center(child: Text('REGISTATION',
                        style: TextStyle(fontSize: 20, color: Colors.black87),)),
                    ),),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
