import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
class phone extends StatefulWidget {
  const phone({Key? key}) : super(key: key);

  @override
  State<phone> createState() => _phoneState();
}

class _phoneState extends State<phone> {
  
  Future<List> basicAuth() async{
    List<int> pwd = [1,3];
    String basicAuth='Basic' + base64Encode(pwd);
    var url = Uri.parse("http://localhost/api/boea/apiauth.php");
    var jan = await HttpClientDigestCredentials("username","password");
    var res = await http.post(url,headers: {'authorization':basicAuth});
    var data = jsonDecode(res.body);
    return data;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
