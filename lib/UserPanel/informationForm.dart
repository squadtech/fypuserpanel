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
    tabController = TabController(length: 2, vsync: this);
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
        PersonalInfo() ,
          AcademicIno(),
        ],
        controller: tabController,
      ),
    );
  }

  Widget PersonalInfo(){
    return  Scrollbar(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 16.0,
                  ),
                  Text("Program",style: TextStyle(
                      color: Colors.black
                  ),),
                  SizedBox(
                    height: 6.0,
                  ),
                  TextFormField(
                    controller: programController,
                    decoration:  InputDecoration(
                      fillColor: Colors.white,
                      border:  OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(8.0),
                        borderSide:  BorderSide(
                        ),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text("Domicle",style: TextStyle(
                      color: Colors.black
                  ),),
                  SizedBox(
                    height: 6.0,
                  ),
                  TextFormField(
                    controller: domicileController,

                    decoration:  InputDecoration(
                      fillColor: Colors.white,
                      border:  OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(8.0),
                        borderSide:  BorderSide(
                        ),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text("Applicant Name",style: TextStyle(
                      color: Colors.black
                  ),),
                  SizedBox(
                    height: 6.0,
                  ),
                  TextFormField(
                    controller: applicantNameController,

                    decoration:  InputDecoration(
                      fillColor: Colors.white,
                      border:  OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(8.0),
                        borderSide:  BorderSide(
                        ),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text("Applicant's Father Name",style: TextStyle(
                      color: Colors.black
                  ),),
                  SizedBox(
                    height: 6.0,
                  ),
                  TextFormField(
                    controller: applicFatherNameController,

                    decoration:  InputDecoration(
                      fillColor: Colors.white,
                      border:  OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(8.0),
                        borderSide:  BorderSide(
                        ),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text("Date Of Birth",style: TextStyle(
                      color: Colors.black
                  ),),
                  SizedBox(
                    height: 6.0,
                  ),
                  GestureDetector(
                    onTap: () async {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          theme: DatePickerTheme(
                              headerColor: Colors.green,
                              backgroundColor: Colors.blue,
                              itemStyle: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                              doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
                          onChanged: (date) {
                            print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                          }, onConfirm: (date) {
                            setState(() {
                              getDate = DateFormat('dd-MM-yyyy').format(date);
                            });
                            print('confirm $date');
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        child: Center(child: Text(getDate)),
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 2.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text("Student CNIC",style: TextStyle(
                      color: Colors.black
                  ),),
                  SizedBox(
                    height: 6.0,
                  ),
                  TextFormField(
                    controller: cnicController,

                    decoration:  InputDecoration(
                      fillColor: Colors.white,
                      border:  OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(8.0),
                        borderSide:  BorderSide(
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text("Residential Adress",style: TextStyle(
                      color: Colors.black
                  ),),
                  SizedBox(
                    height: 6.0,
                  ),
                  TextFormField(
                    controller: adressController,
                    maxLines: 2,
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
                    _saveInfo();
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
                              Text("T.Marks"),
                              SizedBox(
                                height: 3.0,
                              ),
                              Container(
                                width: 130.0,
                                height: 50.0,
                                child: TextField(
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
                              Text("T.Marks"),
                              SizedBox(
                                height: 3.0,
                              ),
                              Container(
                                width: 130.0,
                                height: 50.0,
                                child: TextField(
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
                              Text("T.Marks"),
                              SizedBox(
                                height: 3.0,
                              ),
                              Container(
                                width: 130.0,
                                height: 50.0,
                                child: TextField(
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
                )
              ],
            )
        )
    );
  }

  void _saveInfo() async {
    String mUid = (await FirebaseAuth.instance.currentUser()).uid;
    if(programController.text!='' && cnicController.text!=''
        &&applicantNameController.text!=''
        &&applicFatherNameController.text!=''
        &&domicileController.text!=''
        &&adressController.text!=''&&getDate!='Select Date'){
      await Firestore.instance.collection('Personal_info').document(mUid).setData({
        'program':programController.text,
        'cnic':cnicController.text,
        'name':applicantNameController.text,
        'fathername':applicFatherNameController.text,
        'adress':adressController.text,
        'domicile':domicileController.text,
        'date':getDate,
      }).whenComplete((){
        Fluttertoast.showToast(msg: "Information Saved");
      }).catchError((){
        Fluttertoast.showToast(msg: "Something went wrong");
      });
    }
    else{
      Fluttertoast.showToast(msg: 'Some fields are missing');
    }

  }
}

