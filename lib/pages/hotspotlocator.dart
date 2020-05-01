import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sidebar_animation/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:sidebar_animation/models/place.dart';
import 'package:sidebar_animation/service/geolocator_service.dart';
import 'package:sidebar_animation/service/places_service_medical.dart';

import '../screen/search_dart_medical.dart';



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
  final locatorService = GeoLocatorService();
  final placesService = PlacesServiceMedical();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MultiProvider(
        providers: [
          FutureProvider(create: (context) => locatorService.getLocation()),
          ProxyProvider<Position,Future<List<Place>>>(
            update: (context,position,places){
              return (position !=null) ? placesService.getPlaces(position.latitude, position.longitude) :null;
            },
          )
        ],
        child: Search(),
      ),
    );
  }
}
