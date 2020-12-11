import 'package:flutter/material.dart';
import 'package:orderac/custom/custom_colors.dart';

class Bill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final body = CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: false,
          elevation: 2.0,
          centerTitle: true,
          backgroundColor: customDarkBlack,
          title: Text('Payment'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: customDarkBlack,
      body: body,
    );
  }
}
