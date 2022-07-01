// import 'package:flutter/material.dart';
// import 'package:tutor/secpage.dart';
// import 'routes.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class FirstPage extends StatefulWidget {
//   const FirstPage({Key? key}) : super(key: key);

//   @override
//   State<FirstPage> createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   final _formKey = GlobalKey<FormState>();
//   FirebaseAuth auth = FirebaseAuth.instance;
 
// var email, password;

// void _setEmail(String text){
//   setState(() {
//     email=text;
    
//   });
// }

// void _setPass(String text){
//   setState(() {
//     password=text;
    
//   });
// }

// void login ()async{
//   try {
//   UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: email,
//     password:password
//   );
//   Navigator.pushNamed(context, Routes.secPage);

// } 
//   on FirebaseAuthException catch (e) {
//   if (e.code == 'user-not-found') {
//     print('No user found for that email.');
//   } else if (e.code == 'wrong-password') {
//     print('Wrong password provided for that user.');
//   }
// }
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('LOGIN'),
//       ),
//       body: Center(
//           child: Container(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               new Text('APPLICATION NAME'),
//               new Text('Login for Admin'),
//                   Form(
//             key: _formKey,
//               child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.all(20),
//                   child:TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'email'
//                     ),
//                     validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter some text';
//                     }
//                     return null;
//                   }, 
//                     onChanged: (text) {
//                       _setEmail(text);
//                     },
//                   )
//                 ),

//                 Padding(
//                   padding: EdgeInsets.all(20),
//                   child:TextFormField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: 'Password'
//                     ),
//                     validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter some text';
//                     }
//                     return null;
//                   }, 
//                     onChanged: (text) {
//                       _setPass(text);
//                     },
//                   )
//                 ),

//                 Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: ElevatedButton(
//                     onPressed: (){
//                       if (_formKey.currentState!.validate()) {
//                         login();
//                       }
//                     },
//                     child: const Text('Login'),
//                   )
//                 ),
                   
//                   ],
//                 ),
//               )
//             ]),
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tutor/secpage.dart';
import 'routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  var email, password;

  void _setEmail(String text) {
    setState(() {
      email = text;
    });
  }

  void _setPass(String text) {
    setState(() {
      password = text;
    });
  }

  void login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushNamed(context, Routes.secPage);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void _adminlogin() {
    _showDialog();
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Login for Admin", textAlign: TextAlign.center),
            actions: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'email'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            _setEmail(text);
                          },
                        )),
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(labelText: 'Password'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            _setPass(text);
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              login();
                            }
                          },
                          child: const Text('Login'),
                        )),
                  ],
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOMEPAGE'),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text('TUTORING MANAGEMENT SYSTEM',
                style: TextStyle(color: Colors.white)),
                decoration:
                    BoxDecoration(shape: BoxShape.rectangle, color: Colors.purple),
                padding: EdgeInsets.all(50.0),
                margin: EdgeInsets.all(15.0),
              ),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                      child: const Text('Continue as guest'),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.secPage,
                        );
                      })),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      child: const Text('Login for admin'),
                      onPressed: _adminlogin)),
            ]),
      )),
    );
  }
}