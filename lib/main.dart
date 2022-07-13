import 'package:api/tvsinage/screen1.dart';
import 'package:api/tvsinage/screen2.dart';
import 'package:api/tvsinage/screen3.dart';
import 'package:api/tvsinage/screen4.dart';
import 'package:api/tvsinage/screen5.dart';
import 'package:api/tvsinage//screen6.dart';
import 'package:api/webpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(mainpage());
class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  var _selectedIndex = 0;
  List page=[s1(),s2(),s4(),s5(),s6()];
  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      //return index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: page[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(

            backgroundColor: Colors.black,
            selectedItemColor: Colors.lightBlue,
            unselectedItemColor: Colors.black38,
            currentIndex: _selectedIndex, //New
            onTap: _onItemTapped,
            items: [

              BottomNavigationBarItem(
                backgroundColor: Colors.deepPurple,
                icon: Icon(Icons.monetization_on_outlined),
                label: "Payment",

              ),


              BottomNavigationBarItem(
                icon: Icon(Icons.report),
                label: "Report",
              ),


              BottomNavigationBarItem(
                icon: Icon(Icons.add_alert),
                label: "Accounccent",

              ),


              BottomNavigationBarItem(
                icon: Icon(Icons.work),
                label: "Vaccancy",

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.work),
                label: "url",

              ),

            ],
          ),
        )
    );
  }
}
