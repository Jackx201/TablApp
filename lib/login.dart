import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginLanding extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    elevation: 0,
    backgroundColor: Colors.black,
    brightness: Brightness.dark,
    leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: Icon(Icons.add_to_home_screen),
    ),
  ),
  body: Container(
    height: MediaQuery.of(context).size.height,
    width: double.infinity,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/Login2.jpg"),
        fit: BoxFit.cover)),
    child: Column(
      children: [
        Column(
          children: [
            Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 50),),
            SizedBox(height: 20,),
            Text("PLEASE LOGIN", style: TextStyle(color: Colors.white, fontSize: 10)),
            SizedBox(height: 50,),
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              inputFile(x1:"Email", x2: false, r1:1),
              SizedBox(height: 20),
              inputFile(x1:"Password", x2: true, r1:1),
              SizedBox(height: 20),
              inputFile(x1:"Captcha", x2: false, r1: 10),
              SizedBox(height: 20),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CREATE ACCOUNT ", style: TextStyle(color: Colors.white),),
            /*Text(" SIGN UP", style:TextStyle(
                fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            )),*/
            MaterialButton(
              height: 30,
              //color: Colors.black,

              child: Text("SIGN UP", style: TextStyle(color: Colors.white, fontSize: 20),),
            onPressed: () {
              //To be done
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginLanding()));
            })
          ],
        ),
        SizedBox(height: 50),
        MaterialButton(
            minWidth: MediaQuery.of(context).size.width - 60,
            height: 60,
            color: Colors.yellow[300],
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black87),
                borderRadius: BorderRadius.circular(50)),
            child: Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            onPressed: () {
              //To be done
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginLanding()));
            }),

        //  Lock Image
        Container(
          padding: EdgeInsets.only(top: 100),
          height: 10,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Lock.png"),
              fit: (BoxFit.fitHeight),
            )
          ),
        ),

      ],
    ),

  ),

);
  }


}

Widget inputFile({x1, x2, r1}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(x1,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white
      )),
      SizedBox(
        height: 5,
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