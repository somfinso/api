import 'dart:convert';

import 'package:api/search/book.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PayApi{
  static Future<List<Pay>> getPay(String query) async{
    var url = Uri.parse("http://localhost/api/boea/api.php");
    var response =await http.get(url);
    if(response.statusCode==200){
      List pays = jsonDecode(response.body);
      return pays.map((json)=>Pay.fromJson(json)).where((pay){
        final nameLower =pay.name.toLowerCase();
        final cidLower = pay.cid.toLowerCase();
        final searchLower=query.toLowerCase();
        return nameLower.contains(searchLower) || cidLower.contains(searchLower);
      }).toList();
    }else{throw Exception();}
  }
}