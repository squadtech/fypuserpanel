import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';

class PhdInformation extends StatefulWidget {
  File _imageFile;


  PhdInformation(this._imageFile);

  @override
  _PhdInformationState createState() => _PhdInformationState(_imageFile);
}
final msInfo = TextEditingController();
final msYear = TextEditingController();
final msInstitute = TextEditingController();
class _PhdInformationState extends State<PhdInformation> {
  File _imageFile;

  _PhdInformationState(this._imageFile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Column(
        children: [
          Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50,),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Container(
                    height: 50.0,
                    color: Colors.red.shade600,
                    child: Center(
                      child: Text("MS/Mphill/Equivalent",style: TextStyle(
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
                            controller: msYear,
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
                            controller: msInfo,
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
                      controller: msInstitute,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Image.file(_imageFile,height: 100,width: 100,),
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
          ),

        ],
      ),),
    );
  }
}
