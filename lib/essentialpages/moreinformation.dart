import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class MoreInformation extends StatelessWidget {

  Future<void> _launched;
  String _launchUrl = 'https://www.covid19india.org/essentials';


  Future<void> _launchInBrowser(String url)async{
    if(await canLaunch(_launchUrl)){
      await launch(url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{
        'header_key':'header_value'
        }
      );
    }
    else{
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUniversalLinkIos(String url)async{
    if(await canLaunch(url)){
      final bool nativeAppLaunchSucceeded = await launch(url,forceSafariVC: false, universalLinksOnly: true);
      if(!nativeAppLaunchSucceeded){
        await launch(url, forceSafariVC: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children:<Widget>[
        RaisedButton(
          child: const Text('Click Here'),
          onPressed:(){
            _launchUniversalLinkIos(_launchUrl);
            },
        ),
      ],
    );
  }
}