import 'package:flutter/material.dart';
TextStyle sty(Color c,FontWeight fw,dynamic fs,dynamic ls,dynamic ws){
  return TextStyle(
      color: c,
      fontWeight: fw,
      fontSize: fs,
      letterSpacing: ls,
      wordSpacing: ws

  );
}


Container cont(var url){
  return Container(width: 200,height: 200,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.purple,width: 5),
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(image: NetworkImage(url),fit: BoxFit.cover)
    ),);
}



Container rec(var url){
  return Container(
    width:900,
    height: 200,
    margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage(url),fit: BoxFit.cover),
//gradient: LinearGradient(colors:Colors.accents),
      border: Border.all(color: Colors.black12),
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),

    ),
  );
}

Row footer(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Ariya Hotel Olakha Thimphu Bhutan",style: sty(Colors.white, FontWeight.normal, 15,5,2,)),
      Text("info@ariya.com  02-3234345 +97577492294",style: sty(Colors.white, FontWeight.normal, 15,5,2,)),
    ],);
}

Column bodyy(var url){
  return Column(
      children: [
  Padding(padding: EdgeInsets.all(10)),
  SizedBox(height: 45,),

  Center(child: Text('National Climate Change ',style: sty(Colors.white, FontWeight.w100, 60,8,4,),)),
  SizedBox(height: 35,),
  Center(child: Text("National Climate Change Discussion",style: sty(Colors.white, FontWeight.w100, 45,8,4,))),
  SizedBox(height: 35,),
  Text('Tea Break 8:45',style: sty(Colors.white, FontWeight.w100, 30,8,4,)),
      ]
  );
}
