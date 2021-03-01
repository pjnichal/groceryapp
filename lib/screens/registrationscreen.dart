import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/getcontrollers/authcontroller.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<RegistrationScreen> {
  final AuthController c = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Grocery',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email ID',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: cpasswordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                  ),
                ),
              ),
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Register'),
                    onPressed: () {
                      if (cpasswordController.text == passwordController.text) {
                        c.creatUser(
                            emailController.text, passwordController.text);
                      } else {
                        Get.snackbar("Error", "Both Password Doesn't Match",
                            snackPosition: SnackPosition.BOTTOM);
                      }

                      print(emailController.text);
                      print(passwordController.text);
                    },
                  )),
              Container(
                  child: Row(
                children: <Widget>[
                  Text('Have account?'),
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 14),
                    ),
                    onPressed: () {
                      //signup screen
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ))
            ],
          )),
    );
  }
}
