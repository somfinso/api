import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class tview extends StatefulWidget {
  const tview({Key? key}) : super(key: key);

  @override
  State<tview> createState() => _tviewState();
}

class _tviewState extends State<tview> {
  Future<List<dynamic>> tview() async {
    var url = Uri.parse("http://localhost/api/tview.php");
    var res = await http.post(url);
    var data = jsonDecode(res.body);
    for(var x in data){
      print(x);
    }
    print(data);
    return data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<List>(
        future: tview(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Hass error${snapshot.error}");
          }
          return snapshot.hasData
              ? tealist(snapshot.data as List)
              : const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}


class tealist extends StatelessWidget {
  late final List Tea;
  tealist(this.Tea, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Tea.length,
        itemBuilder: (context,index){
        return Card(child: ListTile(
          leading: Card(child: Image.network(Tea[index]['image']),),
          title: Text(Tea[index]['name'].toString().toUpperCase()),
          subtitle: Text(Tea[index]['desci']),
          trailing: ElevatedButton(onPressed: ()=>{},child: Text(Tea[index]['price']))),);
        });
  }
}


