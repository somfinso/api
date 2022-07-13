import 'dart:convert';
import 'package:api/crud/usable.dart';
import 'package:api/payupdate.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'acc.dart';

class abt extends StatefulWidget {

  const abt({Key? key}) : super(key: key);


  @override
  State<abt> createState() => _abtState();
}

class _abtState extends State<abt> {
  TextEditingController editingController = TextEditingController();

  Future<List> payData() async {
    var ip = 'http://192.168.0.115/api/boea/api.php';
    var gip = "http://103.80.110.223/phpmailer/db.php";
    var url = Uri.parse(ip);
    var resp = await http.post(url);
    var data = jsonDecode(resp.body);
    //print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: payData,
      child: FutureBuilder(
          future: payData(),
          builder: (context, ss) {
            if (ss.hasError) {
              print("Hass error${ss.error}");
            }
            return ss.hasData
                ? paydata(ss.data as List)
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}

class paydata extends StatelessWidget {
  late List paylist;

  paydata(this.paylist);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {},
              //controller: editingController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: paylist.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(23),
                            topRight: Radius.circular(23)),
                      ),
                      color: Colors.deepPurple,
                      child: ListTile(
                        onLongPress: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => accUpdate(
                                      paylist[index]["id"],
                                      paylist[index]['name'],
                                      paylist[index]['cid'],
                                      paylist[index]['boever'],
                                      paylist[index]['amountpaid'],
                                      paylist[index]['paytype'],
                                      paylist[index]['status'],
                                      paylist[index]['jv'],
                                      paylist[index]['accver']
                                      )));
                        },
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => payUpdate(
                                      paylist[index]["id"],
                                    paylist[index]['name'],
                                      paylist[index]['cid'],
                                      paylist[index]['boever'],
                                    paylist[index]['amountpaid'],
                                    paylist[index]['paytype'],
                                    paylist[index]['status'],
                                    paylist[index]['jv'],
                                    paylist[index]['accver']

                                      )));
                        },
                        selectedColor: Colors.black38,

                        title: Text(
                          "${paylist[index]['name']}".toUpperCase(),
                          style: TxtStyle(Colors.white, 15, FontWeight.w100),
                        ),
                        //subtitle: Text(paylist[index]['cid'],style: TxtStyle(Colors.white, 10, FontWeight.normal),),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              paylist[index]['cid'],
                              style:
                                  TxtStyle(Colors.white, 10, FontWeight.normal),
                            ),
                            //Text(paylist[index]['status'],style: TxtStyle(Colors.white, 10, FontWeight.normal)),
                            Text(
                                "Amount paid : ${paylist[index]['amountpaid']}",
                                style: TxtStyle(
                                    Colors.white70, 10, FontWeight.normal))
                          ],
                        ),
                        leading: CircleAvatar(
                            child: Text(
                                "${paylist[index]['name']}".substring(0, 1))),
                        trailing: RaisedButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          color: Colors.indigo,
                          elevation: 10,
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (cxt) => info(
                                      "${paylist[index]['id']}",
                                      "${paylist[index]['name']}",
                                      "${paylist[index]['amountpaid']}",
                                      "${paylist[index]['cid']}",
                                      "${paylist[index]['paytype']}",
                                      "${paylist[index]['status']}",
                                      "${paylist[index]['jv']}",
                                      "${paylist[index]['boever']}",
                                      "${paylist[index]['accver']}"))),
                          child: Text(
                            "Nu ${paylist[index]['amountpaid']}",
                            style: TxtStyle(Colors.white, 15, FontWeight.w100),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class info extends StatelessWidget {
  String id, name, amountpaid, cid, paytype, status, jv, boever, accver;

  info(this.id, this.name, this.amountpaid, this.cid, this.paytype, this.status,
      this.jv, this.boever, this.accver);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: ap("Detail"),
      body:Center(
      child: Card(
        color: Colors.lightBlue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20)),
                    //color: Colors.deepPurple,
                    width: 500,
                    height: 50,
                    child: Center(
                        child: Text(
                          "Payment Detail for $name",
                          style: TxtStyle(Colors.white, 23, FontWeight.w800),
                        )),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(23),
                        //alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(20)),
                        //color: Colors.deepPurple,
                        width: 500,
                        height: 570,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Date:",
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  ),
                                  Padding(padding: EdgeInsets.all(23)),
                                  Text(
                                    "12/06/2022",
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Sl No:",
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  ),
                                  Padding(padding: EdgeInsets.all(23)),
                                  Text(
                                    "11702020$id",
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Name:",
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  ),
                                  Padding(padding: EdgeInsets.all(23)),
                                  Text(
                                    name.toUpperCase(),
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Amount Paid:",
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  ),
                                  Padding(padding: EdgeInsets.all(23)),
                                  Text(
                                    amountpaid,
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "CID:",
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  ),
                                  Padding(padding: EdgeInsets.all(23)),
                                  Text(
                                    "* * * * *${cid.substring(6).toUpperCase()}",
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Payment Type:",
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  ),
                                  Padding(padding: EdgeInsets.all(23)),
                                  Text(
                                    paytype.toUpperCase(),
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Installament:",
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  ),
                                  Padding(padding: EdgeInsets.all(23)),
                                  Text(
                                    status,
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Journal No:",
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  ),
                                  Padding(padding: EdgeInsets.all(23)),
                                  Text(
                                    jv.toUpperCase(),
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () => {},
                                    child: Text(
                                      "Boea Verification",
                                      style: TxtStyle(
                                          Colors.white, 20, FontWeight.w100),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(23)),
                                  Text(
                                    boever,
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: Text("Acc Verification:",
                                          style: TxtStyle(
                                              Colors.white, 20, FontWeight.w100))),
                                  Padding(padding: EdgeInsets.all(23)),
                                  Text(
                                    accver,
                                    style:
                                    TxtStyle(Colors.white, 20, FontWeight.w100),
                                  )
                                ],
                              ),
                              Divider(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.download_outlined,
                                        ),
                                      )),
                                  const Divider(),
                                  Spacer(),
                                  CircleAvatar(
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.close_outlined),
                                      )),
                                  const Divider(),
                                  Spacer(),
                                  CircleAvatar(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.share),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ) ,);

  }
}
