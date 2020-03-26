import'package:flutter/material.dart';
import 'package:fyp/UserPanel/signIn.dart';


void main()=>runApp(
  MaterialApp(
    home:MyApp() ,
  )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: signIn(),
    );
  }
}
