import 'package:flutter/material.dart';
class promo extends StatefulWidget {


  @override
  State<promo> createState() => _promoState();
}

class _promoState extends State<promo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Hellow"),leading: FloatingActionButton(onPressed:()=>Navigator.pop(context),child: Text("Back"),),),);
  }
}
