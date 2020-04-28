import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';
import 'package:sidebar_animation/widgets/countrystats.dart';
import 'dart:async';
import 'dart:convert';

import 'dart:async';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:http/http.dart' as http;



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

class _HotSpot extends State<Hotspot>
{
  Map countryData;
  fetchCountryData()async{
    http.Response response = await http.get('https://api.covid19india.org/states_daily.json');
    setState(() {
      countryData = json.decode(response.body);
    });
  }
  
  @override
  void initState(){
    fetchCountryData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Api connection',),
      ),
      body: SingleChildScrollView(
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical:10),
              child:Text('Country wide Stats', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            ),
            countryData==null?CircularProgressIndicator():CountryPanel(countryData: countryData,),
        ],
      ),
      )
    );
  }

//  part 'src/map_box_place_search_widget.dart';
}
// {
//  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
//  String _selectedLocation; // Option 2
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//        body:Container(
//        child: new Column(
//          children: <Widget>[
//            new Align(
//              child: Container(
//                decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                        begin: Alignment.topRight,
//                        end: Alignment.bottomLeft,
//                        colors: [
//                          Color(0xFF3383CD),
//                          Color(0xFF11249F),
//                        ])
//                ),
//              ),
//            ),
//            new DropdownButton(
//              // Not necessary for Option 1
//              value: _selectedLocation,
//              onChanged: (newValue) {
//                setState(() {
//                  _selectedLocation = newValue;
//                });
//              },
//              items: _locations.map((location) {
//                return DropdownMenuItem(
//                  child: new Text(location),
//                  value: location,
//                );
//              }).toList(),
//            ),
//          ],
//        ),
//      )
//    );
//  }
//}
//
//
//https://api.covid19india.org/csv/latest/state_wise.csv