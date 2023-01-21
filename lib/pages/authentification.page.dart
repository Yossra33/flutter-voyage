import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationPage extends StatelessWidget {
  TextEditingController txt_login= new TextEditingController();
  TextEditingController txt_password= new TextEditingController();
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Page Authentification")),
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
              child: ElevatedButton( onPressed: (){
                _onAuthentifier(context);
              },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50)) ,

                  child: Text('Connexion',style: TextStyle(fontSize: 22))),
            ),
            TextButton(
                child:Text("Nouvel Utilisateur",
                    style: TextStyle(fontSize: 22)),
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context,'/inscription');
                }
            ),
          ],
        )
    );
  }

  Future<void> _onAuthentifier(BuildContext context) async{
    prefs= await SharedPreferences.getInstance();
    String log = prefs.getString("login")?? '';
    String psw = prefs.getString("password")?? '';
    prefs.setBool("connecte", true);
    print(txt_password.text);
    if (txt_login.text == log && txt_password.text == psw)
   {
      Navigator.pop(context);
      Navigator.pushNamed(context,'/home');
    }else {
      const snackBar = SnackBar(
          content: Text(" vérifier vos données"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

