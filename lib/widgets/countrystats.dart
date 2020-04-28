import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPanel extends StatelessWidget{

  final Map countryData;

  const CountryPanel({Key key, this.countryData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(
            title: 'Maharashtara',
            panelColor:Colors.red[100],
            textColor: Colors.red,
            count:countryData['states_daily'][0]['mh'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor:Colors.blue[100],
            textColor: Colors.blue,
            count:countryData['states_daily'][0]['kl'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor:Colors.green[100],
            textColor: Colors.green,
            count:'34',
          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor:Colors.grey[100],
            textColor: Colors.grey,
            count:'1234',
          ),

        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget{

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(20),
      height: 80,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: textColor),),
          Text(count,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor),),
        ],
      ),
    );
  }
}