import 'dart:convert';

import 'package:api/search/book.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class BookApi{
  static Future<List<Book>> getBook(String query) async{
    var url = Uri.parse("https://gist.githubusercontent.com/JohannesMilke/d53fbbe9a1b7e7ca2645db13b995dc6f/raw/eace0e20f86cdde3352b2d92f699b6e9dedd8c70/books.json");
    var respones = await http.get(url);
    if(respones.statusCode==200){
      List books = jsonDecode(respones.body);
      return books.map((json)=>Book.fromJson(json)).where((book){
        final titleLower =book.title.toLowerCase();
        final authorLower = book.author.toLowerCase();
        final searchLower=query.toLowerCase();
        return titleLower.contains(searchLower) || authorLower.contains(searchLower);
      }).toList();
    }else{throw Exception();}
  }
}