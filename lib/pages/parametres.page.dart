import 'package:flutter/material.dart';
import 'package:voyage/Menu/drawer.widget.dart';

class ParametrePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Paramétre"),),
      body:Center(child: Text("Page Paramétre")),
    );
  }
}
