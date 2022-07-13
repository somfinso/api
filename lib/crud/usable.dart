import 'package:flutter/material.dart';

AppBar ap(String t){
  return AppBar(
    centerTitle: true,
    title: Text(t),
  );
}

TextStyle TxtStyle(Color clr,double size,dynamic fw){
  return TextStyle(
    fontSize: size,
    color: clr,
    fontWeight: fw,

  );

}

ElevatedButton eb(Function fc,Text txt){
  return ElevatedButton(onPressed: fc(), child: txt);
}

Container cont(String tit){
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.redAccent, width: 1)),
    child: Align(
      alignment: Alignment.center,
      child: Text(tit),
    ),
  );
}

Text txt(String t,){
  return Text(t);
}
var ip = "Localhost";

Drawer d(){
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    ),
  );
}

List promotion=["New Year","Happy Lunch","Late Night","Losar"];