import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_ui/components/round_btn.dart';
import 'package:login_ui/components/text_input_field.dart';
import 'package:login_ui/constants/theme_data.dart';
import 'package:login_ui/constants/globals.dart' as globals;
import 'package:login_ui/screens/home.dart';
import 'package:login_ui/screens/sign_up_screen.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  api(context) async {
    String email = emailcontroller.text;
    String password = passwordcontroller.text;
    var url = "https://herobus.000webhostapp.com/orange_api/login.php";
    var body = {"email": email, "password": password};
    var response = await http.post(Uri.parse(url), body: body);
    var data = json.decode(response.body);
    if (data["Token"] != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return HomePage();
        }),
      );
      print(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.orangeAccent,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: 0.0,
              ),
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Sign In',
                    style: TextStyle(fontSize: 30, color: textColor),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 5, top: 40),
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
                        //  CustomTextInput(

                        //   3,
                        //   'Enter email here',
                        //   false,
                        //   Icons.person,
                        // ),

                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.person , color: textColor,),
                            hintText: "E-mail",
                            hintStyle: TextStyle(fontSize: 10.0, color: textColor),
                            
                          ),
                          
                          controller: emailcontroller,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 5, top: 18),
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
                    child:
                        //  CustomTextInput(
                        //   4,
                        //   'Enter password here',
                        //   true,
                        //   Icons.vpn_key,
                        // ),
                        TextFormField(
                       decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key , color: textColor,),
                            hintText: "Password",
                            hintStyle: TextStyle(fontSize: 10.0, color: textColor),
                            
                          ),
                      controller: passwordcontroller,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child:
                        // CustomButton(1, 'Login'),
                        RaisedButton(
                      onPressed: () {
                        api(context);
                      },
                      child: Text('Login'),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '- OR -',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                  Text(
                    'Sign in with',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          minWidth: 10,
                          color: Colors.white,
                          onPressed: () {},
                          child: Image.asset(
                            'assets/icon/icon_facebook_48.png',
                            height: 30,
                            width: 30,
                          ),
                          shape: CircleBorder(),
                        ),
                        MaterialButton(
                          minWidth: 10,
                          color: Colors.white,
                          onPressed: () {},
                          child: Image.asset(
                            'assets/icon/icon_google_48.png',
                            height: 30,
                            width: 30,
                          ),
                          shape: CircleBorder(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?  ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12,
                            color: textColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign Up',
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
    );
  }
}
