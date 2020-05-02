import 'package:http/http.dart' as http;
import 'package:sidebar_animation/models/place.dart';
import 'dart:convert' as convert;

class PlacesServiceGrocery{
  final key = 'YOUR_KEY';

  Future<List<Place>> getPlaces(double lat, double lng) async {
    var response = await http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&keyword=Grocery store&rankby=distance&key=$key');
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }

}
