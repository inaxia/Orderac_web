import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:orderac_web/custom/custom_colors.dart';
import 'package:orderac_web/services/auth_services.dart';
import 'package:orderac_web/shared/loading.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final CollectionReference items =
        FirebaseFirestore.instance.collection('Orders');

    final appBar = AppBar(
      backgroundColor: customDarkBlack,
      title: Text('orderac'),
      actions: [
        FlatButton.icon(
          label: Text('Sign out'),
          icon: Icon(Icons.exit_to_app),
          onPressed: () async {
            await _auth.signOutWithFirebase();
          },
        ),
      ],
    );

    final body = StreamBuilder<QuerySnapshot>(
      stream: items.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Container(
            child: Center(
              child: Text('SOME ERROR HAS OCCURED'),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new ListTile(
              title: new Text(
                document.data()['Name'],
                style: TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
        );
      },
    );

    return Scaffold(
      backgroundColor: customDarkBlack,
      appBar: appBar,
      body: body,
    );
  }
}
