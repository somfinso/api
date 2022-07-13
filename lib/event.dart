import 'dart:convert';

import 'package:api/crud/usable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class event extends StatefulWidget {
  const event({Key? key}) : super(key: key);

  @override
  State<event> createState() => _eventState();
}

class _eventState extends State<event> {
  TextEditingController editingController = TextEditingController();
  Future<List> eData() async {
    var ip = 'http://localhost/api/boea/api.php';
    var gip = "http://nfrnfieruhiuheituhght.com/db.php";
    var url = Uri.parse(ip);
    var resp = await http.post(url);
    var data = jsonDecode(resp.body);
    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue,
      elevation: 10,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23)),
      ),);
  }
}

