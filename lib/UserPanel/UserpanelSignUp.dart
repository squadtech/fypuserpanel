import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'signIn.dart';

class UserPanelSignup extends StatefulWidget {
  @override
  _UserPanelSignInState createState() => _UserPanelSignInState();
}

bool _validate = false;
String _email, _password, _name;
final databaseReference = Firestore.instance;
final _emailcontroller = TextEditingController();
final _passwordcontroller = TextEditingController();
final _namecontroller = TextEditingController();
ProgressDialog pr;
class _UserPanelSignInState extends State<UserPanelSignup> {

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Material(
          child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: null,
            ),
            Container(
              padding: EdgeInsets.only(left: 290.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40.0,
                    child: Image(image: AssetImage("images/kustlogo.gif")),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                ],
              ),
            ),
            Column(
             // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                 Row(
                    children: <Widget>[
                      SizedBox(
                        width: 35.0,
                      ),
                      Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.red.shade600,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),

                secondSignup()
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class secondSignup extends StatefulWidget {
  @override
  _secondSignupState createState() => _secondSignupState();
}

class _secondSignupState extends State<secondSignup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 35.0, right: 35.0),
      child: Stack(
        children: <Widget>[
          Form(
              child: Theme(
            data: ThemeData(
                inputDecorationTheme: InputDecorationTheme(
                    labelStyle:
                        TextStyle(color: Colors.black87, fontSize: 20.0))),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 12.0,
                ),
                 TextFormField(
                   controller: _namecontroller,
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
                SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: _emailcontroller,
                  decoration:  InputDecoration(
                    labelText: "Email",
                    fillColor: Colors.white,
                    border:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:  BorderSide(
                      ),
                    ),
                    suffixIcon: Icon(Icons.email,color: Colors.red.shade600),
                    //fillColor: Colors.green
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: _passwordcontroller,
                  decoration:  InputDecoration(
                    labelText: "Password",
                    fillColor: Colors.white,
                    border:  OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(8.0),
                      borderSide:  BorderSide(
                      ),
                    ),
                    suffixIcon: Icon(Icons.remove_red_eye,color: Colors.red.shade600),
                    //fillColor: Colors.green
                  ),

                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
                SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 220.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      signUp();
                    },
                    child: Icon(

                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.red.shade600,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      " Already have an account",
                      style: TextStyle(color: Colors.black45),
                    ),
                    MaterialButton(
                      onPressed: () {Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) => signIn()
                          )
                      );},
                      child: Text(
                        "Sign in ",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
  //Sign up function will check If user Email is valid or not
  void signUp() async {
    _email = _emailcontroller.text;
    _password = _passwordcontroller.text;
    _name = _namecontroller.text;
//Progress bar will Shown
    try {
      pr.style(
          message: 'Please Wait...',
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
              color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
      );
      await pr.show();

      //Create User If All details Are Correct
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);

      String mUid = (await FirebaseAuth.instance.currentUser()).uid;
//Upload User Details To Firestore cloud
      await databaseReference.collection("Users")
          .document(mUid).setData({
        'user_uid':  (await FirebaseAuth.instance.currentUser()).uid,
        'username': _name,
        'email': _email,
        'password': _password,
        'user_dp' : ""
      });
      pr.hide().then((isHidden) {
        print(isHidden);
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => signIn()));
    } catch (e) {
      pr.hide().then((isHidden) {
        print(isHidden);
      });
      print(e.message);
    }
  }
}
