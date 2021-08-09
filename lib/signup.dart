import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

final TextField1 = TextEditingController();
final TextField2 = TextEditingController();
final TextField3 = TextEditingController();
final TextField4 = TextEditingController();
final ErrorText = TextEditingController();

class SignUp extends StatelessWidget{

  final FirebaseFirestore fb1 = FirebaseFirestore.instance;

  void insert(String v1, String v2, String v3, String v4) async{

    await fb1.collection("general").doc(v1).set({
      "email": v2,
      "password": v3,
      "confirm_password": v4,
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        //title: Text("LOGIN", style: TextStyle(fontFamily: "IndieFlower", color: Colors.white),),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
              Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height + 70,
          width: double.infinity,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("SIGN UP", style: TextStyle(fontSize: 40, color: Colors.white),),
              SizedBox(height: 10,),
              Text("Create an account for free!", style: TextStyle(color: Colors.grey),),
              SizedBox(height: 120,),
              inputFile(x1:"  Username", x2: false, x3: (Icons.account_circle), r1:10, controller: TextField1),
              SizedBox(height: 40,),
              inputFile(x1:"  Email", x2: false, x3: (Icons.email) ,r1:10, controller: TextField2),
              SizedBox(height: 40,),
              inputFile(x1:" Password", x2: true, x3: (Icons.vpn_key), r1:10, controller: TextField3),
              SizedBox(height: 40,),
              inputFile(x1:"  Confirm Password", x2: true, x3: (Icons.vpn_key_outlined), r1: 10, controller: TextField4),
              SizedBox(height: 60,),

              Column(
                children: <Widget> [
                  TextField(
                    enabled: false,
                    controller: ErrorText,
                    obscureText: false,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal:10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        ),
                      ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                        )
                    ),


                  )
                ],
              ),

              MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  color: Colors.green[400],
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black87),
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  onPressed: () {

                    //Simple validation

                    String x1 = TextField1.text;
                    String x2 = TextField2.text;
                    String x3 = TextField3.text;
                    String x4 = TextField4.text;
                    bool error = false;


                    if(x1 == "")
                      {
                        ErrorText.text = "USERNAME IS REQUIRED";
                        error = true;
                      }
                    if(x2 == "")
                    {
                      ErrorText.text = "EMAIL REQUIRED";
                      error = true;
                    }
                    if(x3 == "")
                    {
                      ErrorText.text = "PASSWORD IS REQUIRED";
                      error = true;
                    }
                    if(x4 == "")
                    {
                      ErrorText.text = "PLEASE CONFIRM YOUR PASSWORD";
                      error = true;
                    }
                    if(x4 != x3)
                    {
                      ErrorText.text = "PASSWORDS AREN'T EQUALS";
                      error = true;
                    }

                    if(!error)
                    {
                      insert(x1,x2,x3,x4);
                      TextField1.text = "";
                      TextField2.text = "";
                      TextField3.text = "";
                      TextField4.text = "";
                    }


                    //To be done
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                  }),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?   ", style: TextStyle(color: Colors.white),),
                  Text(" Login", style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white
                  )),
                ],
              ),
            ],
          ),


        ),
      )
      //floatingActionButton: FloatingActionButton(onPressed: () { }, child: Icon(Icons.add),),
    );
  }

}


Widget inputFile({x1, x2, x3, dynamic r1, controller}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RichText(text: TextSpan(
          children: [
            WidgetSpan(child: Icon(x3, color: Colors.white, size: 20,)),
            TextSpan(
              text: x1, style: TextStyle(color: Colors.white)
            ),
          ]
      )),
      SizedBox(
        height: 10,
      ),
      TextField(
        controller: controller,
        obscureText: x2,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey
                ),
                borderRadius: BorderRadius.circular(r1.toDouble())
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            )
        ),
      ),
      SizedBox(),
    ],
  );
}