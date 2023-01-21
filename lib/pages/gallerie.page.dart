import 'package:flutter/material.dart';
import 'package:voyage/Menu/drawer.widget.dart';

class GalleriePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Gallerie"),),
      body:Center(child: Text("Page Gallerie")),
    );
  }
}
