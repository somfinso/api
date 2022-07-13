import 'dart:convert';

import 'package:api/crud/usable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class maincourse extends StatefulWidget {
  const maincourse({Key? key}) : super(key: key);

  @override
  State<maincourse> createState() => _maincourseState();
}

class _maincourseState extends State<maincourse> {
  Future<List> mcData() async {
    var url = Uri.parse("http://$ip/api/mc/mcview.php");
    var res = await http.post(url);
    var data = jsonDecode(res.body);
    //print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: mcData(),
        builder: (context, ss) {
          return ss.hasData
              ? mclist(ss.data as List)
              : const Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}

class mclist extends StatelessWidget {
  List mc;

  mclist(this.mc);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          itemCount: mc.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 12,
              crossAxisSpacing: 24,
              childAspectRatio: 1.6,
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Container(
              height: 200,
              width: 500,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "http://localhost/api/mc/mcc/${mc[index]['image']}")),
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

                child: ListTile(
                    hoverColor: Colors.blue,
                    tileColor: Colors.blue,
                    textColor: Colors.black,
                    iconColor: Colors.blue,
                    title: Text(mc[index]['name']),
                    subtitle: Text(mc[index]['desci']),
                    trailing: ElevatedButton(
                      onPressed: () => {},
                      child: Text(mc[index]['price']),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)))),
              ),
            );
          }),
    );
  }
}
