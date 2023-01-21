import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/config/global.params.dart';

import '../Menu/drawer.widget.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Page Home")),
      body: Center(
          child: Wrap(
            children: [
        ...(GlobalParams.accueil as List).map((item){
          return InkWell(child: Ink.image(image: item['image'],
          height: 180, width: 180,),onTap: (){
           if ('{$item["route"]}'!="/authentification")
             Navigator.pushNamed(context, '${item["route"]}');
           else
             _Deconnexion(context);

          },);
          })
      ],)),
    );
  }
 Future<void> _Deconnexion(context) async{
            prefs= await SharedPreferences.getInstance();
            prefs.setBool("connecte", false);
            Navigator.of(context).pushNamedAndRemoveUntil('/authentification',
                    (Route<dynamic> route) => false);
    }
  }
