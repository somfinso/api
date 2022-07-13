import 'package:flutter/material.dart';

class web extends StatefulWidget {
  const web({Key? key}) : super(key: key);

  @override
  State<web> createState() => _webState();
}

class _webState extends State<web> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.zero,
          child: Container(color: Colors.blue,
            child: Row(
              children: [
                CircleAvatar(
                  child: Text("Logo"),
                ),
                SizedBox(
                  width: 20,
                ),
                FlatButton(onPressed: () {}, child: Text("Home")),
                SizedBox(width: 10,),
                FlatButton(onPressed: () {}, child: Text("Room")),
                SizedBox(width: 10,),
                FlatButton(onPressed: () {}, child: Text("Service")),
                SizedBox(width: 10,),
                FlatButton(onPressed: () {}, child: Text("Contact")),

              ],
            ),
          ),
        ),
        Container(
          height: 250,width: 500,color: Colors.yellow,
          child: Image.network("https://cdn-cdmpe.nitrocdn.com/mBNpjkZDHAFVAnlJSAkvrwmRrfPhQeHx/assets/static/optimized/international/bhutan/wp-content/uploads/sites/2/2020/01/37cf27a259eca25792ff95690b66af5d.Tiger-nest-monastery-bhutan-hp.jpg",
          fit: BoxFit.fill,)
        ),
        Container(
          child: Text("Current page"),
        )
      ],
    );
  }
}

class frontpage extends StatefulWidget {
  const frontpage({Key? key}) : super(key: key);

  @override
  State<frontpage> createState() => _frontpageState();
}

class _frontpageState extends State<frontpage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Rooms extends StatefulWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class service extends StatefulWidget {
  const service({Key? key}) : super(key: key);

  @override
  State<service> createState() => _serviceState();
}

class _serviceState extends State<service> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class contact extends StatefulWidget {
  const contact({Key? key}) : super(key: key);

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
