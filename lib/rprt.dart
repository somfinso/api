import 'package:api/crud/usable.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
class rprt extends StatefulWidget {
  const rprt({Key? key}) : super(key: key);

  @override
  State<rprt> createState() => _rprtState();
}

class _rprtState extends State<rprt> {




  @override
  Widget build(BuildContext context) {
    return Container(child: ButtonBar(children: [

      TextButton(
        onPressed: (){
          setState((){
            var sum = 0;
            var given_list = [1, 2, 3, 4, 5];

            for (var i = 0; i < given_list.length; i++) {
              sum += given_list[i];
            }

          });
        },
        child: Text("Bhutan"),),
      Text("Name"),
    ],),);
  }
}
