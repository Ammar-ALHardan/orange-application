import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_ui/components/round_btn.dart';
import 'package:login_ui/components/text_input_field.dart';

import 'package:login_ui/constants/theme_data.dart';
import 'package:login_ui/constants/globals.dart' as globals;
import 'package:http/http.dart' as http;

import 'home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  api(context) async {
   String email = emailcontroller.text;
   String password = passwordcontroller.text;
   var url = "https://herobus.000webhostapp.com/orange_api/login.php";
   var body = {"email":email , "password":password};
   var response =await http.post(Uri.parse(url),body: body);
   var data = json.decode(response.body);
   if(data["Token"] != null){
     Navigator.push(context, MaterialPageRoute(builder: (context){return HomePage();} ),);
     print(data);
   }
  
  } 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: primaryColorC,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: 10.0,
                ),
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 30, color: textColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 50, right: 5, top: 35),
                        child: Text(
                          'Full Name',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 13,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                      child: Column(
                        children: [
                          CustomTextInput(
                            1,
                            'Enter your name',
                            false,
                            Icons.person,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 50, right: 5, top: 15),
                        child: Text(
                          'Phone No',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 13,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                      child: CustomTextInput(
                        2,
                        'Enter your Phone No',
                        false,
                        Icons.phone,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 50, right: 5, top: 15),
                        child: Text(
                          'Email',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 13,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                      child: Column(
                        children: [
                          CustomTextInput(
                            3,
                            'Enter your Email',
                            false,
                            Icons.mail,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 50, right: 5, top: 15),
                        child: Text(
                          'Password',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 13,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                      child: Column(
                        children: [
                          CustomTextInput(
                            4,
                            'Enter your password',
                            true,
                            Icons.vpn_key,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 50, right: 5, top: 15),
                        child: Text(
                          'Confirm Password',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 13,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                      child: Column(
                        children: [
                          CustomTextInput(
                            5,
                            'Confirm password',
                            true,
                            Icons.vpn_key,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18),
                      child: CustomButton(2, 'Sign Up'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account?  ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 13,
                              color: textColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                context,
                              );
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 15,
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
