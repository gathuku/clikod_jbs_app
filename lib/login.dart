import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main(){
   runApp(new LoginPage());
}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var _username;
  var _password;
  final formkey=new GlobalKey<FormState>();


void validateAndSave(){
  final form=formkey.currentState;

  if(form.validate()){
    form.save();
    print('form is valid.$_username, $_password');
  }else{
    print('form is not valid');
  }
}

void _loginSubmit() async {
  try
  {
    FirebaseUser user=await FirebaseAuth.instance.signInWithEmailAndPassword
     (email: _username, password: _password);

     if(user=null){
       FirebaseUser user=await FirebaseAuth.instance.createUserWithEmailAndPassword
     (email: _username, password: _password);
     }
  }catch(e){
    print('Error:$e');
  }
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    backgroundColor: Colors.greenAccent,
  
    
    body: new Stack(
        
      fit: StackFit.expand,  //fits the whole stack
      children: <Widget>[
        /*
        new Image(        
          image: new AssetImage("assets/bacground.png",
          
          ),
          fit: BoxFit.cover,
          
        ),
        */

        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Welcome to JBS Mobi",
            style: new TextStyle(
              fontSize: 30.0,
              color: Colors.tealAccent,
              fontWeight: FontWeight.w400,
            ),
            
            ),

               new Text("School Information",
            style: new TextStyle(
              fontSize: 25.0,
              color: Colors.tealAccent,
              fontWeight: FontWeight.w100,
            ),
            
            ),

               new Text("in your hand",
            style: new TextStyle(
              fontSize: 25.0,
              color: Colors.tealAccent,
              fontWeight: FontWeight.w100,
            ),
            
            ),
            
            new FlutterLogo(
            
            ),
            
            new Form(
          child: new Theme(
            data: new ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.teal,
              inputDecorationTheme: new InputDecorationTheme(
                labelStyle: new TextStyle(
                  color: Colors.teal,
                  fontSize: 20.0,
                  
                  
                )
              )
            ),
             child: Container(
               padding: const EdgeInsets.all(40.0),
                            child: new Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 
                children: <Widget>[
                   new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Email Address",
                      
                    ),

                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>value.isEmpty? 'Email cant be Empty':null,
                    onSaved: (value) =>_username=value,
                    
                  ),


                     //password input field
                      new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Password",
                    ),
                   
                    validator: (value) =>value.isEmpty? 'Password cant be Empty':null,
                     onSaved: (value) =>_password=value,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                  
                  //login button

                  new Padding(
                    padding: const EdgeInsets.only(top: 30.0)
                  ),
                  
                  new MaterialButton(
                    color: Colors.tealAccent,
                    
                   splashColor: Colors.redAccent,
                   child: new Text("Login",
                    style: new TextStyle(
                      fontSize: 20.0,

                    ),
                    
                    ),
                    onPressed: (){
                     
                      _loginSubmit();
                      Navigator.pushNamed(context, 'login');
                    },
                  ),
                new Padding(
                  padding: const EdgeInsets.only(top: 90.0),
                ),
                  new Text("Powerd by CLINKOD",
                  style: new TextStyle(
                    color: Colors.tealAccent,
                    fontSize: 16.0,
                  ),
                  )
                ],
            ),
             ),
          ),
            )
          ],
        )
      ],
    ),
   );
  }
}