import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/UserPanel/GraduateStudent.dart';
import 'package:fyp/UserPanel/UnderGraduate.dart';
import 'package:fyp/UserPanel/constant.dart';
import 'package:fyp/UserPanel/personal_info.dart';
import 'package:fyp/UserPanel/profile_setting.dart';
import 'package:fyp/UserPanel/signIn.dart';

import 'Shortlisting.dart';
import 'informationForm.dart';
import 'notification.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
String mName = '';
String mDp = '';
String mEmail= '';
final databaseReference = Firestore.instance;
DocumentSnapshot mRef;
class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: mDp!=''?NetworkImage(mDp):AssetImage('images/kustlogo.gif'),
              ),
              accountName: mName!=''?Text(mName):Text('No Info'),
              accountEmail: mEmail!=''?Text(mEmail):Text('No Info'),
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
              title: Text("Profile  Setting"),
              leading: Icon(Icons.view_list),
              onTap: () {Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => Profile_Setting()
                  )
              );},
            ),
            ListTile(
              title: Text("Personal Information"),
              leading: Icon(Icons.view_list),
              onTap: () {Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => Personal_Information()
                  )
              );},
            ),
            Divider(height: 20.0,),
            ListTile(
              title: Text("Logout"),
              leading: GestureDetector(
                  onTap: (){
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>signIn()));
                  },
                  child: Icon(Icons.exit_to_app)),
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
                          _key.currentState.openDrawer();
                          //Scaffold.of(context).openDrawer();
                        },
                      ),
                      mName!=''?Text("Hello $mName,", style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      )):Text("Hello User,", style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      )),
                      Text("Where do you want to go?",style: TextStyle(
                          color: Colors.grey.shade700
                      ),)
                    ],
                  ),
                  CircleAvatar(backgroundImage: mDp!=''?NetworkImage(mDp):AssetImage('images/kustlogo.png'), radius: 40,)
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
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppliedFormScreen()));
                  },
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

  void getData() async {
    mRef = await Firestore.instance
        .collection("Users")
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .get();
    setState(() {
      mName = mRef["username"];
      mDp = mRef["user_dp"];
      mEmail = mRef['email'];
    });
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


