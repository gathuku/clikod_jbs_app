import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: new AppBar(
        title: new Text("Welcome"),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.closed_caption),
          onPressed: (){},
          ), 
        ],
        ),

        
      ),
    );
  }
}