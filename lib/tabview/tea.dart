import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../crud/usable.dart';
class tea extends StatefulWidget {


  @override
  State<tea> createState() => _teaState();
}
Future<List> basicAuth() async{
  List<int> pwd = [1,3];
  String basicAuth='Basic' + base64Encode(pwd);
  var url = Uri.parse("http://localhost/api/boea/apiauth.php");
  var res = await http.post(url,headers: {'authorization':basicAuth});
  var datal = jsonDecode(res.body);
  print(datal);
  return datal;
}

class _teaState extends State<tea> {
  Future<List> teaData() async{
    var url = Uri.parse("http://$ip/api/tea/teaview.php");
    var res = await http.post(url);
    var data = jsonDecode(res.body);

    print(data);
    return data;


  }
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List>(
      future: teaData(),
      builder: (context,ss){
        if (ss.hasError) {
          print("Hass error${ss.error}");
        }
        return ss.hasData
            ? Teast(ss.data as List)
            : const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class Teast extends StatelessWidget {

  List Te;
  Teast(this.Te);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          itemCount: Te.length,
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

                          "http://$ip/api/tea/tea/${Te[index]['image']}")),
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15)),
              child: Card(
                // shape: RoundedRectangleBorder(
                //
                //
                //
                //   borderRadius: BorderRadius.only(bottomRight: Radius.circular(12)),
                // ),
                elevation: 0,
                color: Colors.amber,

                child: ListTile(hoverColor: Colors.blue,
                    tileColor: Colors.blue,
                    textColor: Colors.black,
                    iconColor: Colors.blue,
                    title: Text(Te[index]['name']),
                    subtitle: Text(Te[index]['desci']),
                    trailing: ElevatedButton(onPressed: ()=>{},
                      child: Text(Te[index]['price']),),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)))
                ),
              ),
            );
          }),
    );
  }
}



