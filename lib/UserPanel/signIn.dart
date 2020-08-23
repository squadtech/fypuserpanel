import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'HomeScreen.dart';
import 'constant.dart';
import 'package:fyp/UserPanel/UserpanelSignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

String _email, _password, _name;
final _emailcontroller = TextEditingController();
final _passwordcontroller = TextEditingController();

//Progress bar Initialization
ProgressDialog pr;

class _signInState extends State<signIn> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUser();
  }
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);

    return Scaffold(
      //  backgroundColor: Colors.white,
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
                    padding: EdgeInsets.only(right: 20,left: 20,top: 50),
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
                          onPressed: () {
                            signIn();
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),

                        ),
                      )),

                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "If you are not register ? ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                      GestureDetector(
                        child: Text("Sign up ",
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
                                    builder: (context) => UserPanelSignup()));
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
  //Check user
  void checkUser() async {
    String mUiD = (await FirebaseAuth.instance.currentUser()).uid;
    if(mUiD != null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }
  }


  //Sign in will be called to validate if User Exist
  Future<void> signIn() async {

    _email = _emailcontroller.text;
    _password = _passwordcontroller.text;

//On Sign In Button Press Progress bar will apear
    try{
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

      //Validate User and password
      await FirebaseAuth.instance.signInWithEmailAndPassword(email:_email , password: _password);
      pr.hide().then((isHidden) {
        print(isHidden);
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }catch(e){
      Fluttertoast.showToast(
          msg: e.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey.shade300,
          textColor: Colors.black,
          fontSize: 16.0
      );
      pr.hide().then((isHidden) {
        print(isHidden);
      });
      print(e.message);
    }
  }
}

