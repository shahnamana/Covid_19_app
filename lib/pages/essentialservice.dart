import 'package:flutter/material.dart';
import 'package:sidebar_animation/essentialpages/grocerypage.dart';
import 'package:sidebar_animation/essentialpages/medicalpage.dart';
import 'package:sidebar_animation/essentialpages/moreinformation.dart';
import 'package:sidebar_animation/screen/search_dart_grocery.dart';
import 'package:sidebar_animation/service/places_services_grocery.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../service/geolocator_service.dart';
import '../service/places_service_medical.dart';
import 'package:provider/provider.dart';
import 'package:sidebar_animation/models/place.dart';

import '../screen/search_dart_medical.dart';
import 'hotspotlocator.dart';


class EssentialServices extends StatelessWidget with NavigationStates {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Essential();
  }

}

class Essential extends StatefulWidget{
  @override
  _Essential createState()=> _Essential();
}

class _Essential extends State<Essential>{
  int _currentIndex = 0;
  final locatorService = GeoLocatorService();
  final placesServiceMedical = PlacesServiceMedical();
  final placesServiceGrocery = PlacesServiceGrocery();


  final tabs = [
    HotspotLocator(),
    GroceryPage(),
    MoreInformation(),
  ];

  Widget callPage(int currentIndex)
  {
    switch (currentIndex){
      case 0:
        return medicalPage(context);
        break;
      case 1:
        return groceryPage(context);
        break;
    }
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: callPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Color(0xFF3383CD),
          selectedItemColor: Colors.white,
          backgroundColor: Color(0xFF11249F),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.local_hospital),
                title: Text("Medical Store", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_grocery_store),
              title: Text("Grocery",  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
          onTap: (index){
            _currentIndex = index;
            setState(() {
            });
          },
        ),
      );
    }
    Widget medicalPage(BuildContext context){
      return Container(
          child: MultiProvider(
            providers: [
            FutureProvider(create: (context) => locatorService.getLocation()),
            ProxyProvider<Position,Future<List<Place>>>(
            update: (context,position,places){
            return (position !=null) ? placesServiceMedical.getPlaces(position.latitude, position.longitude) :null;
            },
            )
            ],
            child: Search(),
            ),
      );
    }

  Widget groceryPage(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(create: (context) => locatorService.getLocation()),
        ProxyProvider<Position,Future<List<Place>>>(
          update: (context,position,places){
            return (position !=null) ? placesServiceGrocery.getPlaces(position.latitude, position.longitude) :null;
          },
        )
      ],
      child: SearchGrocery(),
    );
  }
  }
























