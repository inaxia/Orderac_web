import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:orderac_web/custom/custom_colors.dart';
import 'package:orderac_web/screens/layout/large/layers/first_screen.dart';
import 'package:orderac_web/screens/layout/large/layers/footer.dart';
import 'package:orderac_web/screens/layout/large/layers/layer1.dart';
import 'package:orderac_web/screens/layout/large/layers/layer2.dart';
import 'package:orderac_web/screens/layout/large/layers/layer3.dart';

//home_page
String tagline = 'loading...';
String pitch = 'loading...';
String playstoreLink;

//layer1
String titleLayer1 = 'loading...';
String detailsLayer1 = 'loading...';

//layer2
String titleLayer2 = 'loading...';
String detailsLayer2 = 'loading...';

//layer3
String titleLayer3 = 'loading...';
String detailsLayer3 = 'loading...';

//footer
String footerText = 'loading...';

class LargeHomeScreen extends StatefulWidget {
  @override
  _LargeHomeScreenState createState() => _LargeHomeScreenState();
}

class _LargeHomeScreenState extends State<LargeHomeScreen> {
  CollectionReference collectionReferenceToOrderacWeb =
      FirebaseFirestore.instance.collection('orderac_web');

  void getHomePage() {
    collectionReferenceToOrderacWeb.doc('home_page').get().then((value) {
      var fields = value.data();
      setState(() {
        tagline = fields['tagline'];
        pitch = fields['pitch'];
        playstoreLink = fields['playstore'];
      });
    });
  }

  void getLayer1() {
    collectionReferenceToOrderacWeb.doc('layer1').get().then((value) {
      var fields = value.data();
      setState(() {
        titleLayer1 = fields['title'];
        detailsLayer1 = fields['details'];
      });
    });
  }

  void getLayer2() {
    collectionReferenceToOrderacWeb.doc('layer2').get().then((value) {
      var fields = value.data();
      setState(() {
        titleLayer2 = fields['title'];
        detailsLayer2 = fields['details'];
      });
    });
  }

  void getLayer3() {
    collectionReferenceToOrderacWeb.doc('layer3').get().then((value) {
      var fields = value.data();
      setState(() {
        titleLayer3 = fields['title'];
        detailsLayer3 = fields['details'];
      });
    });
  }

  void getFooter() {
    collectionReferenceToOrderacWeb.doc('footer').get().then((value) {
      var fields = value.data();
      setState(() {
        footerText = fields['footer'];
      });
    });
  }

  @override
  void initState() {
    getHomePage();
    getLayer1();
    getLayer2();
    getLayer3();
    getFooter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('orderac_web').doc('home_page');

    documentReference.get();

    final body = ListView(
      children: [
        FirstScreen(
          tagline: tagline,
          pitch: pitch,
          playstoreLink: playstoreLink,
        ),
        Divider(
          height: 150.0,
          endIndent: 600.0,
          indent: 600.0,
          thickness: 0.8,
          color: Colors.white54,
        ),
        Layer1(
          title: titleLayer1,
          details: detailsLayer1,
        ),
        Divider(
          height: 150.0,
          endIndent: 600.0,
          indent: 600.0,
          thickness: 0.8,
          color: Colors.white54,
        ),
        Layer2(
          title: titleLayer2,
          details: detailsLayer2,
        ),
        Divider(
          height: 120.0,
          endIndent: 600.0,
          indent: 600.0,
          thickness: 0.8,
          color: Colors.white54,
        ),
        Layer3(
          title: titleLayer3,
          details: detailsLayer3,
        ),
        Divider(
          height: 150.0,
          endIndent: 600.0,
          indent: 600.0,
          thickness: 0.8,
          color: Colors.white54,
        ),
        Footer(
          footerText: footerText,
          playstoreLink: playstoreLink,
        )
      ],
    );

    return Scaffold(
      backgroundColor: customDarkBlack,
      body: body,
    );
  }
}
