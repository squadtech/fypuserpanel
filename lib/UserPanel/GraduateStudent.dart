import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/UserPanel/HomeScreen.dart';
import 'package:fyp/UserPanel/constant.dart';
import 'package:image_picker/image_picker.dart';

class AppliedFormForGraduate extends StatefulWidget {
  @override
  _AppliedFormForGraduateState createState() => _AppliedFormForGraduateState();
}

class _AppliedFormForGraduateState extends State<AppliedFormForGraduate> {
  final databaseReference = Firestore.instance;
  File _image;
  String _uploadedFileURL;
  String url;
  bool isloading = true;
  String mName = '';
  String mDp='';
  DocumentSnapshot mRef;

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
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
            Card(
              child: GestureDetector(
                  onTap: (){
                    uploadmatricdmc();
                  },
                  child: _buildFeaturedItem( title:
                  "Matric DMC", subtitle: "90 places worth to visit")),
            ),
            Card(
              child:  GestureDetector(
                  onTap: (){
                    uploadfscdmc();
                  },
                  child: _buildFeaturedItem(title:
                  "Fsc DMC", subtitle: "40 places worth to visit")),
            ),
            Card(
              child: GestureDetector(
                  onTap: (){
                    uploadGatmarksheet();
                  },
                  child: _buildFeaturedItem( title:
                  "GAT Marks Sheet", subtitle: "90 places worth to visit")),
            ),
            Card(
              child: GestureDetector(
                  onTap: (){
                    uploadBsScript();
                  },
                  child: _buildFeaturedItem( title:
                  "BS Transcript", subtitle: "90 places worth to visit")),
            ),
            Card(
              child:  GestureDetector(
                  onTap: (){
                    uploadcnic();
                  },
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
        builder: (_) => HomePage()
    ));
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
  FirebaseStorage _storage = FirebaseStorage.instance;
//Upload Profile Picture To Database
  Future<Uri> uploadmatricdmc() async {

    //Get the file from the image picker and store it
    _image = await ImagePicker.pickImage(source: ImageSource.gallery);

    String mUid = (await FirebaseAuth.instance.currentUser()).uid;

    //Create a reference to the location you want to upload to in firebase
    StorageReference reference = _storage.ref().child("graduation/").child((await FirebaseAuth.instance.currentUser()).uid);

    //Upload the file to firebase
    StorageUploadTask uploadTask = reference.putFile(_image);
    uploadTask.onComplete.then((result) async {
      url = await result.ref.getDownloadURL();

      await databaseReference.collection("graduation").document(mUid).setData({

        'metric_dmc': url,

      }, merge: true,);
      Fluttertoast.showToast(
          msg: 'Matric DMC Uploaded',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey.shade200,
          textColor: Colors.black,
          fontSize: 16.0
      );
      setState(() {

      });
    });

  }
  Future<Uri> uploadfscdmc() async {

    //Get the file from the image picker and store it
    _image = await ImagePicker.pickImage(source: ImageSource.gallery);

    String mUid = (await FirebaseAuth.instance.currentUser()).uid;

    //Create a reference to the location you want to upload to in firebase
    StorageReference reference = _storage.ref().child("graduation/").child((await FirebaseAuth.instance.currentUser()).uid);

    //Upload the file to firebase
    StorageUploadTask uploadTask = reference.putFile(_image);
    uploadTask.onComplete.then((result) async {
      url = await result.ref.getDownloadURL();

      await databaseReference.collection("graduation").document(mUid).setData({

        'fsc_dmc': url,

      }, merge: true,);
      Fluttertoast.showToast(
          msg: 'FSC DMC Uploaded',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey.shade200,
          textColor: Colors.black,
          fontSize: 16.0
      );
      setState(() {

      });
    });

  }
  Future<Uri> uploadGatmarksheet() async {

    //Get the file from the image picker and store it
    _image = await ImagePicker.pickImage(source: ImageSource.gallery);

    String mUid = (await FirebaseAuth.instance.currentUser()).uid;

    //Create a reference to the location you want to upload to in firebase
    StorageReference reference = _storage.ref().child("graduation/").child((await FirebaseAuth.instance.currentUser()).uid);

    //Upload the file to firebase
    StorageUploadTask uploadTask = reference.putFile(_image);
    uploadTask.onComplete.then((result) async {
      url = await result.ref.getDownloadURL();

      await databaseReference.collection("graduation").document(mUid).setData({

        'gat_marksheet': url,

      }, merge: true,);
      Fluttertoast.showToast(
          msg: 'NTS Marksheet Uploaded',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey.shade200,
          textColor: Colors.black,
          fontSize: 16.0
      );
      setState(() {

      });
    });

  }
  Future<Uri> uploadcnic() async {

    //Get the file from the image picker and store it
    _image = await ImagePicker.pickImage(source: ImageSource.gallery);

    String mUid = (await FirebaseAuth.instance.currentUser()).uid;

    //Create a reference to the location you want to upload to in firebase
    StorageReference reference = _storage.ref().child("graduation/").child((await FirebaseAuth.instance.currentUser()).uid);

    //Upload the file to firebase
    StorageUploadTask uploadTask = reference.putFile(_image);
    uploadTask.onComplete.then((result) async {
      url = await result.ref.getDownloadURL();

      await databaseReference.collection("graduation").document(mUid).setData({

        'cnic': url,

      }, merge: true,);
      Fluttertoast.showToast(
          msg: 'CNIC Uploaded',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey.shade200,
          textColor: Colors.black,
          fontSize: 16.0
      );
      setState(() {

      });
    });

  }

  Future<Uri> uploadBsScript() async {

    //Get the file from the image picker and store it
    _image = await ImagePicker.pickImage(source: ImageSource.gallery);

    String mUid = (await FirebaseAuth.instance.currentUser()).uid;

    //Create a reference to the location you want to upload to in firebase
    StorageReference reference = _storage.ref().child("graduation/").child((await FirebaseAuth.instance.currentUser()).uid);

    //Upload the file to firebase
    StorageUploadTask uploadTask = reference.putFile(_image);
    uploadTask.onComplete.then((result) async {
      url = await result.ref.getDownloadURL();

      await databaseReference.collection("graduation").document(mUid).setData({

        'bs_transcript': url,

      }, merge: true,);
      Fluttertoast.showToast(
          msg: 'Bs Transcript Uploaded',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey.shade200,
          textColor: Colors.black,
          fontSize: 16.0
      );
      setState(() {

      });
    });

  }
}


