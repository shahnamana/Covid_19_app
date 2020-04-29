import 'package:flutter/material.dart';
import 'package:sidebar_animation/widgets/listitems.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:json_table/json_table.dart';



class HotspotLocator extends StatelessWidget with NavigationStates
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Hotspot();
  }
}

class Hotspot extends StatefulWidget {
  @override
  _HotSpot createState() =>   _HotSpot();
}

class _HotSpot extends State<Hotspot> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SimpleTable();
  }

}
//
//////  final Map stateData;
//////
//////  _HotSpot(this.stateData);
////  List<Name> _name = List<Name>();
////  Future <List<Name>> fetchData() async{
////    var url = 'https://api.covid19india.org/data.json';
////    var response = await http.get(url);
////    var names = List<Name>();
////    var namesJson = json.decode(response.body);
////    for ( var nameJson in namesJson){
////      names.add(Name.fromJson(nameJson));
////    }
////    return names;
////
////  }
////  const _index = 0;
////
////  String nameState(){
////    final stateName;
////    return new Row(
////      <DataRow>(
////      cell:
////    ),
////    );}
//
//
//  Widget bodyData() => DataTable(
//      sortAscending: true,
//      columnSpacing: 20,
//      columns: <DataColumn>[
//        DataColumn(
//          label: Text("State"),
//        ),
//        DataColumn(
//          label: Text("Confirmed"),
//        ),
//        DataColumn(
//          label: Text("Recovered"),
//        ),
//        DataColumn(
//          label: Text("Dead"),
//        ),
//      ],
//      rows: _name
//          .map(
//            (name) => DataRow(
//          cells: [
//            DataCell(
//              Text(_name[index].State),
//              showEditIcon: false,
//              placeholder: false,
//            ),
//            DataCell(
//              Text(_name[index].Confirmed),
//              showEditIcon: false,
//              placeholder: false,
//            ),
//            DataCell(
//              Text(_name[index].Recovered),
//              showEditIcon: false,
//              placeholder: false,
//            ),
//            DataCell(
//              Text(_name[index].Dead),
//              showEditIcon: false,
//              placeholder: false,
//            )
//          ],
//        ),
//      ).toList());
//
//
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Episode 5 - Data Table"),
//      ),
//      body: Container(
//        child: bodyData(),
//      ),
//    );
//  }
//}
////
////class Name {
////  String State;
////  String Confirmed;
////  String Recovered;
////  String Dead;
////
////  Name({this.State, this.Confirmed, this. Recovered,this.Dead});
////  Name.fromJson(Map<String,dynamic>json){
////
////  }
////}
////
////var names = <Name>[
////  Name(State: "Maharashtra", Confirmed: "152",Recovered:'154',Dead:'210'),
////  Name(State: "Gujarat", Confirmed: "1254",Recovered:'85',Dead:'85'),
////  Name(State: "Goa", Confirmed: "1230",Recovered:'475',Dead:'320'),
////];
////
////class Statewisestats extends StatelessWidget{
////
////  final String StateName;
////  final String Confirmed;
////  final String Recovered;
////  final String Deceased;
////
////  const Statewisestats({Key key, this.StateName, this.Confirmed, this.Recovered, this.Deceased}) : super(key: key);
////
////  @override
////  Widget build(BuildContext context) {
////    // TODO: implement build
////    return null;
////  }
//
