import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'homepage_screen.dart';

import '../widgets/auth_item.dart';

// import '../providers/auth.dart';


enum AuthMode{
  Signup, Login
}


class AuthScreen extends StatefulWidget {

  const AuthScreen({
    Key key,
  }) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'name': '',
    'mobNumber': '',
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  void _switchAuthMode(){
    if(_authMode == AuthMode.Login){
      setState(() {
        _authMode = AuthMode.Signup;
      });
    }else{
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  Future<void> _submit() async{
    // if(!_formKey.currentState.validate()){
    //   return ;
    // }
    // _formKey.currentState.save();
    // setState(() {
    //   _isLoading = true;
    // });
    if(_authMode == AuthMode.Login){
      Navigator.of(context).pushNamed(HomepageScreen.routeName);

    }else{
      Navigator.of(context).pushNamed(HomepageScreen.routeName);
      // await Provider.of<Auth>(context, listen: false).signup(_authData['email'], _authData['password']);
    }
    // setState(() {
    //   _isLoading = false;
    // });
  }


  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColorLight,
                  Theme.of(context).primaryColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0,1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Flexible(
                  //   child:
                    Container(
                      // margin: EdgeInsets.only(bottom: 20),
                      // padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                      // transform: Matrix4.rotationZ(-8 * pi/180)..translate(-10.0),
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20),
                      //     color: Colors.deepOrange.shade900,
                      //     boxShadow: [
                      //       BoxShadow(
                      //         blurRadius: 8,
                      //         color: Colors.black26,
                      //         offset: Offset(0, 2),
                      //       )
                      //     ]
                      // ),
                      child: Text(
                        'LOGO',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    ),
                  // ),
                  // Container(
                  //   height: Auth
                  //   deviceSize.height*0.7,
                  // // Flexible(
                  // //   flex: 2,
                  //   // flex: deviceSize.width>200 ?2 :1,
                  //   child:
                  Container(
                    height: _authMode == AuthMode.Signup ?deviceSize.height*0.7 :deviceSize.height*0.3,
                    constraints: BoxConstraints(minHeight: _authMode == AuthMode.Signup ?320 :260),
                    width: deviceSize.width * 0.8,
                    padding: EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            if(_authMode == AuthMode.Signup)
                              Container(
                                height: deviceSize.height*0.1,
                                child: TextFormField(
                                  enabled: _authMode == AuthMode.Signup,
                                  decoration: InputDecoration(
                                      fillColor: Theme.of(context).canvasColor,
                                      filled: true,
                                      hintText: 'Enter Your Name',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                  // obscureText: true,
                                  // validator: _authMode == AuthMode.Signup
                                  //     ? (value){
                                  //   if(value != _passwordController.text){
                                  //     return 'Password do not match';
                                  //   }
                                  // }
                                  //     : null,
                                ),
                              ),
                            Container(
                              height: deviceSize.height*0.1,
                              child: TextFormField(
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Theme.of(context).canvasColor,
                                    // focusColor: Colors.white,
                                    // hoverColor: Colors.white,
                                    // labelText: 'E-mail',
                                    hintText: 'Enter Mobile Number',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                keyboardType: TextInputType.emailAddress,
                                // validator: (value){
                                //   if(value.isEmpty || !value.contains('@')){
                                //     return 'Invalid email';
                                //   }
                                // },
                                onSaved: (value){
                                  _authData['mobNumber'] = value;
                                },
                              ),
                            ),
                            if(_authMode == AuthMode.Signup)
                              Container(
                                height: deviceSize.height*0.1,
                                child: TextFormField(
                                  enabled: _authMode == AuthMode.Signup,
                                  decoration: InputDecoration(
                                      fillColor: Theme.of(context).canvasColor,
                                      filled: true,
                                      hintText: 'Enter Email Id',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                  // obscureText: true,
                                  // validator: _authMode == AuthMode.Signup
                                  //     ? (value){
                                  //   if(value != _passwordController.text){
                                  //     return 'Password do not match';
                                  //   }
                                  // }
                                  //     : null,
                                ),
                              ),
                            Container(
                              height: deviceSize.height*0.1,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Theme.of(context).canvasColor,
                                    labelText: 'Password',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                //for not to show password
                                obscureText: true,
                                controller: _passwordController,
                                // keyboardType: TextInputType.emailAddress,
                                // validator: (value){
                                //   if(value.isEmpty || value.length < 5){
                                //     return 'Too short';
                                //   }
                                // },
                                onSaved: (value){
                                  _authData['password'] = value;
                                },
                              ),
                            ),
                            if(_authMode == AuthMode.Signup)
                              Container(
                                height: deviceSize.height*0.1,
                                child: TextFormField(
                                  enabled: _authMode == AuthMode.Signup,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Theme.of(context).canvasColor,
                                      labelText: 'Confirm Password',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                  obscureText: true,
                                  // validator: _authMode == AuthMode.Signup
                                  //     ? (value){
                                  //   if(value != _passwordController.text){
                                  //     return 'Password do not match';
                                  //   }
                                  // }
                                  //     : null,
                                ),
                              ),
                            SizedBox(height: 20,),
                            if(_isLoading) CircularProgressIndicator()
                            else
                              GestureDetector(
                                onTap: _submit,
                                child: Container(
                                  height: deviceSize.height*0.08,
                                  width: deviceSize.width*0.7,
                                  child: Center(child: Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP', style: TextStyle(color: Theme.of(context).canvasColor, fontSize: 20),)),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColorLight,
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('${_authMode == AuthMode.Login ?  'Don\'t Have Account? ' : 'Already Have Account? '}', style: TextStyle(color: Colors.white),),
                      TextButton(
                        onPressed: _switchAuthMode,
                        child: Text(
                          '${_authMode == AuthMode.Login ?  'Sign Up' : 'Login'}',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                        // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                        // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        // textColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  )
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
