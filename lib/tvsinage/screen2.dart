import 'package:api/tvsinage//shortcut.dart';
import 'package:flutter/material.dart';
class s2 extends StatefulWidget {
  const s2({Key? key}) : super(key: key);

  @override
  State<s2> createState() => _s2State();
}

class _s2State extends State<s2> {
  var url ="https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Dell_Logo.svg/768px-Dell_Logo.svg.png";
var url2 ="https://www.citizenservices.gov.bt/DAHE/images/headerPaymenr.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(children: [
          Row(children: [
            cont(url),rec(url2),cont(url)
          ],),
          bodyy(url2),
          SizedBox(height: 45,),
          footer()
        ],),
        ),
    );
  }
}
