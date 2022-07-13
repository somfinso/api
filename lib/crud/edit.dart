import 'dart:convert';
import 'dart:typed_data';
import 'package:api/crud/usable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class edit extends StatefulWidget {
  const edit({Key? key}) : super(key: key);

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  Future<List> edit() async{
    var url = Uri.parse("http://localhost/api/tview.php");
    //var url = Uri.parse("http://localhost/api/all.php");
    var res = await http.post(url);
    var data = jsonDecode(res.body);


    // var blob = jsonDecode(res.body);
    // var image = Base64Codec().decode(blob);
    print(data);

    return data;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ap("Cake for Sale"),
      body: FutureBuilder<List>(
        future: edit(),
        builder: (context,ss){
          if (ss.hasError) {
            print("Hass error${ss.error}");
          }
          return ss.hasData
              ? Im(ss.data as List)
              : const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.greenAccent,

        items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.chat),label: "Chat"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Signup")
      ],),
    );
  }
}

class Im extends StatelessWidget {
  late final List  imlist;
  Im(this.imlist);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imlist.length,
        itemBuilder: (context,index){
      return Container(color: Colors.lightBlueAccent,
          child:Center(
            child: Padding(padding: EdgeInsets.all(6),
      child:Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),

        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        color: Colors.blue,
        child: ListTile(
            leading: CircleAvatar(radius: 20,
              backgroundColor: Colors.blue,
              backgroundImage: NetworkImage("http://192.168.0.64/api/images/${imlist[index]['image']}"),
              ),
            title: Text(imlist[index]['name'],style: TxtStyle(Colors.black, 23.0, FontWeight.w400),),
            subtitle: Text(imlist[index]['desci'],style: TxtStyle(Colors.white, 18, FontWeight.w100),),
            trailing: ElevatedButton(onPressed:()=>{print(imlist[index]['name'])},child:Text(imlist[index]['price']))
        ),
      )),
          ));
    });
  }
}
