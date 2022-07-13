import 'package:api/tv/shortcut.dart';
import 'package:flutter/material.dart';

class s1 extends StatefulWidget {
  const s1({Key? key}) : super(key: key);

  @override
  State<s1> createState() => _s1State();
}

class _s1State extends State<s1> {
  var url ="https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Dell_Logo.svg/768px-Dell_Logo.svg.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Container(
        width:1500,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          //gradient: LinearGradient(colors:Colors.accents),
          border: Border.all(color: Colors.black12),
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(30),
          boxShadow:[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), //color of shadow
              spreadRadius: 5, //spread radius
              blurRadius: 7, // blur radius
              offset: Offset(0, 2), // changes position of shadow
            ),


          ],

        ),
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              cont(url),
              SizedBox(height: 35,),

              bodyy(url),
              SizedBox(height: 30,),


              footer()
            ],),
        ),
      ),
    ),);
  }
}