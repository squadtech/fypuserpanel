import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';

class InformationGradute extends StatefulWidget {
  File _imageFile;
  File _imageFile2;

  InformationGradute(this._imageFile, this._imageFile2, );
  @override
  _InformationGraduteState createState() => _InformationGraduteState(_imageFile,_imageFile2);
}
final bsInfo = TextEditingController();
final bsYear = TextEditingController();
final bsInstitute = TextEditingController();
final GatType = TextEditingController();
final GatInfo = TextEditingController();
final GatRoll = TextEditingController();
class _InformationGraduteState extends State<InformationGradute> {


  File _imageFile;
  File _imageFile2;


  _InformationGraduteState(this._imageFile, this._imageFile2,);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                            child: Text("BS(Hons)/Equivalent",style: TextStyle(
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
                                  controller: bsYear,
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
                              Text("CGPA"),
                              SizedBox(
                                height: 3.0,
                              ),
                              Container(
                                width: 130.0,
                                height: 50.0,
                                child: TextField(
                                  controller: bsInfo,
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
                            controller: bsInstitute,
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

                    SizedBox(height: 5.0,),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                          width: 130.0,
                          height: 50.0,
                          color: Colors.red.shade600,
                          child: Center(
                            child: Text("GAT",style: TextStyle(
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
                                  controller: GatRoll ,
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
                                  controller: GatInfo,
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
                            controller: GatType,
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
