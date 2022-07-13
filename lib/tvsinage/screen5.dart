import 'package:api/tvsinage/shortcut.dart';
import 'package:flutter/material.dart';
class s5 extends StatefulWidget {
  const s5({Key? key}) : super(key: key);

  @override
  State<s5> createState() => _s5State();
}

class _s5State extends State<s5> {
  var logo = 'https://mpng.subpng.com/20190610/zib/kisspng-portable-network-graphics-food-fusion-cuisine-logo-restrokhana-your-online-restaurant-partner-br-5cfe4eadd1c225.5829975215601701578592.jpg';
  var bk ='https://img.freepik.com/premium-vector/digital-restaurant-menu-horizontal-format_23-2148655475.jpg?w=2000';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(color: Colors.transparent,
        child: Center(
          child: Column(children: [
          cont(logo),ListTile(title: Text("National Flag"),)
      ],),
        ),),
      width:1500,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(bk),fit: BoxFit.fill),
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
    );
  }
}
