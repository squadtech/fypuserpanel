import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/UserPanel/resetPassword.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'home.dart';
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
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.only(left: 310.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40.0,
                    child: Image(image: AssetImage("images/kustlogo.gif")),
                  ),

                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.red.shade600,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                secondsignIn()
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
class secondsignIn extends StatefulWidget {
  @override
  _secondsignInState createState() => _secondsignInState();
}

class _secondsignInState extends State<secondsignIn> {
  bool _isChecked = false;
  void onChanged(bool value)
  {
    setState(() {
      _isChecked = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return    Container(
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
                      controller: _emailcontroller,
                      decoration:  InputDecoration(
                        labelText: "Email",
                        fillColor: Colors.white,
                        border:  OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(8.0),
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
                        suffixIcon: Icon(Icons.lock,color: Colors.red.shade600),
                        //fillColor: Colors.green
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),

                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool value){onChanged(value);},
                        ),
                        Text("Remember me",style: TextStyle(color: Colors.red.shade600),),
                        SizedBox(
                          width: 35.0,
                        ),
                        InkWell(
                          child: Text(
                            "Forgot password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                              color: Colors.red.shade600
                            ),
                          ),
                          onTap: () {Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Reset()
                              )
                          );},
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 220.0),
                      child: FloatingActionButton(
                        onPressed: () {Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) => theme()
                            )
                        );},
                        child: GestureDetector(
                          onTap: (){
                            signIn();
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.red.shade600,
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Divider(
                              color: Colors.black87,
                            )),
                        Text("  or  "),
                        Expanded(
                            child: Divider(
                              color: Colors.black87,
                            )),
                      ],
                    ),

                    SizedBox(
                      height: 100.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "  Create account",
                          style: TextStyle(color: Colors.white),
                        ),
                        MaterialButton(
                          onPressed: () {Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) => UserPanelSignup()
                              )
                          );},
                          child: Text(
                            "Sign up ",
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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => theme()));
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

