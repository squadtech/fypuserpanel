import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'constant.dart';

class InfoForm extends StatefulWidget {

  File _imageFile;
  File _imageFile2;
  File _imageFile3;
  InfoForm(this._imageFile, this._imageFile2, this._imageFile3);


  @override
  _InfoFormState createState() => _InfoFormState(_imageFile,_imageFile2,_imageFile3);
}
final programController = TextEditingController();
final domicileController = TextEditingController();
final applicantNameController = TextEditingController();
final applicFatherNameController = TextEditingController();
final dobController = TextEditingController();
final cnicController = TextEditingController();
final adressController = TextEditingController();

final fscMarkController = TextEditingController();
final matricMarkController = TextEditingController();
final NtsMarkController = TextEditingController();
final NtsRollController =TextEditingController();
final testTypeController = TextEditingController();
final fscYearController = TextEditingController();
final matricYearController = TextEditingController();
final fscInstituteController = TextEditingController();
final matricInsituteController = TextEditingController();
String getDate = 'Select Date';
class _InfoFormState extends State<InfoForm> with TickerProviderStateMixin {
  TabController tabController;

  File _imageFile;
  File _imageFile2;
  File _imageFile3;


  _InfoFormState(this._imageFile, this._imageFile2, this._imageFile3);

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information Form"),
        backgroundColor: Colors.red.shade600,
        bottom: PreferredSize(
          child: Column(
            children: <Widget>[
              TabBar(
                indicatorColor: Colors.white,
                controller: tabController,
                tabs: [
                  Tab(text: "Personal Info"),
                  Tab(
                    text: "Academic Info",
                  ),
                ],
              ),
            ],
          ),
          preferredSize: Size.fromHeight(50),
        ),
      ),
      body: TabBarView(
        children: [

          AcademicIno(),
        ],
        controller: tabController,
      ),
    );
  }

  Widget AcademicIno(){
    return Scaffold(
        body: Scrollbar(
            child: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                          width: 130.0,
                          height: 50.0,
                          color: Colors.red.shade600,
                          child: Center(
                            child: Text("SSC/Equivalent",style: TextStyle(
                                color: Colors.white
                            ),),
                          )
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Year"),
                              SizedBox(
                                height: 3.0,
                              ),
                              Container(
                                width: 130.0,
                                height: 50.0,

                                child: TextField(
                                  controller: matricYearController,
                                  decoration:  InputDecoration(
                                    border:  OutlineInputBorder(
                                      borderRadius:  BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Obtained Marks"),
                              SizedBox(
                                height: 3.0,
                              ),
                              Container(
                                width: 130.0,
                                height: 50.0,
                                child: TextField(
                                  controller: matricMarkController,
                                  decoration:  InputDecoration(
                                    border:  OutlineInputBorder(
                                      borderRadius:  BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Institute"),
                          SizedBox(height: 3.0),
                          TextFormField(
                            controller: matricInsituteController,
                            decoration:  InputDecoration(
                              fillColor: Colors.white,
                              border:  OutlineInputBorder(
                                borderRadius:  BorderRadius.circular(8.0),
                                borderSide:  BorderSide(
                                ),
                              ),

                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        width: 130.0,
                        height: 50.0,
                        color: Colors.red.shade600,
                        child: Center(
                          child: Text("FSC/Equivalent",style: TextStyle(
                              color: Colors.white
                          ),),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Year"),
                              SizedBox(
                                height: 3.0,
                              ),
                              Container(
                                width: 130.0,
                                height: 50.0,

                                child: TextField(
                                  controller: fscYearController,
                                  decoration:  InputDecoration(
                                    border:  OutlineInputBorder(
                                      borderRadius:  BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Obtained Marks"),
                              SizedBox(
                                height: 3.0,
                              ),
                              Container(
                                width: 130.0,
                                height: 50.0,
                                child: TextField(
                                  controller: fscMarkController,
                                  decoration:  InputDecoration(
                                    border:  OutlineInputBorder(
                                      borderRadius:  BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Institute"),
                          SizedBox(height: 3.0),
                          TextFormField(
                            controller: fscInstituteController,
                            decoration:  InputDecoration(
                              fillColor: Colors.white,
                              border:  OutlineInputBorder(
                                borderRadius:  BorderRadius.circular(8.0),
                                borderSide:  BorderSide(
                                ),
                              ),

                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                          width: 130.0,
                          height: 50.0,
                          color: Colors.red.shade600,
                          child: Center(
                            child: Text("NTS",style: TextStyle(
                                color: Colors.white
                            ),),
                          )
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Roll No"),
                              SizedBox(
                                height: 3.0,
                              ),
                              Container(
                                width: 130.0,
                                height: 50.0,

                                child: TextField(
                                  controller: NtsRollController ,
                                  decoration:  InputDecoration(
                                    border:  OutlineInputBorder(
                                      borderRadius:  BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Obtained Marks"),
                              SizedBox(
                                height: 3.0,
                              ),
                              Container(
                                width: 130.0,
                                height: 50.0,
                                child: TextField(
                                  controller: NtsMarkController,
                                  decoration:  InputDecoration(
                                    border:  OutlineInputBorder(
                                      borderRadius:  BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Test Type"),
                          SizedBox(height: 3.0),
                          TextFormField(
                            controller: testTypeController,
                            decoration:  InputDecoration(
                              fillColor: Colors.white,
                              border:  OutlineInputBorder(
                                borderRadius:  BorderRadius.circular(8.0),
                                borderSide:  BorderSide(
                                ),
                              ),

                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Image.file(_imageFile,height: 100,width: 100,),
                    ),
                    Expanded(
                      child: Image.file(_imageFile2,height: 100,width: 100,),
                    ),
                    Expanded(
                      child: Image.file(_imageFile3,height: 100,width: 100,),
                    )
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

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Save',style: GoogleFonts.montserrat(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
        )
    );
  }


}

