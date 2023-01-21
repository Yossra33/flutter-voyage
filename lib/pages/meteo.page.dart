import 'package:flutter/material.dart';
import 'package:voyage/Menu/drawer.widget.dart';

class MeteoPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Météo"),),
      body:Center(child: Text("Page Météo")),
    );
  }
}
