import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sidebar_animation/widgets/counter.dart';
import 'package:sidebar_animation/widgets/countrystats.dart';
import 'package:sidebar_animation/widgets/my_header.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import '../constant.dart';
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
  final controller = ScrollController();
  double offset = 0;
  Map countryData;
  fetchCountryData()async{
    http.Response response = await http.get('https://api.covid19india.org/data.json');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCountryData();
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
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: const EdgeInsets.symmetric(vertical:0),
                    child: Center(child:Text('Current Stats for India', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
                  ),
                  countryData==null?CircularProgressIndicator():CountryPanel(countryData: countryData,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

