import 'package:flutter/material.dart';
import 'dart:convert';
void main() => runApp(new myApp());
class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  List data;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("load json file"),
        backgroundColor: Colors.teal,
      ),
      body: new Center(
        child: new Card(
           child: new FutureBuilder(
            future: DefaultAssetBundle
             .of(context)
             .loadString('jsonfile/json_file'),
             builder: (context,snapshot){

               var mydata = jsonDecode(snapshot.data.toString());
               return new ListView.builder(
                 itemBuilder: (BuildContext context , int index){
                   return Card(
                     child: new Column(
                       crossAxisAlignment: CrossAxisAlignment.stretch,
                       children: <Widget>[
                         new Text("Name: "+mydata[index]['name']),
                     new Text("Age: "+mydata[index]['age']),
                     new Text("Hair colour: "+mydata[index]['hair_color']),
                       ],
                     ),
                   );
                 },
                 itemCount:  mydata == null ? 0 : mydata.length,
               );
             },
           ),
        ),
      ),

    );
  }
}


