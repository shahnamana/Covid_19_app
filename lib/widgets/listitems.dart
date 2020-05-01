import 'dart:convert';
import 'package:sidebar_animation/widgets/my_header.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class SimpleState extends StatelessWidget
{
  final List data;
//  double offset = 0;

  const SimpleState({Key key, this.data}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new SingleChildScrollView(
//      child: new Stack(
//        children: <Widget>[
//          ListView.builder(
//            itemCount: data == null? 0:data.length,
//            itemBuilder: (BuildContext context, int index){
//              return new Container(
//                child: new Center(
//                  child: new Column(
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
//                    children: <Widget>[
//                      new Card(
//                        child: new Container(
//                          child: new Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              new Container( width: 100,child: Text(data[index]['state'],style: TextStyle(fontSize: 15),)),
//                              new Container(child: Text(data[index]['confirmed'], style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),),
//                              new Container(child: Text(data[index]['recovered'],style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),),
//                              new Container(child: Text(data[index]['deaths'],style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),),
//                            ],
//                          ),
//                          padding: const EdgeInsets.all((20)),
//                        ),
//                      )
//                    ],
//                  ),
//                ),
//              );
//            },
//          ),
//        ],
//      )
//    );
//  }

  Widget bodyData() => DataTable(

    columnSpacing: 10,
    columns: <DataColumn>[
      DataColumn(
          label: Text('State'),
          numeric: false,
          tooltip: 'Display name of States in India'
      ),
      DataColumn(
          label: Text('Confirmed'),
          numeric: false,
          tooltip: 'Display name of States in India'
      ),
      DataColumn(
          label: Text('Recovered'),
          numeric: false,
          tooltip: 'Display name of States in India'
      ),
      DataColumn(
          label: Text('Deceased'),
          numeric: false,
          tooltip: 'Display name of States in India'
      ),
    ],
    rows: data.map((index) =>
        DataRow(

          cells: <DataCell>[
            DataCell(Text(index['state'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),),
            DataCell(Text(index['confirmed'], style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)),
            DataCell(Text(index['recovered'], style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),)),
            DataCell(Text(index['deaths'], style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),))
          ],
        ),
    ).toList(),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: MediaQuery.of(context).size.width -150,
      margin: EdgeInsets.symmetric(vertical: 2),
//     resizeToAvoidBottomInset:false,
      child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            Flexible(
             child: new SingleChildScrollView(
                 child:bodyData()
             ),
              )
          ]
      ),
    );
  }
}



