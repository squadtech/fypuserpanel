import 'package:flutter/material.dart';
import 'package:fyp/UserPanel/constant.dart';

import 'HomeScreen.dart';

class AppliedFormScreen extends StatefulWidget {
  @override
  _AppliedFormScreenState createState() => _AppliedFormScreenState();
}

class _AppliedFormScreenState extends State<AppliedFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.arrow_back), onPressed:(){
        Navigator.push(context, MaterialPageRoute(
            builder: (_) => HomePage()
        ));
      }),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Hello Fakhar,", style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      )),
                      Text("Where do you want to go?",style: TextStyle(
                          color: Colors.grey.shade700
                      ),)
                    ],
                  ),
                  CircleAvatar(backgroundImage: AssetImage('images/img.png'), radius: 40,)
                ],
              ),
            ),
            Card(
              child: GestureDetector(
                  onTap: ()=>_openDestinationPage(context),
                  child: _buildFeaturedItem( title:
                  "Matric DMC", subtitle: "90 places worth to visit")),
            ),
            Card(
              child:  GestureDetector(
                  onTap: ()=>_openDestinationPage(context),
                  child: _buildFeaturedItem(title:
                  "Fsc DMC", subtitle: "40 places worth to visit")),
            ),
            Card(
              child: GestureDetector(
                  onTap: ()=>_openDestinationPage(context),
                  child: _buildFeaturedItem( title:
                  "NTS Marks Sheet", subtitle: "90 places worth to visit")),
            ),
            Card(
              child:  GestureDetector(
                  onTap: ()=>_openDestinationPage(context),
                  child: _buildFeaturedItem(title:
                  "Student CNIC", subtitle: "40 places worth to visit")),
            ),


          ],
        ),
      ),
    );
  }

  Padding _buildFeaturedItem({String image, String title, String subtitle}) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        padding: EdgeInsets.only(left:20,right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6.0,
            ),
          ],
          color: Colors.white,
        ),
        height: 100,
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.camera_alt,size: 30,color: Constant.appColor,), onPressed: null),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(title, style: TextStyle(
                    color: Constant.appColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                )),
                Text(subtitle, style: TextStyle(
                    color: Constant.appColor
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  _openDestinationPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (_) =>HomePage()
    ));
  }
}


