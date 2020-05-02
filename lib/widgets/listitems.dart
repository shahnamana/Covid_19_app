
import 'package:flutter/material.dart';



class SimpleState extends StatelessWidget
{
  final List data;
//  double offset = 0;

  const SimpleState({Key key, this.data}) : super(key: key);


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



