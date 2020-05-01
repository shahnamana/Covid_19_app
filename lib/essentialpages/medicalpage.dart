import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sidebar_animation/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:sidebar_animation/models/place.dart';
import 'package:sidebar_animation/service/geolocator_service.dart';
import 'package:sidebar_animation/service/places_service_medical.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';
import '../screen/search_dart_medical.dart';



class MedicalPage extends StatelessWidget {
  final locatorService = GeoLocatorService();
  final placesServiceMedical = PlacesServiceMedical();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(create: (context) => locatorService.getLocation()),
        ProxyProvider<Position,Future<List<Place>>>(
          update: (context,position,places){
            return (position !=null) ? placesServiceMedical.getPlaces(position.latitude, position.longitude) :null;
          },
        )
      ],
      child: Search(),
    );
  }

}
