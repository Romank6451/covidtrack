import 'dart:ui';

import 'package:covidtrack/helper/config.dart';
import 'package:covidtrack/mainpage/Drawer.dart';
import 'package:covidtrack/mainpage/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
        double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            //////map container
            width: width,
            height: height,
            color: Colors.white,
            child: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        
      ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: width,
              height: height/7,
              child: Image.asset('asstes/images/menuback.png',fit: BoxFit.fill,),
            ),
          ),
          Positioned(
            top: height/17,
            left: width/15,
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(TutorialOverlay());
                  },
                  child: Icon(Icons.menu,size: 20,color: Colors.white,)),
                SizedBox(width: width/30,),
                Text('Menu',textScaleFactor: 1.4,style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
         Bottombar()
          
        ],
      ),
      
    );
  }
}
