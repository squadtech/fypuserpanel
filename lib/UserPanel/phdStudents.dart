import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/UserPanel/PhdInformation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'constant.dart';

class PhdStudents extends StatefulWidget {
  @override
  _PhdStudentsState createState() => _PhdStudentsState();
}
final databaseReference = Firestore.instance;
var _key = GlobalKey<ScaffoldState>();
PickedFile _pickedFile;
File _imageFile;
String url;
bool isloading = true;
String mName = '';
String mDp = '';
DocumentSnapshot mRef;
class _PhdStudentsState extends State<PhdStudents> {

  pickImage(ImageSource source) async {
    _pickedFile = await ImagePicker().getImage(source: source);
    if (_pickedFile != null) {
      _imageFile = File(_pickedFile.path);
    }
    setState(() {});
  }

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
                      Text(mRef!= null?"Hello ${mRef['username']},":'Hello', style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      )),
                      Text("Where do you want to go?",style: TextStyle(
                          color: Colors.grey.shade700
                      ),)
                    ],
                  ),
                  mDp!=null?CircleAvatar(backgroundImage: NetworkImage(mDp),radius: 40,):CircleAvatar(backgroundImage: AssetImage('images/img.png'), radius: 40,)
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            child: GestureDetector(
                              onTap: () {
                                _openChooser();
                              },
                              child: _imageFile == null
                                  ? Icon(
                                Icons.add_a_photo,
                                size: 45,
                              )
                                  : CircleAvatar(
                                backgroundImage: FileImage(_imageFile),
                                radius: 38,
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text('MS/Mphill/Equalent Marksheet',style: GoogleFonts.montserrat(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22,),

              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 15),
              child: ButtonTheme(
                height: 50.0,
                child: RaisedButton(
                  color: Constant.appColor,
                  shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.red)
                  ),
                  onPressed: (){
                    if(_imageFile!=null){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PhdInformation(_imageFile)));

                    }
                    else{
                      Fluttertoast.showToast(msg: "Select Image First");
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Next',style: GoogleFonts.montserrat(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),)
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  void _openChooser() {
    _key.currentState.showBottomSheet((context) {
      return Container(
        padding: EdgeInsets.all(16),
        height: 100,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    size: 55,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.image,
                    size: 52,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  //Get data From Database
  void getData() async {
    mRef = await Firestore.instance
        .collection("Users")
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .get();
    setState(() {
      isloading = false;
      mName = mRef["username"];
      mDp = mRef["user_dp"];
    });
  }
}
