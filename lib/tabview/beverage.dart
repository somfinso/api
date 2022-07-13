import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../crud/usable.dart';
class bev extends StatefulWidget {
  const bev({Key? key}) : super(key: key);

  @override
  State<bev> createState() => _bevState();
}

class _bevState extends State<bev> {
  Future<List> edit() async{
    var url = Uri.parse("http://$ip/api/bev/beview.php");
    //var url = Uri.parse("http://localhost/api/all.php");
    var res = await http.post(url);
    var data = jsonDecode(res.body);


    return data;

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: edit(),
      builder: (context,ss){
        if (ss.hasError) {
          print("Hass error${ss.error}");
        }
        return ss.hasData
            ? beverage(ss.data as List)
            : const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class beverage extends StatelessWidget {
  
  List Tea;
  beverage(this.Tea);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          itemCount: Tea.length,
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
                  image: DecorationImage(fit: BoxFit.fitWidth,
                      image: NetworkImage(

                          "http://$ip/api/bev/bev/${Tea[index]['image']}")),
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15)),
              child: Card(

                elevation: 0,
                color: Colors.amber,

                child: ListTile(hoverColor: Colors.blue,
                    tileColor: Colors.blue,
                    textColor: Colors.black,
                    iconColor: Colors.blue,
                    title: Text(Tea[index]['name']),
                    subtitle: Text(Tea[index]['desci']),
                    trailing: ElevatedButton(onPressed: ()=>{},
                      child: Text(Tea[index]['price']),),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)))
                ),
              ),
            );
          }),
    );
  }
}


