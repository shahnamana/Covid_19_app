import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sidebar_animation/widgets/counter.dart';
import 'package:sidebar_animation/widgets/my_header.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import '../constant.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget with NavigationStates {
//  @override
//  _HomeScreenState createState() => _HomeScreenState();
  final controller = ScrollController();
  double offset = 0;

  void initState() {
    // TODO: implement initState
    controller.addListener(onScroll);
    super.initState();
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Case Update\n",
                              style: kTitleTextstyle,
                            ),
                            TextSpan(
                              text: "Newest update March 28",
                              style: TextStyle(
                                color: kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "See details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(
                          color: kInfectedColor,
                          number: 1046,
                          title: "Infected",
                        ),
                        Counter(
                          color: kDeathColor,
                          number: 87,
                          title: "Deaths",
                        ),
                        Counter(
                          color: kRecovercolor,
                          number: 46,
                          title: "Recovered",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Spread of Virus",
                        style: kTitleTextstyle,
                      ),
                      Text(
                        "See details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
//class _HomeScreenState extends State<HomePage> {
////  final controller = ScrollController();
////  double offset = 0;
////
////  @override
////  void initState() {
////    // TODO: implement initState
////    super.initState();
////    controller.addListener(onScroll);
////  }
////
////  @override
////  void dispose() {
////    // TODO: implement dispose
////    controller.dispose();
////    super.dispose();
////  }
////
////  void onScroll() {
////    setState(() {
////      offset = (controller.hasClients) ? controller.offset : 0;
////    });
////  }
////
////  @override
////  Widget build(BuildContext context) {
////    return Scaffold(
////      body: SingleChildScrollView(
////        controller: controller,
////        child: Column(
////          children: <Widget>[
////            MyHeader(
////              image: "assets/icons/Drcorona.svg",
////              textTop: "All you need",
////              textBottom: "is stay at home.",
////              offset: offset,
////            ),
////            Container(
////              margin: EdgeInsets.symmetric(horizontal: 20),
////              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
////              height: 60,
////              width: double.infinity,
////              decoration: BoxDecoration(
////                color: Colors.white,
////                borderRadius: BorderRadius.circular(25),
////                border: Border.all(
////                  color: Color(0xFFE5E5E5),
////                ),
////              ),
////              child: Row(
////                children: <Widget>[
////                  SvgPicture.asset("assets/icons/maps-and-flags.svg"),
////                  SizedBox(width: 20),
////                  Expanded(
////                    child: DropdownButton(
////                      isExpanded: true,
////                      underline: SizedBox(),
////                      icon: SvgPicture.asset("assets/icons/dropdown.svg"),
////                      value: "Indonesia",
////                      items: [
////                        'Indonesia',
////                        'Bangladesh',
////                        'United States',
////                        'Japan'
////                      ].map<DropdownMenuItem<String>>((String value) {
////                        return DropdownMenuItem<String>(
////                          value: value,
////                          child: Text(value),
////                        );
////                      }).toList(),
////                      onChanged: (value) {},
////                    ),
////                  ),
////                ],
////              ),
////            ),
////            SizedBox(height: 20),
////            Padding(
////              padding: EdgeInsets.symmetric(horizontal: 20),
////              child: Column(
////                children: <Widget>[
////                  Row(
////                    children: <Widget>[
////                      RichText(
////                        text: TextSpan(
////                          children: [
////                            TextSpan(
////                              text: "Case Update\n",
////                              style: kTitleTextstyle,
////                            ),
////                            TextSpan(
////                              text: "Newest update March 28",
////                              style: TextStyle(
////                                color: kTextLightColor,
////                              ),
////                            ),
////                          ],
////                        ),
////                      ),
////                      Spacer(),
////                      Text(
////                        "See details",
////                        style: TextStyle(
////                          color: kPrimaryColor,
////                          fontWeight: FontWeight.w600,
////                        ),
////                      ),
////                    ],
////                  ),
////                  SizedBox(height: 20),
////                  Container(
////                    padding: EdgeInsets.all(20),
////                    decoration: BoxDecoration(
////                      borderRadius: BorderRadius.circular(20),
////                      color: Colors.white,
////                      boxShadow: [
////                        BoxShadow(
////                          offset: Offset(0, 4),
////                          blurRadius: 30,
////                          color: kShadowColor,
////                        ),
////                      ],
////                    ),
////                    child: Row(
////                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
////                      children: <Widget>[
////                        Counter(
////                          color: kInfectedColor,
////                          number: 1046,
////                          title: "Infected",
////                        ),
////                        Counter(
////                          color: kDeathColor,
////                          number: 87,
////                          title: "Deaths",
////                        ),
////                        Counter(
////                          color: kRecovercolor,
////                          number: 46,
////                          title: "Recovered",
////                        ),
////                      ],
////                    ),
////                  ),
////                  SizedBox(height: 20),
////                  Row(
////                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
////                    children: <Widget>[
////                      Text(
////                        "Spread of Virus",
////                        style: kTitleTextstyle,
////                      ),
////                      Text(
////                        "See details",
////                        style: TextStyle(
////                          color: kPrimaryColor,
////                          fontWeight: FontWeight.w600,
////                        ),
////                      ),
////                    ],
////                  ),
////                  Container(
////                    margin: EdgeInsets.only(top: 20),
////                    padding: EdgeInsets.all(20),
////                    height: 178,
////                    width: double.infinity,
////                    decoration: BoxDecoration(
////                      borderRadius: BorderRadius.circular(20),
////                      color: Colors.white,
////                      boxShadow: [
////                        BoxShadow(
////                          offset: Offset(0, 10),
////                          blurRadius: 30,
////                          color: kShadowColor,
////                        ),
////                      ],
////                    ),
////                    child: Image.asset(
////                      "assets/images/map.png",
////                      fit: BoxFit.contain,
////                    ),
////                  ),
////                ],
////              ),
////            ),
////          ],
////        ),
////      ),
////    );
////  }
//}
