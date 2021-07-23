import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/login.dart';
import 'package:untitled1/signup.dart';

void main() {
  runApp(MyApp());
}

//StatelessFul -> Changes during execution.
//StatelessWidget -> Fixed through the whole execution.
//Some Widgets are able to do multi screen

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,

    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          width: double.infinity, //Works like a match parent.
          height: MediaQuery.of(context)
              .size
              .height, //matches the size of the screen
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                Text("LOGIN", style: TextStyle(color: Colors.white),),
                SizedBox(
                  height: 20,
                ), //Just a little space
                Text("Exercise 5 - LOGIN", style: TextStyle(color: Colors.grey),),
              ]),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/login.png"))),
              ),
              Column(
                children: [
                  MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.cyan),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      onPressed: () {
                        //To be done
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginLanding()));
                      }),
                  SizedBox(height: 20),
                  MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.cyan),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      onPressed: () {
                        //To be done
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
