import 'package:flutter/material.dart';
import 'routes.dart';
import 'firstpage.dart';
import 'secpage.dart';
import 'thirdpage.dart';
import 'fourthpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyAKd8f-6TASYCG4FFghTy61esDwEJD_TCo",
      appId: "1:637934060464:android:a018e70a7b1b268e094c75",
      messagingSenderId: "637934060464",
      projectId: "tutor1-50c06",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tutoring System',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        initialRoute: Routes.firstPage,
        routes: {
          Routes.firstPage: (context) => const FirstPage(),
          Routes.secPage: (context) => const SecPage(),
          Routes.thirdPage: (context) => const ThirdPage(),
          Routes.fourthPage: (context) => const FourthPage(),
          
        });
  }
}