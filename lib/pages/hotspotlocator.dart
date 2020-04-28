import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

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

  final Map stateData;

  _HotSpot(this.stateData);



  Widget bodyData()=> DataTable(
    columnSpacing: 7,
    columns: <DataColumn>[
      DataColumn(
        label: Text("State"),
        numeric: false,
        tooltip: "To display State Name",
      ),
      DataColumn(
        label: Text("Confirmed"),
        numeric: false,
        tooltip: "Number of People Confirmed",
      ),
      DataColumn(
        label: Text("Recovered"),
        numeric: false,
        tooltip: "Number of People Recovered",
      ),
      DataColumn(
        label: Text("Deceased"),
        numeric: false,
        tooltip: "Number of People Dies",
      ),
    ],
    rows: stateData((name)=>DataRow(
      cells: [
        DataCell(
          Text(stateData['statewise'][]['state']),
        ),
        DataCell(
          Text(stateData['statewise'][]['confirmed']),
        ),
        DataCell(
          Text(stateData['statewise'][]['recovered']),
        ),
        DataCell(
          Text(stateData['statewise'][]['deaths']),
        ),
      ],
    )).toList(),
  );


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Chalo'),
      ),
      body: Container(
        child: bodyData(),
      ),
    );
  }

}

class Name{
  final String StateName;
  final String Confirmed;
  final String Recovered;
  final String Deceased;

  const Name({Key key, this.StateName, this.Confirmed, this.Recovered, this.Deceased}) : super(key: key);
}

var names = <Name>[
  Name(StateName: "Maharashtra", Confirmed: '2343', Recovered: '23', Deceased: '2345'),
  Name(StateName: 'Gujarat', Confirmed: '12', Recovered: '78', Deceased: '85'),
  Name(StateName: 'Goa', Confirmed: '25', Recovered: '54', Deceased: '78'),
  Name(StateName: 'Delhi', Confirmed: '20', Recovered: '235', Deceased: '45'),
];

class Statewisestats extends StatelessWidget{

  final String StateName;
  final String Confirmed;
  final String Recovered;
  final String Deceased;

  const Statewisestats({Key key, this.StateName, this.Confirmed, this.Recovered, this.Deceased}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}