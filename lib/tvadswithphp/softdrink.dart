import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../crud/usable.dart';
class softdrk extends StatefulWidget {
  const softdrk({Key? key}) : super(key: key);

  @override
  State<softdrk> createState() => _softdrkState();
}

class _softdrkState extends State<softdrk> {
  Future<List> sdData() async {
    var url = Uri.parse("http://$ip/api/sofdrk/sdview.php");
    //var url = Uri.parse("http://localhost/api/all.php");
    var res = await http.post(url);
    var data = jsonDecode(res.body);


    return data;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: sdData(),
      builder: (context,ss){
        if (ss.hasError) {
          print("Hass error${ss.error}");
        }
        return ss.hasData
            ? sd(ss.data as List)
            : const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class sd extends StatelessWidget {

  List sft;
  sd(this.sft);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          itemCount: sft.length,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(

              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2, crossAxisCount: 3
          ),
          itemBuilder: (context,index){
            return Container(
              height: 1000,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.fill,
                      image: NetworkImage(

                          "http://$ip/api/sofdrk/softdrk/${sft[index]['image']}")),
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15)),
              child: Card(

                elevation: 0,
                color: Colors.amber,

                child: ListTile(hoverColor: Colors.blue,
                    tileColor: Colors.blue,
                    textColor: Colors.black,
                    iconColor: Colors.blue,
                    title: Text(sft[index]['name']),
                    subtitle: Text(sft[index]['desci']),
                    trailing: ElevatedButton(onPressed: ()=>{},
                      child: Text(sft[index]['price']),),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)))
                ),
              ),
            );
          }),
    );
  }
}

