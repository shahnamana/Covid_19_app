import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:http/http.dart' as http;

class SimpleTable extends StatefulWidget {
  @override
  _SimpleTableState createState() => _SimpleTableState();
}

class _SimpleTableState extends State<SimpleTable> {
  final String url = "https://api.covid19india.org/data.json";
  List data;

  Future<String> getJsonData() async{
    var response = await http.get(
        Uri.encodeFull(url),
      headers: {"Accept":"application/json"},
    );
    print(response.body);
    setState(() {
      var convertDatatoJson = json.decode(response.body);
      data = convertDatatoJson['statewise'];
    });
    return "Success";
  }

//  void getJsonData() {
//
//  }
//

  @override
  void initState()
  {
    super.initState();
    this.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('completing in list view'),
      ),
      body: new ListView.builder(
          itemCount: data == null? 0:data.length,
          itemBuilder: (BuildContext context, int index){
            return ListView(
              padding: EdgeInsets.all(20),
              children: <Widget>[
                ListTile(
                  title: Text(data[index]['confirmed']) ,
                ),
              ],
            );
//            return new Container(
//              child: new Center(
//                child: new Column(
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  children: <Widget>[
//                    new Card(
//                      child: new Container(
//                        child: new Text(data[index]['confirmed']),
//                        padding: const EdgeInsets.all(20),
//                      ),
//                    )
//                  ],
//                ),
//              ),
//            );
          }),
    );
  }


}