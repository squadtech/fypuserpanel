import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class notify extends StatefulWidget {
  @override
  _notifyState createState() => _notifyState();
}

class _notifyState extends State<notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade600,
        title: Text("Notifications"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 25),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context , int index){
                    return buildList(context, index);
                  }
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Name',style: GoogleFonts.montserrat(fontSize: 16,fontWeight:FontWeight.w500,color: Colors.black54),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Program',style: GoogleFonts.montserrat(fontSize: 14,fontWeight:FontWeight.w500,color: Colors.grey),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('List#',style: GoogleFonts.montserrat(fontSize: 12,fontWeight:FontWeight.w500,color: Colors.grey),),
          ),
          Divider(),
        ],
      ),
    );
  }
}
