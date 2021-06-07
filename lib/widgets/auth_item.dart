// // import 'dart:html';
//
// import 'package:flutter/material.dart';
//
//
// enum AuthMode{
//   Signup, Login
// }
//
// class AuthItem extends StatefulWidget {
// const AuthItem({
// Key key,
// }) : super(key: key);
//
// @override
// _AuthItemState createState() => _AuthItemState();
// }
//
// class _AuthItemState extends State<AuthItem> {
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   AuthMode _authMode = AuthMode.Login;
//   Map<String, String> _authData = {
//     'name': '',
//     'mobNumber': '',
//     'email': '',
//     'password': '',
//   };
//   var _isLoading = false;
//   final _passwordController = TextEditingController();
//
//   Future<void> _submit() async{
//     if(!_formKey.currentState.validate()){
//       return ;
//     }
//     _formKey.currentState.save();
//     setState(() {
//       _isLoading = true;
//     });
//     if(_authMode == AuthMode.Login){
//
//     }else{
//       // await Provider.of<Auth>(context, listen: false).signup(_authData['email'], _authData['password']);
//     }
//     setState(() {
//       _isLoading = false;
//     });
//   }
//
//   void _switchAuthMode(){
//     if(_authMode == AuthMode.Login){
//       setState(() {
//         _authMode = AuthMode.Signup;
//       });
//     }else{
//       setState(() {
//         _authMode = AuthMode.Login;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     return
//       // Card(
//       //   shape: RoundedRectangleBorder(
//       //       borderRadius: BorderRadius.circular(10)
//       //   ),
//       //   elevation: 8.0,
//       //   child:
//       Container(
//           height: _authMode == AuthMode.Signup ?deviceSize.height*0.8 :deviceSize.height*0.3,
//           constraints: BoxConstraints(minHeight: _authMode == AuthMode.Signup ?320 :260),
//           width: deviceSize.width * 0.8,
//           padding: EdgeInsets.all(16),
//           child: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   if(_authMode == AuthMode.Signup)
//                     Container(
//                       height: deviceSize.height*0.1,
//                       child: TextFormField(
//                         enabled: _authMode == AuthMode.Signup,
//                         decoration: InputDecoration(
//                           fillColor: Theme.of(context).canvasColor,
//                             filled: true,
//                             hintText: 'Enter Your Name',
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.white
//                                 ),
//                                 borderRadius: BorderRadius.circular(10)
//                             )
//                         ),
//                         // obscureText: true,
//                         validator: _authMode == AuthMode.Signup
//                             ? (value){
//                               if(value != _passwordController.text){
//                                 return 'Password do not match';
//                               }
//                             }
//                             : null,
//                       ),
//                     ),
//                   Container(
//                     height: deviceSize.height*0.1,
//                     child: TextFormField(
//                       cursorColor: Colors.white,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Theme.of(context).canvasColor,
//                         // focusColor: Colors.white,
//                         // hoverColor: Colors.white,
//                         // labelText: 'E-mail',
//                         hintText: 'Enter Mobile Number',
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.white
//                           ),
//                           borderRadius: BorderRadius.circular(10)
//                         )
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (value){
//                         if(value.isEmpty || !value.contains('@')){
//                           return 'Invalid email';
//                         }
//                       },
//                       onSaved: (value){
//                         _authData['mobNumber'] = value;
//                       },
//                     ),
//                   ),
//                   if(_authMode == AuthMode.Signup)
//                     Container(
//                       height: deviceSize.height*0.1,
//                       child: TextFormField(
//                         enabled: _authMode == AuthMode.Signup,
//                         decoration: InputDecoration(
//                             fillColor: Theme.of(context).canvasColor,
//                             filled: true,
//                             hintText: 'Enter Email Id',
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.white
//                                 ),
//                                 borderRadius: BorderRadius.circular(10)
//                             )
//                         ),
//                         // obscureText: true,
//                         validator: _authMode == AuthMode.Signup
//                             ? (value){
//                           if(value != _passwordController.text){
//                             return 'Password do not match';
//                           }
//                         }
//                             : null,
//                       ),
//                     ),
//                   Container(
//                     height: deviceSize.height*0.1,
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         filled: true,
//                           fillColor: Theme.of(context).canvasColor,
//                           labelText: 'Password',
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.white
//                               ),
//                               borderRadius: BorderRadius.circular(10)
//                           )
//                       ),
//                       //for not to show password
//                       obscureText: true,
//                       controller: _passwordController,
//                       // keyboardType: TextInputType.emailAddress,
//                       validator: (value){
//                         if(value.isEmpty || value.length < 5){
//                           return 'Too short';
//                         }
//                       },
//                       onSaved: (value){
//                         _authData['password'] = value;
//                       },
//                     ),
//                   ),
//                   if(_authMode == AuthMode.Signup)
//                     Container(
//                       height: deviceSize.height*0.1,
//                       child: TextFormField(
//                         enabled: _authMode == AuthMode.Signup,
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Theme.of(context).canvasColor,
//                           labelText: 'Confirm Password',
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Colors.white
//                             ),
//                             borderRadius: BorderRadius.circular(10)
//                           )
//                         ),
//                         obscureText: true,
//                         validator: _authMode == AuthMode.Signup
//                             ? (value){
//                           if(value != _passwordController.text){
//                             return 'Password do not match';
//                           }
//                         }
//                             : null,
//                       ),
//                     ),
//                   SizedBox(height: 20,),
//                   if(_isLoading) CircularProgressIndicator()
//                   else
//                     GestureDetector(
//                       onTap: _submit,
//                       child: Container(
//                         height: deviceSize.height*0.08,
//                         width: deviceSize.width*0.7,
//                         child: Center(child: Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP', style: TextStyle(color: Theme.of(context).canvasColor, fontSize: 20),)),
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).primaryColorLight,
//                           borderRadius: BorderRadius.circular(15)
//                         ),
//                       ),
//                     ),
//                   TextButton(
//                     onPressed: _switchAuthMode,
//                     child: Text(
//                       '${_authMode == AuthMode.Login ? 'Don\'t Have Account? Sign Up' : 'Already Have Account? Login'}',
//                       style: TextStyle(
//                         color: Colors.white
//                       ),
//                     ),
//                     // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 4),
//                     // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     // textColor: Theme.of(context).primaryColor,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       // );
//   }
// }
