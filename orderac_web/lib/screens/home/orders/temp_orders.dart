import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admin/firebase_admin.dart';
import 'package:firebase_admin/src/credential.dart';
import 'package:flutter/material.dart';
import 'package:orderac_web/custom/custom_colors.dart';
import 'package:orderac_web/services/auth_services.dart';
import 'package:orderac_web/shared/loading.dart';

class TempOrders extends StatelessWidget {
  final foodCourt;

  TempOrders({this.foodCourt});
  // final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final CollectionReference items =
        FirebaseFirestore.instance.collection('Orders');

    var users = FirebaseFirestore.instance
        .collection('food_courts')
        .doc(foodCourt)
        .get();

    //TODO: to list all the collections
    var tempReference =
        FirebaseFirestore.instance.collection('food_courts').doc(foodCourt);

    // tempReference.get().then((value) => {
    //   for (var collection in value) {
    //     print(collection.id)
    //   }
    // });

    // tempReference.getCollections().then(collections => {
    //   for (let collection of collections) {
    //     console.log(`Found collection with id: ${collection.id}`);
    //   }
    // });

    final appBar = AppBar(
      backgroundColor: customLightBlack,
      title: Text('orderac'),
      actions: [
        FlatButton.icon(
          label: Text('Sign out'),
          icon: Icon(Icons.exit_to_app),
          onPressed: () async {
            // await _auth.signOutWithFirebase();
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

        return ListView(
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
      backgroundColor: customLightBlack,
      appBar: appBar,
      body: body,
    );
  }
}
