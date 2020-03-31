import 'package:flutter/material.dart';
import 'package:fyp/UserPanel/GraduateStudent.dart';
import 'package:fyp/UserPanel/UnderGraduate.dart';
import 'package:fyp/UserPanel/constant.dart';

import 'Shortlisting.dart';
import 'informationForm.dart';
import 'notification.dart';

class HomePage extends StatelessWidget {
  final GlobalKey _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person,color: Colors.red.shade600,),
                backgroundColor: Colors.white,
              ),
              accountName: Text("faaiz"),
              accountEmail: Text("faaiz11@gmail.com"),
            ),
            ListTile(
              title: Text("Merit List"),
              leading: Icon(Icons.view_list),
              onTap: () {Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => Shortlisting()
                  )
              );},
            ),
            ListTile(
              title: Text("Notifications"),
              leading: Icon(Icons.notifications),
              onTap: () {Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => notify()
                  )
              );},

            ),
            ListTile(
              title: Text("information form"),
              leading: Icon(Icons.view_list),
              onTap: () {Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => InfoForm()
                  )
              );},
            ),
            Divider(height: 20.0,),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                          //Scaffold.of(context).openDrawer();
                        },
                      ),
                      Text("Hello Fakhar,", style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      )),
                      Text("Where do you want to go?",style: TextStyle(
                          color: Colors.grey.shade700
                      ),)
                    ],
                  ),
                  CircleAvatar(backgroundImage: AssetImage('images/kustlogo.png'), radius: 40,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
              child: Material(
                elevation: 5.0,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Find department",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none
                  ),
                ),
              ),
            ),
            Card(
              child: GestureDetector(
                  onTap: ()=>  Navigator.push(context, MaterialPageRoute(
                      builder: (_) => AppliedFormScreen()
                  )),
                  child: _buildFeaturedItem( title:
                  "Undergraduate", description: "90 places worth to visit")),
            ),
            Card(
              child:  GestureDetector(
                  onTap: ()=>  Navigator.push(context, MaterialPageRoute(
                      builder: (_) => AppliedFormForGraduate()
                  )),
                  child: _buildFeaturedItem(title:
                  "Graduate", description: "40 places worth to visit")),
            ),

            Card(
              child:  GestureDetector(
                  onTap: ()=>  Navigator.push(context, MaterialPageRoute(
                      builder: (_) =>  AppliedFormForGraduate()
                  )),
                  child: _buildFeaturedItem(title:
                  "PDH", description: "40 places worth to visit")),
            ),

          ],
        ),
      ),
    );
  }

  Padding _buildFeaturedItem({String image, String title, String description}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                Text(description, style: TextStyle(
                    color: Constant.appColor
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }

}


