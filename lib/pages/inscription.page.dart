import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class InscriptionPage extends StatelessWidget {
 TextEditingController txt_login= new TextEditingController();
 TextEditingController txt_password= new TextEditingController();
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Inscription")),
      body:Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_login,
              decoration: InputDecoration(
               prefixIcon: Icon(Icons.person),
               hintText: "utilisateur",
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10),
                 borderSide: BorderSide(width: 1),

               )
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              obscureText: true,
              controller: txt_password,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  hintText: "mot de passe",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1),

                  )
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(onPressed: (){
              _onInscrire(context);
              },
              style: ElevatedButton.styleFrom(
               minimumSize: Size.fromHeight(50)
              ),
              child: Text('Inscription',style: TextStyle(fontSize: 22))),
                  ),
          TextButton(
              child:Text("Jai déja un compte",
                  style: TextStyle(fontSize: 22)),
            onPressed: (){
                Navigator.pop(context);
                Navigator.pushNamed(context,'/authentification');
            }
          ),
        ],
      )
    );
  }

  Future<void> _onInscrire(BuildContext context) async {
    prefs=await SharedPreferences.getInstance();
    if(!txt_login.text.isEmpty && !txt_password.text.isEmpty){
      prefs.setString("login", txt_login.text);
      prefs.setString("password", txt_password.text);
      prefs.setBool("connecte", true);

      Navigator.pop(context);
      Navigator.pushNamed(context,'/home');
    } else {
      const snackBar = SnackBar(
          content: Text(" champ(s) vide(s)"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
