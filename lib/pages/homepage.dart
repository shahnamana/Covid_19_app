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
    http.Response response = await http.get('https://api.covid19india.org/states_daily.json');
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                      value: "Indonesia",
                      items: [
                        'Indonesia',
                        'Bangladesh',
                        'United States',
                        'Japan'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
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
          ],
        ),
      ),
    );
  }
}

