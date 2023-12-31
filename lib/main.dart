import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_curve_nav_bar/people.dart';
import 'package:flutter_curve_nav_bar/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final items = const[
    Icon(Icons.people, size:30),
     Icon(Icons.person, size:30),
     Icon(Icons.add, size:30),
     Icon(Icons.search_outlined, size:30),
  ];
   
   int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('Curved Navigation Bar'),
        backgroundColor: Colors.blueGrey[300],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selectedIndex){
          setState(() {
           index = selectedIndex; 
          });
        },
        height: 70.0,
        backgroundColor: Colors.transparent,
        animationDuration: Duration(microseconds: 300),
      ),
      body: Container(
        color: Colors.blue,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: getSelectedWidget(index: index),
      ),
    );
  }
  Widget getSelectedWidget({ required int index}){
    Widget widget;
    switch(index){
      case 0:
      widget = const People();
      break;
       case 1:
      widget = const Profile();
      break;
      default: 

      widget = const People();
      break;
    }
    return widget;
  }
}