import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sidebar_animation/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:sidebar_animation/models/place.dart';
import 'package:sidebar_animation/service/geolocator_service.dart';
import 'package:sidebar_animation/service/places_service_medical.dart';
import 'package:sidebar_animation/service/places_services_grocery.dart';

import '../screen/search_dart_medical.dart';



class GroceryPage extends StatelessWidget with NavigationStates
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Grocery();
  }
}

class Grocery extends StatefulWidget {
  @override
  _Grocery createState() =>   _Grocery();
}

class _Grocery extends State<Grocery> {
  final locatorService = GeoLocatorService();
  final placesService = PlacesServiceGrocery();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(create: (context) => locatorService.getLocation()),
        ProxyProvider<Position,Future<List<Place>>>(
          update: (context,position,places){
            return (position !=null) ? placesService.getPlaces(position.latitude, position.longitude) :null;
          },
        )
      ],
      child: Search(),
    );
  }
}
