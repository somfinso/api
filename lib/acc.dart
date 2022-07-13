import 'package:api/crud/usable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class accUpdate extends StatefulWidget {
  final String name, cid, boever, amountpaid, paytype, status, jv, accver;
  final String id;

  accUpdate(this.id, this.name, this.cid, this.boever, this.amountpaid,
      this.paytype, this.status, this.jv, this.accver);

  @override
  State<accUpdate> createState() => _accUpdateState();
}

class _accUpdateState extends State<accUpdate> {
  final fname = TextEditingController();
  final ccid = TextEditingController();
  final bboever = TextEditingController();
  final aamountpaid = TextEditingController();
  final ppaytype = TextEditingController();
  final sstatus = TextEditingController();
  final jjv = TextEditingController();
  final aaccver = TextEditingController();

  bool _name = false;
  bool _cid = false;
  bool _boever = false;
  bool _amountpaid = false;
  bool _paytype = false;
  bool _status = false;
  bool _jv = false;
  bool _accver = false;

  Future AccountUp(String name, cid, accver) async {
    var url = Uri.parse("http://192.168.0.115/api/boea/acc.php");
    var response = await http.post(url,
        body: {"name": name, "email": cid, "accver": accver, "id": widget.id});
    var res = response.body;
    if (res == 'true') {
      Navigator.pop(context);
    } else {
      print("error$res");
    }
  }

  Future love() async {
    var url = Uri.parse("http://localhost/api/delete.php");
    var response = await http.post(url, body: {"id": widget.id});
    var res = response.body;
    if (res == 'true') {
      Navigator.pop(context);
    } else {
      print("error$res");
    }
  }

  Future Delete(String name, cid, boever) async {
    var url = Uri.parse("http://localhost/api/delete.php");
    var response = await http.post(url,
        body: {"name": name, "email": cid, "boever": boever, "id": widget.id});
    var res = response.body;
    if (res == 'true') {
      Navigator.pop(context);
    } else {
      print("error$res");
    }
  }

  @override
  void dispose() {
    fname.dispose();
    ccid.dispose();
    bboever.dispose();
    aaccver.dispose();

    super.dispose();
  }

  @override
  void initState() {
    fname.text = widget.name;
    ccid.text = widget.cid;
    bboever.text = widget.boever;
    aaccver.text = widget.accver;
    aamountpaid.text = widget.accver;
    ppaytype.text = widget.paytype;
    sstatus.text = widget.status;
    jjv.text = widget.jv;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Update the detail"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 300,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    child: Card(
                      color: Colors.deepPurple,
                      elevation: 5,
                      shadowColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(23),
                            topRight: Radius.circular(23)),
                      ),
                      child: ListTile(
                        title: Column(
                          children: [
                            Text("Name :${fname.text}",style: TxtStyle(Colors.white, 20, FontWeight.w100),),
                            SizedBox(width: 50),
                            Text("CID :${ccid.text}",style: TxtStyle(Colors.white, 20, FontWeight.w100))
                          ],
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Amount Paid :${aamountpaid.text}",style: TxtStyle(Colors.white, 15, FontWeight.w100)),
                            SizedBox(width: 25),
                            Text("Boea Status :${bboever.text}",style: TxtStyle(Colors.white, 15, FontWeight.w100)),
                            SizedBox(width: 25),
                            Text("Acc Status :${aaccver.text}",style: TxtStyle(Colors.white, 15, FontWeight.w100))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: aaccver,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: "Verify",
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: "Verifed/Pending",
                      hintStyle: TextStyle(fontSize: 15),
                      errorText: _accver ? 'boea Can\'t empty' : null,
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              fname.text.isEmpty ? _name = true : _cid = false;
                              ccid.text.isEmpty ? _cid = true : _name = false;
                              //bboever.text.isEmpty ? _name = true:_cid=false;
                              if (_name == false && _cid == false) {
                                AccountUp(
                                    fname.text, ccid.text, aaccver.text);
                                //updateDetail(ccid.text,fname.text);

                              }
                            });
                          },
                          child: Text("Update")),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
