import 'dart:io';
import 'package:fyp/UserPanel/informationForm.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/UserPanel/constant.dart';

import 'HomeScreen.dart';

class AppliedFormScreen extends StatefulWidget {
  @override
  _AppliedFormScreenState createState() => _AppliedFormScreenState();
}


class _AppliedFormScreenState extends State<AppliedFormScreen> {
  final databaseReference = Firestore.instance;
  var _key = GlobalKey<ScaffoldState>();
  PickedFile _pickedFile;
  File _imageFile;
  PickedFile _pickedFile2;
  File _imageFile2;
  PickedFile _pickedFile3;
  File _imageFile3;
  String _uploadedFileURL;
  String url;
  bool isloading = true;
  String mName = '';
  String mDp = '';
  DocumentSnapshot mRef;
  pickImage(ImageSource source) async {
    _pickedFile = await ImagePicker().getImage(source: source);
    if (_pickedFile != null) {
      _imageFile = File(_pickedFile.path);
    }
    setState(() {});
  }
  pickImage2(ImageSource source) async {
    _pickedFile2 = await ImagePicker().getImage(source: source);
    if (_pickedFile2 != null) {
      _imageFile2 = File(_pickedFile2.path);
    }
    setState(() {});
  }
  pickImage3(ImageSource source) async {
    _pickedFile3 = await ImagePicker().getImage(source: source);
    if (_pickedFile3 != null) {
      _imageFile3 = File(_pickedFile3.path);
    }
    setState(() {});
  }
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: isloading ?Container():SafeArea(
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
                      mRef['username']!=null?Text("Hello ${mRef['username']},", style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      )):Text('Hello'),
                      Text("Where do you want to go?",style: TextStyle(
                          color: Colors.grey.shade700
                      ),)
                    ],
                  ),
                  mDp!=''?CircleAvatar(backgroundImage: NetworkImage(mDp), radius: 40,):CircleAvatar(backgroundImage: AssetImage('images/img.png'), radius: 40,)
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
                          Text('Matric DMC',style: GoogleFonts.montserrat(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22,),
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
                                _openChooser2();
                              },
                              child: _imageFile2 == null
                                  ? Icon(
                                Icons.add_a_photo,
                                size: 45,
                              )
                                  : CircleAvatar(
                                backgroundImage: FileImage(_imageFile2),
                                radius: 38,
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text('FSC DMC',style: GoogleFonts.montserrat(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22,),

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
                                _openChooser3();
                              },
                              child: _imageFile3 == null
                                  ? Icon(
                                Icons.add_a_photo,
                                size: 45,
                              )
                                  : CircleAvatar(
                                backgroundImage: FileImage(_imageFile3),
                                radius: 38,
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text('NTS MARKSHEET',style: GoogleFonts.montserrat(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),
                    ),
                  ),
                ),
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
                    if(_imageFile!=null && _imageFile2!=null && _imageFile3!=null){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoForm(_imageFile,_imageFile2,_imageFile3)));

                    }else{
                      Fluttertoast.showToast(msg: "Select All Images");

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
//  Future<Uri> uploadmatricdmc() async {
//
//    //Get the file from the image picker and store it
//    _image = await ImagePicker.pickImage(source: ImageSource.gallery);
//
//    String mUid = (await FirebaseAuth.instance.currentUser()).uid;
//
//    //Create a reference to the location you want to upload to in firebase
//    StorageReference reference = _storage.ref().child("undergradution/").child((await FirebaseAuth.instance.currentUser()).uid);
//
//    //Upload the file to firebase
//    StorageUploadTask uploadTask = reference.putFile(_image);
//    uploadTask.onComplete.then((result) async {
//      url = await result.ref.getDownloadURL();
//
//      await databaseReference.collection("undergradution").document(mUid).setData({
//
//        'metric_dmc': url,
//
//      }, merge: true,);
//      Fluttertoast.showToast(
//          msg: 'Matric DMC Uploaded',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
//          backgroundColor: Colors.grey.shade200,
//          textColor: Colors.black,
//          fontSize: 16.0
//      );
//      setState(() {
//
//      });
//    });
//
//  }
//  Future<Uri> uploadfscdmc() async {
//
//    //Get the file from the image picker and store it
//    _image = await ImagePicker.pickImage(source: ImageSource.gallery);
//
//    String mUid = (await FirebaseAuth.instance.currentUser()).uid;
//
//    //Create a reference to the location you want to upload to in firebase
//    StorageReference reference = _storage.ref().child("undergradution/").child((await FirebaseAuth.instance.currentUser()).uid);
//
//    //Upload the file to firebase
//    StorageUploadTask uploadTask = reference.putFile(_image);
//    uploadTask.onComplete.then((result) async {
//      url = await result.ref.getDownloadURL();
//
//      await databaseReference.collection("undergradution").document(mUid).setData({
//
//        'fsc_dmc': url,
//
//      }, merge: true,);
//      Fluttertoast.showToast(
//          msg: 'FSC DMC Uploaded',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
//          backgroundColor: Colors.grey.shade200,
//          textColor: Colors.black,
//          fontSize: 16.0
//      );
//      setState(() {
//
//      });
//    });
//
//  }
//  Future<Uri> uploadntsmarksheet() async {
//
//    //Get the file from the image picker and store it
//    _image = await ImagePicker.pickImage(source: ImageSource.gallery);
//
//    String mUid = (await FirebaseAuth.instance.currentUser()).uid;
//
//    //Create a reference to the location you want to upload to in firebase
//    StorageReference reference = _storage.ref().child("undergradution/").child((await FirebaseAuth.instance.currentUser()).uid);
//
//    //Upload the file to firebase
//    StorageUploadTask uploadTask = reference.putFile(_image);
//    uploadTask.onComplete.then((result) async {
//      url = await result.ref.getDownloadURL();
//
//      await databaseReference.collection("undergradution").document(mUid).setData({
//
//        'nts_marksheet': url,
//
//      }, merge: true,);
//      Fluttertoast.showToast(
//          msg: 'NTS Marksheet Uploaded',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
//          backgroundColor: Colors.grey.shade200,
//          textColor: Colors.black,
//          fontSize: 16.0
//      );
//      setState(() {
//
//      });
//    });
//
//  }
//  Future<Uri> uploadcnic() async {
//
//    //Get the file from the image picker and store it
//    _image = await ImagePicker.pickImage(source: ImageSource.gallery);
//
//    String mUid = (await FirebaseAuth.instance.currentUser()).uid;
//
//    //Create a reference to the location you want to upload to in firebase
//    StorageReference reference = _storage.ref().child("undergradution/").child((await FirebaseAuth.instance.currentUser()).uid);
//
//    //Upload the file to firebase
//    StorageUploadTask uploadTask = reference.putFile(_image);
//    uploadTask.onComplete.then((result) async {
//      url = await result.ref.getDownloadURL();
//
//      await databaseReference.collection("undergradution").document(mUid).setData({
//
//        'cnic': url,
//
//      }, merge: true,);
//      Fluttertoast.showToast(
//          msg: 'CNIC Uploaded',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
//          backgroundColor: Colors.grey.shade200,
//          textColor: Colors.black,
//          fontSize: 16.0
//      );
//      setState(() {
//
//      });
//    });
//
//  }


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
  void _openChooser2() {
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
                    pickImage2(ImageSource.camera);
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
                    pickImage2(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
  void _openChooser3() {
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
                    pickImage3(ImageSource.camera);
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
                    pickImage3(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}


