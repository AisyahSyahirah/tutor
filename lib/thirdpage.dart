import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var fullname;
  var icno;
  var contactno;
  var email;
  var subject;
  var id;

  void _seticno(String text) {
    setState(() {
      icno = text;
    });
  }

  void _update() async {
    try {
      await firestore.collection('tutor').doc('fullname').update({
        'fullname': "meen",
      });
    } catch (e) {
      print(e);
    }
  }

  void _delete() async {
    try {
      await firestore.collection('tutor').doc(icno).delete();
    }
    catch(e) {
      print(e);
    }
    
  }

  void _read() async {
    //  DocumentSnapshot documentSnapshot;
    //   documentSnapshot = await firestore.collection('tutor').doc(icno).get();
      //CollectionReference _collectionRef = FirebaseFirestore.instance.collection('name').doc('aisyah').get();
      var info = firestore.collection('tutor');
      var docSnapshot = await info.doc(icno).get();
      if (docSnapshot.exists) {
        Map<String, dynamic>? data = docSnapshot.data();
        var fname = data?['fullname'];
        var ic = data?['icno'];
        var contact = data?['contactno'];
        var mail = data?['email'];
        var sub = data?['subject'];
        _showDialog(fname, ic, contact, mail, sub);
      } else {
        var error = 'No data available';
        _showDialogerror(error);
      }
  }

  void _showDialog(String fname, ic, contact, mail, sub) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
         content: new Text(' Full name: $fname \n IC number: $icno \n Contact number: $contact \n Email: $mail \n Subject offered: $sub'),
          actions: <Widget>[
            new TextButton(
              child: new Text("Update"),
              onPressed: () {
                Navigator.pushNamed(
                        context,
                        Routes.fourthPage,
                      );
              },
            ),
            new TextButton(
              child: new Text("Delete"),
              onPressed: () {
                _delete();
                Navigator.pushNamed(
                        context,
                        Routes.secPage,
                      );
              }
            ),
            new TextButton(
              child: new Text("Close"),
              onPressed:  () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialogerror(String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
         content: new Text(error),
          actions: <Widget>[
            new TextButton(
              child: new Text("Close"),
              onPressed:  () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TUTOR LIST'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    TextFormField(
                      decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Tutor Ic number',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter IC number';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            _seticno(text);
                          },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        
                        child: const Text('Search'),
                        onPressed: () {
                          _read();
                          
                        },
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}