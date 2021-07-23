import 'package:flutter/material.dart';

class SignUp extends StatelessWidget{
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
              inputFile(x1:"  Username", x2: false, x3: (Icons.account_circle), r1:10),
              SizedBox(height: 40,),
              inputFile(x1:"  Email", x2: false, x3: (Icons.email) ,r1:10),
              SizedBox(height: 40,),
              inputFile(x1:" Password", x2: true, x3: (Icons.vpn_key), r1:10),
              SizedBox(height: 40,),
              inputFile(x1:"  Confirm Password", x2: true, x3: (Icons.vpn_key_outlined), r1: 10),
              SizedBox(height: 60,),
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
                    //To be done
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
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


Widget inputFile({x1, x2, x3, dynamic r1}){
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