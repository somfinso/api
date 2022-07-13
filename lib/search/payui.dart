// import 'package:flutter/material.dart';
// import 'dart:convert' as convert;
// import 'package:http/http.dart' as http;
//
// class MoModel{
//   String name,age,about;
//   MoModel({required this.name,required this.age,required this.about});
//   factory MoModel.fromMap(Map<String,dynamic> json){
//     return MoModel(name: json['name'], age: json['age'], about: json['about']);
//
//   }
//   Map toJson()=>{
//     'name':name,
//     'age':age,
//     'about':about
//   };
// }
//
// class fromController{
//
//
//   static var STATUS_SUCCESS='SUCCESS';
//   static var urll = Uri.parse("https://script.google.com/macros/s/AKfycbw5hLyvlzfVMfTVJvUIqHoYl9uDU8EJudQa3LqGzucDk2H6LOqzIiMO6kQAKAWcJwuBqA/exec");
//   void submitedform(
//     MoModel moModel,void Function(String) callbaack) async{
//     try{
//       await http.post(urll,body: moModel.toJson()).then((response)async{
//         if(response.statusCode==200){
//           var url = response.headers['location'];
//           await http.get(urll).then((response){
//             callbaack(convert.jsonDecode(response.body)['status']);
//           });
//         }else{
//           callbaack(convert.jsonDecode(response.body));
//         }
//       });
//     }catch(e){
//       print(e);
//     }
//   }
//
// }
//
// class googlesheet extends StatefulWidget {
//  String title;
//  googlesheet({Key? key, required this.title}) : super(key: key);
//  final _formkey = GlobalKey<FormState>();
//  final _scaffoldkey = GlobalKey<ScaffoldState>();
//
//  TextEditingController namectroller = TextEditingController();
//  TextEditingController agecontroller = TextEditingController();
//  TextEditingController aboutcontroller = TextEditingController();
//
//  void _submit(){
//    if(_formkey.currentState.validate()){
//      MoModel moModel = MoModel(name: namectroller.text, age: agecontroller.text, about: aboutcontroller.text);
//      fromController fromcontroller =fromController();
//      _showsnackbar("Loading");
//
//      fromController.
//    }
//  }
//
//   @override
//   State<googlesheet> createState() => _googlesheetState();
// }
//
// class _googlesheetState extends State<googlesheet> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
