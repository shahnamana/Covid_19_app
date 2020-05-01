import 'package:flutter/material.dart';
import 'package:sidebar_animation/pages/hotspotlocator.dart';

import 'package:sidebar_animation/widgets/countrystats.dart';
import 'package:sidebar_animation/widgets/listitems.dart';
//import 'package:sidebar_animation/widgets/listitems.dart';
import 'package:sidebar_animation/widgets/my_header.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


class HomePage extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String url = "https://api.covid19india.org/data.json";
  List data;
  final controller = ScrollController();
  double offset = 0;
  Map countryData;
  fetchCountryData()async{
    http.Response response = await http.get('https://api.covid19india.org/data.json');
    setState(() {
      countryData = json.decode(response.body);
    });
  }


  Future<String> getJsonData() async{
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept":"application/json"},
    );
//    print(response.body);
    setState(() {
      var convertDatatoJson = json.decode(response.body);
      data = convertDatatoJson['statewise'].toList();
    });
    print(data);
    return "Success";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCountryData();
    this.getJsonData();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
//    fetchCountryData.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

//      shrinkWrap: ShrinkWrappingViewport,
//      resizeToAvoidBottomPadding: false,
      body:
      new Container(

        child : new Container(
          width: double.infinity,
          height: double.infinity,
          child: new Column(
            children: <Widget>[
              MyHeader(
                image: "assets/icons/Drcorona.svg",
                textTop: "All you need",
                textBottom: "is stay at home.",
                offset: offset,
              ),
              SingleChildScrollView(
                padding: new EdgeInsets.all(20.0),
                child:
                Column(
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Center(child:Text('Current Stats for India', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
                    countryData==null?Container():CountryPanel(countryData: countryData,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: data==null?CircularProgressIndicator():SimpleState(data:data),)
            ],
          ),
        ),
      ),
    );
  }
}

