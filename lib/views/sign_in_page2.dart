import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lost_and_found/services/google.dart';
import 'package:lost_and_found/views/sign_up_page2.dart';
import 'package:lost_and_found/views/signin_button.dart';
import 'package:lost_and_found/utils/teddy_controller.dart';
import 'package:lost_and_found/views/tracking_text_input.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:lost_and_found/services/auth.dart';
import 'package:lost_and_found/views/home_page.dart';

class MyHomePage extends StatefulWidget {
  
  static const String routeName = '/signin2';
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _loading = false;
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  bool _obscurePassword = true;
  TeddyController _teddyController;

   bool _isLoading = false;

  Future<bool> _loginUser() async {
    final api = await FBApi.signInWithGoogle();
    if (api != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  initState() {
    _teddyController = TeddyController();
    super.initState();
  }

 
  void _entrando({bool enable}) {
    setState(() {
      _loading = enable;
    });
  }
  
  Widget _showLoading() {
    return Container(
      width: 19.0,
      height: 19.0,
      child: CircularProgressIndicator(backgroundColor: Colors.blue,) ,
    );
  }

  Future<void> _signIn() async {
    _entrando(enable: true);
    final email = _emailController.text;
    final password = _passwordController.text;
    await Auth.signIn(email, password)
        .then(_onSignInSuccess)
        .catchError((error) {
      print('Caught error: $error');
      Flushbar(
        title: 'Erro',
        message: error.toString(),
        duration: Duration(seconds: 3),
      )..show(context);
    });
  }

   Future _onSignInSuccess(String userId) async {
     _teddyController.play("success");
    final user = await Auth.getUser(userId);
    await Auth.storeUserLocal(user);
    _entrando(enable: false);
    Future.delayed(const Duration(milliseconds: 420),
    () =>setState(
      (){
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      }
    ),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: Color.fromRGBO(93, 142, 155, 1.0),
      body: Container(
          child: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.0, 1.0],
                colors: [
                  Color.fromRGBO(174, 174, 89, 1.0),
                  Color.fromRGBO(174, 174, 89, 1.0),
                ],
              ),
            ),
          )),
          Positioned.fill(
            child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: devicePadding.top + 50.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 200,
						  padding: const EdgeInsets.only(left: 30.0, right:30.0),
                          child: FlareActor(
                            "assets/Teddy.flr",
                            shouldClip: false,
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.contain,
                            controller: _teddyController,
                          )),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Form(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[

                                TrackingTextInput(
                                    label: "Email",
                                    hint: '',
                                    onCaretMoved: (Offset caret) {
                                      _teddyController.lookAt(caret);
                                    },
                                    onTextChanged: (String value)
                                    {
                                      _emailController.text = value;
                                    },
                                      
                                    ),
                                TrackingTextInput(
                                  
                                  label: "Senha",
                                  hint: "",
                                  isObscured: _obscurePassword,
                                  onCaretMoved: (Offset caret) {
                                    _teddyController.coverEyes(caret != null);
                                    _teddyController.lookAt(null);
                                  },
                                  onTextChanged: (String value) {
                                    _teddyController.setPassword(value);
                                    _passwordController.text = value;
                                  },
                                ),
                                SigninButton(
                                    child: _loading ? _showLoading() :
                                    Text("Entrar",
                                        style: TextStyle(
                                            fontFamily: "RobotoMedium",
                                            fontSize: 19,
                                            color: Colors.white)),
                                    onPressed: _signIn,
                                    ),
                                Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                                FlatButton(
                                  child: Text('Registre-se', style: TextStyle(color: Colors.black, 
                                  fontSize: 16, 
                                  fontFamily:"RobotoMedium" 
                                  ),),
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, LoginPage.routeName);
                                  },
                                ),
                                Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.black,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    "Ou",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: "WorkSansMedium"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.black,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0, right: 40.0,left: 45),
                    child: new IconButton(
                      icon: Icon(FontAwesomeIcons.google, color: Colors.pinkAccent,),
                      onPressed: () async {
                  setState(() => _isLoading = true);
                  bool b = await _loginUser();
                  setState(() => _isLoading = false);
                  if (b == true) {
                     Navigator.pushReplacementNamed(context, HomePage.routeName);
                  } else {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("Wrong email or")));
                  }
                },
                    ),
                   
              ),
            ],
          ),

                              ],
                            )),
                          )),
                    ])),
          ),
        ],
      )),
    );
  }
}