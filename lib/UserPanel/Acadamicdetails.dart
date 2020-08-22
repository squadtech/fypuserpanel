import 'package:flutter/material.dart';

class AcadamicDetails extends StatefulWidget {
  @override
  _AcadamicDetailsState createState() => _AcadamicDetailsState();
}

class _AcadamicDetailsState extends State<AcadamicDetails> {
  @override
  Widget build(BuildContext context) {
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
              ],
            )
        )
    );
  }
}
