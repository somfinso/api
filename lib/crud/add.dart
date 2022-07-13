import 'package:api/crud/usable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final fname = TextEditingController();
  final eemail = TextEditingController();
  bool _name = false;
  bool _email = false;
  
  Future saveDetail(String name,email) async {
    var url = Uri.parse("http://192.168.0.64/api/saveData.php");
    var response = await http.post(
        url,
        body: {"name":name,"email":email}
    );
    var res = response.body;
    if(res=='true'){
      Navigator.pushNamed(context, "view");
    }else{
      print("error$res");
    }
  }

  @override
  void dispose() {
    fname.dispose();
    eemail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ap("Add"),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              children: [
                TextField(
                  controller: fname,
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(fontSize: 20),
                    hintText: "Enter your Name",
                    hintStyle: TextStyle(fontSize: 15),
                    errorText: _name ? 'Name Can\'t empty' : null,
                  ),
                ),
                TextField(
                  controller: eemail,
                  decoration: InputDecoration(
                    labelText: "email",
                    labelStyle: TextStyle(fontSize: 20),
                    hintText: "Enter your email",
                    hintStyle: TextStyle(fontSize: 15),
                    errorText: _email ? 'email Can\'t empty' : null,
                  ),
                ),
                ButtonBar(
                  children: [
                    ElevatedButton(onPressed: () {
                      setState((){
                        fname.text.isEmpty ? _name = true:_email=false;
                        eemail.text.isEmpty ? _email = true:_name=false;
                        if(_name==false && _email==false){
                          saveDetail(fname.text,eemail.text);
                          
                        }
                      });
                    }, child: Text("Save")),
                    ElevatedButton(
                        onPressed: () {
                          fname.clear();
                          eemail.clear();
                        },
                        child: Text("clear"),
                      ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
