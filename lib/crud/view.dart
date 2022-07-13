import 'dart:convert';

import 'package:api/crud/update.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  Future<List> getData() async {
    var url = Uri.parse("http://192.168.0.64/api/getData.php");
    var res = await http.get(url);
    var data = jsonDecode(res.body);
    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("View"),
          centerTitle: true,
        ),
        body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("Hass error${snapshot.error}");
            }
            return snapshot.hasData
                ? Itemlist(snapshot.data as List)
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, "add"),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class Itemlist extends StatelessWidget {
  List list;

  Itemlist(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Update(
                              list[i]["ID"], list[i]['NAME'], list[i]['EMAIL']
                          )));
                },
                onLongPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Update(
                              list[i]["ID"], list[i]['NAME'], list[i]['EMAIL']
                          )));
                },
                leading: CircleAvatar(
                  child: Text(list[i]['NAME'].toString().substring(0, 1)),
                ),
                title: Text(list[i]['NAME']),
                subtitle: Text(
                  list[i]['EMAIL'],
                ),
              ),
            ),
          );
        });
  }
}
