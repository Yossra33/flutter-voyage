import 'package:flutter/material.dart';
import 'package:voyage/Menu/drawer.widget.dart';

class ContactPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Contact"),),
      body:Center(child: Text("Page Contact")),
    );
  }
}
