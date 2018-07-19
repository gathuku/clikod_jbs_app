import 'package:flutter/material.dart';
import 'package:flutter_drawer/new_file.dart';

class FDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: "Drawer Test",
      theme: new ThemeData(
        primarySwatch: Colors.amber,

      ),
       home:new HomePage(),

       //creatin a route to another page
       routes: <String, WidgetBuilder>{
         "/accounts":(BuildContext context) => new NewPage(),
       },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("JBS Mobi"),
          
        actions: <Widget>[
       new IconButton(icon: Icon(Icons.add_shopping_cart),
         onPressed:(){},
        ),

        ],
  
       
   
      ),

      //Drawer Drawing
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              currentAccountPicture:new CircleAvatar(
                child: new Text("M"),
                backgroundColor: Colors.brown,

              ),
              accountEmail: new Text("mosesgathuku95@gmail.com"),
              accountName: new Text("gathuku"),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  child: new Text("G"),
                ),
              ],
            ),
            new ListTile(title: new Text("Accounts"),
            leading: new Icon(Icons.attach_money),
            trailing: new Icon(Icons.arrow_drop_down),
            onTap: (){
              Navigator.of(context).pushNamed("/accounts");
              
            }
            ),
             new ListTile(title: new Text("Academics"),
             leading: new Icon(Icons.library_books),
             trailing: new Icon(Icons.arrow_drop_down),
             
            ),
               new ListTile(title: new Text("Library"),
             leading: new Icon(Icons.library_books),
             trailing: new Icon(Icons.arrow_drop_down),
             
            ),
               new ListTile(title: new Text("peformance"),
             leading: new Icon(Icons.library_books),
             trailing: new Icon(Icons.arrow_drop_down),
             
            ),

            new ListTile(title: new Text("Close"),
            leading: new Icon(Icons.close),
            onTap: ()=>Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
     
     body: new Column(

       
       children: <Widget>[
         
        
         
         new Card(
          child:  Icon(Icons.computer),
          
         ),
       ],
     ),
   
    )

    
    );
  }
}