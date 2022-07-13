import 'package:api/crud/usable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Update extends StatefulWidget {
  final String name,email;
  final String id;
  Update(this.id,this.name,this.email, {Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final fname = TextEditingController();
  final eemail = TextEditingController();
  bool _name = false;
  bool _email = false;


  Future updateDetail(String name,email) async {
    var url = Uri.parse("http://localhost/api/upDate.php");
    var response = await http.post(
        url,
        body: {"name":name,"email":email,"id":widget.id}
    );
    var res = response.body;
    if(res=='true'){
      Navigator.pop(context);
    }else{
      print("error$res");
    }
  }


  Future love() async {
    var url = Uri.parse("http://localhost/api/delete.php");
    var response = await http.post(
        url,
        body: {"id":widget.id}
    );
    var res = response.body;
    if(res=='true'){
      Navigator.pop(context);
    }else{
      print("error$res");
    }
  }





  Future Delete(String name,email) async {
    var url = Uri.parse("http://localhost/api/delete.php");
    var response = await http.post(
        url,
        body: {"name":name,"email":email,"id":widget.id}
    );
    var res = response.body;
    if(res=='true'){
      Navigator.pop(context);
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
  void initState(){
    fname.text=widget.name;
    eemail.text=widget.email;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: ap("Update"),
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
                      updateDetail(fname.text,eemail.text);

                    }
                  });
                }, child: Text("Update")),
                ElevatedButton(
                  onPressed: () {
                    //Delete(fname.text, eemail.text);
                    love();
                  },
                  child: Text("Delete"),
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
