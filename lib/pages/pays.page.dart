import 'package:flutter/material.dart';
import 'package:voyage/Menu/drawer.widget.dart';

class PaysPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Pays"),),
      body:Center(child: Text("Page Pays")),
    );
  }
}
