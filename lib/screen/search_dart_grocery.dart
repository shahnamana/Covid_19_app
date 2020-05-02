import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sidebar_animation/service/marker_service.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/place.dart';
import '../service/geolocator_service.dart';

class SearchGrocery extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(context);
    final placesProvider = Provider.of<Future<List<Place>>>(context);
    final geoService = GeoLocatorService();
    final markerService = MarkerService();

    return FutureProvider(
      create: (context) => placesProvider,
      child: Scaffold(
        body: (currentPosition != null)
            ? Consumer<List<Place>>(
          builder: (_, places, __) {
            var markers = (places != null)?markerService.getMarkers(places):List<Marker>();
            return (places != null)?Column(
              children: <Widget>[
//                SizedBox(height: 20,),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(currentPosition.latitude,
                            currentPosition.longitude),
                        zoom: 16.0),
                    zoomGesturesEnabled: true,
                    markers: Set<Marker>.of(markers),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: places.length,
                      itemBuilder: (context, index) {
                        return FutureProvider(
                            create: (context)=> geoService.getDistance(
                                currentPosition.latitude,
                                currentPosition.longitude,
                                places[index].geometry.location.lat,
                                places[index].geometry.location.lng),
                            child:Card(
                              child: ListTile(
                                title: Text(places[index].name),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 5.0,),
                                    (places[index].rating != null)? Row(
                                      children: <Widget>[
                                        RatingBarIndicator(
                                          rating: places[index].rating,
                                          itemBuilder: (context, index)=> Icon(Icons.star, color: Colors.amber,),
                                          itemCount: 5,
                                          itemSize: 10.0,
                                          direction: Axis.horizontal,
                                        )
                                      ],
                                    ):Row(),
                                    SizedBox(height: 5.0,),
                                    Consumer<double>(
                                      builder: (context, meters, widget){
                                        return (meters !=null)?Text('${places[index].vicinity} \u00b7 ${(meters/1000).round()} Km'):Container();
                                      },
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.directions),
                                  color: Color(0xFF11249F),
                                  onPressed: (){
                                    _launchMapsUrl(places[index].geometry.location.lat, places[index].geometry.location.lng);
                                  },
                                ),
                              ),
                            )
                        );
                      }),
                )
              ],
            ) : Center(child:CircularProgressIndicator());
          },
        )
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
  void _launchMapsUrl(double lat, double lng) async{
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    if (await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'Could not Launch Url';
    }
  }
}
