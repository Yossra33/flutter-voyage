import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/pages/contact.page.dart';
import 'package:voyage/pages/gallerie.page.dart';
import 'package:voyage/pages/home.page.dart';
import 'package:voyage/pages/authentification.page.dart';
import 'package:voyage/pages/inscription.page.dart';
import 'package:voyage/pages/meteo.page.dart';
import 'package:voyage/pages/parametres.page.dart';
import 'package:voyage/pages/pays.page.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  final routes = {
    '/home':(context)=>HomePage(),
    '/inscription':(context)=>InscriptionPage(),
    '/authentification':(context)=>AuthentificationPage(),
    '/meteo':(context)=>MeteoPage(),
    '/gallerie':(context)=>GalleriePage(),
    '/pays':(context)=>PaysPage(),
    '/contact':(context)=>ContactPage(),
    '/parametres':(context)=>ParametrePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      routes: routes,
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder:
        (BuildContext context, AsyncSnapshot<SharedPreferences> prefs){
          var x=prefs.data;
          if (prefs.hasData){
            bool c=x?.getBool("connecte") ?? false;
            if (c) return HomePage();
          }
          return AuthentificationPage();
        }
      ),
    );
  }
}

