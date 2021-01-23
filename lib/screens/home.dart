import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:orderac_web/screens/layout/large/large_home_screen.dart';
// import 'package:orderac_web/screens/layout/medium/medium_home_screen.dart';
// import 'package:orderac_web/screens/layout/small/small_home_screen.dart';

//home_page
String tagline = 'loading...';
String pitch = 'loading...';
String playstoreLink;

//layer1
String titleLayer1 = 'loading...';
String detailsLayer1 = 'loading...';
String imageLayer1 = 'https://i.stack.imgur.com/h6viz.gif';

//layer2
String titleLayer2 = 'loading...';
String detailsLayer2 = 'loading...';
String imageLayer2 = 'https://i.stack.imgur.com/h6viz.gif';

//layer3
String titleLayer3 = 'loading...';
String detailsLayer3 = 'loading...';
String imageLayer3 = 'https://i.stack.imgur.com/h6viz.gif';

//footer
String footerText = 'loading...';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        imageLayer1 = fields['image'];
      });
    });
  }

  void getLayer2() {
    collectionReferenceToOrderacWeb.doc('layer2').get().then((value) {
      var fields = value.data();
      setState(() {
        titleLayer2 = fields['title'];
        detailsLayer2 = fields['details'];
        imageLayer2 = fields['image'];
      });
    });
  }

  void getLayer3() {
    collectionReferenceToOrderacWeb.doc('layer3').get().then((value) {
      var fields = value.data();
      setState(() {
        titleLayer3 = fields['title'];
        detailsLayer3 = fields['details'];
        imageLayer3 = fields['image'];
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
    // getImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //* Break Points:
    //* 1536 - max width
    //* 1300 - first break

    var screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);

    // if ((screenWidth < 1300) && (screenWidth >= 600)) {
    //   return MediumHomeScreen(
    //     tagline: tagline,
    //     pitch: pitch,
    //     playstoreLink: playstoreLink,
    //     titleLayer1: titleLayer1,
    //     detailsLayer1: detailsLayer1,
    //     titleLayer2: titleLayer2,
    //     detailsLayer2: detailsLayer2,
    //     titleLayer3: titleLayer3,
    //     detailsLayer3: detailsLayer3,
    //     footerText: footerText,
    //   );
    // } else if (screenWidth < 600) {
    //   return SmallHomeScreen(
    //     tagline: tagline,
    //     pitch: pitch,
    //     playstoreLink: playstoreLink,
    //     titleLayer1: titleLayer1,
    //     detailsLayer1: detailsLayer1,
    //     titleLayer2: titleLayer2,
    //     detailsLayer2: detailsLayer2,
    //     titleLayer3: titleLayer3,
    //     detailsLayer3: detailsLayer3,
    //     footerText: footerText,
    //   );
    // }

    return LargeHomeScreen(
      tagline: tagline,
      pitch: pitch,
      playstoreLink: playstoreLink,
      titleLayer1: titleLayer1,
      detailsLayer1: detailsLayer1,
      titleLayer2: titleLayer2,
      detailsLayer2: detailsLayer2,
      titleLayer3: titleLayer3,
      detailsLayer3: detailsLayer3,
      footerText: footerText,
    );
  }
}
