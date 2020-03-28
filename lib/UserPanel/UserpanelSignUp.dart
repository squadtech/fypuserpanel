import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/UserPanel/HomeScreen.dart';
import 'package:fyp/UserPanel/constant.dart';
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
    return Scaffold(

      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.png"),
                fit: BoxFit.fill,
              ),
            ),
            child:  Padding(
              padding: const EdgeInsets.only(top:50),
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 60.0,
                            child: Image(image: AssetImage("images/kustlogo.gif")),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20,left: 20,top: 20),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child:   TextFormField(
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
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20,left: 20,top: 20),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: TextFormField(
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
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20,left: 20,top: 20),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child:   TextFormField(
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
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.red.shade600),
                        child: FlatButton(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                          onPressed: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                            });
                          },
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "I have an Account ? ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                      GestureDetector(
                        child: Text("Already Sign in ",
                            style: TextStyle(
                                color: Constant.appColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                decoration: TextDecoration.underline)),
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                   builder: (context) => HomePage()));
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],

      ),

    );
  }
}

  //Sign up function will check If user Email is valid or not
  /*void signUp() async {
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
}*/
