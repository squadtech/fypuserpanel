import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/UserPanel/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Profile_Setting extends StatefulWidget {
  @override
  _Profile_SettingState createState() => _Profile_SettingState();
}

ProgressDialog pr;
String mName = '', mDp = '', mEmail = '';
PickedFile _pickedFile;
File _imageFile;
String url;
var _nameController = TextEditingController();
final databaseReference = Firestore.instance;
DocumentSnapshot mRef;
FirebaseStorage _storage = FirebaseStorage.instance;
var _key = GlobalKey<ScaffoldState>();

class _Profile_SettingState extends State<Profile_Setting> {
  pickImage(ImageSource source) async {
    _pickedFile = await ImagePicker().getImage(source: source);
    if (_pickedFile != null) {
      _imageFile = File(_pickedFile.path);
    }
    setState(() {});
  }

  var _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    return Scaffold(
      key: _key,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Center(
              child: CircleAvatar(
                radius: 42,
                backgroundColor: Constant.appColor,
                child: GestureDetector(
                  onTap: () {
                    _openChooser();
                  },
                  child: mDp == ''
                      ? Icon(
                          Icons.add_a_photo,
                          size: 45,
                        )
                      : Center(
                          child: CircleAvatar(
                            backgroundImage: _imageFile != null
                                ? FileImage(_imageFile)
                                : mDp == ''
                                    ? AssetImage('images/img.png')
                                    : NetworkImage(mDp),
                            radius: 40,
                            backgroundColor: Constant.appColor,
                          ),
                        ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20,left: 20,top: 20),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child:   TextFormField(
                  controller: _nameController,
                  decoration:  InputDecoration(
                    labelText: "Full Name",
                    fillColor: Colors.white,
                    border:  OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(8.0),
                      borderSide:  BorderSide(
                      ),
                    ),
                    suffixIcon: Icon(Icons.person,color: Colors.red.shade600),
                  ),
                  keyboardType: TextInputType.text,
                  autofocus: false,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
              child: ButtonTheme(
                height: 50.0,
                child: RaisedButton(
                  color: Constant.appColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.red)),
                  onPressed: () {
                    profileUpdate();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Save',
                        style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
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

  void profileUpdate() async {
    if (_imageFile != null) {
      pr.style(
          message: 'Making Changes...',
          borderRadius: 10.0,
          backgroundColor: Colors.white,
          progressWidget: CircularProgressIndicator(),
          elevation: 10.0,
          insetAnimCurve: Curves.easeInOut,
          progress: 0.0,
          maxProgress: 100.0,
          progressTextStyle: TextStyle(
              color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
          messageTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 19.0,
              fontWeight: FontWeight.w600));
      await pr.show();

      StorageReference reference = _storage
          .ref()
          .child("Images/")
          .child((await FirebaseAuth.instance.currentUser()).uid);
      StorageUploadTask uploadTask = reference.putFile(_imageFile);

      uploadTask.onComplete.then((result) async {
        pr.update(
          progress: 50.0,
          message: "Please wait...",
          progressWidget: Container(
              padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
          maxProgress: 100.0,
          progressTextStyle: TextStyle(
              color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
          messageTextStyle: TextStyle(
              color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
        );

        pr.hide().then((isHidden) {
          print(isHidden);
        });
        url = await result.ref.getDownloadURL();
        String mUiD = (await FirebaseAuth.instance.currentUser()).uid;

        await databaseReference.collection("Users").document(mUiD).updateData({"user_dp": url, 'username': _nameController.text});

        Fluttertoast.showToast(
            msg: 'Profile Updated',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.grey.shade300,
            textColor: Colors.black,
            fontSize: 16.0);
      });
    } else {
      String mUiD = (await FirebaseAuth.instance.currentUser()).uid;

      await databaseReference.collection("Users").document(mUiD).updateData({

        'user_dp': url,
      });
      setState(() {

      });
      Fluttertoast.showToast(
          msg: 'Profile Updated',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey.shade300,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }

  //Get data From Database
  void getData() async {
    mRef = await Firestore.instance
        .collection("Users")
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .get();
    setState(() {
      mName = mRef["username"];
      mDp = mRef["user_dp"];
      _nameController.text = mName;
    });
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
}
