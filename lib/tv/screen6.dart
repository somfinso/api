import 'package:flutter/material.dart';
class s6 extends StatefulWidget {
  const s6({Key? key}) : super(key: key);

  @override
  State<s6> createState() => _s6State();
}

class _s6State extends State<s6> {
  var im = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSteEwtOCfuNjGLUUK88zv-npT8V_PbqX54Cw&usqp=CAU';
  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Container(

          width:1500,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            //gradient: LinearGradient(colors:Colors.accents),
            border: Border.all(color: Colors.black12),
            ///color: Colors.indigo,
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
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            //defaultColumnWidth: FixedColumnWidth(120.0),
              border:
              TableBorder.all(
                borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  width: 0.5
              ),
            children: [
              TableRow( children: [
                Column(children:[Text('Name', style: TextStyle(fontSize: 20.0))]),
                Column(children:[Text('Description', style: TextStyle(fontSize: 20.0))]),
                Column(children:[Text('Image', style: TextStyle(fontSize: 20.0))]),
                Column(children:[Text('Price', style: TextStyle(fontSize: 20.0))])
              ]),
              TableRow(
                  children: [
                Column(mainAxisAlignment: MainAxisAlignment.center,children:[Text('Jop,poopavatpoint')]),
                Column(children:[Text('Javatpoint')]),
                Column(children:[Image.network(im,fit: BoxFit.fill,)]),
                Column(children:[Text('5*')]),
              ]),
              TableRow(
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.center,children:[Text('Jop,poopavatpoint')]),
                    Column(children:[Text('Javatpoint')]),
                    Column(children:[Image.network(im,fit: BoxFit.fill,)]),
                    Column(children:[Text('5*')]),
                  ]),
              TableRow(
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.center,children:[Text('Jop,poopavatpoint')]),
                    Column(children:[Text('Javatpoint')]),
                    Column(children:[Image.network(im,fit: BoxFit.fill,)]),
                    Column(children:[Text('5*')]),
                  ]),

            ],
          ),
        )

      ],),),
    );
  }
}
