import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidtrack/helper/config.dart';
import 'package:covidtrack/mainpage/Drawer.dart';
import 'package:covidtrack/mainpage/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

 var clocation;
  List<LatLng> path= List();
  List<LatLng> path2= List();
 Completer<GoogleMapController> _controller = Completer();


  Future<LatLng> getcurrentlocation() async {
    LocationData currentLocation;
    var location = new Location();
    var cl=await location.getLocation();
    clocation=LatLng(cl.latitude,cl.longitude);
    print("got current location ");
    setState(() {

    });
    return LatLng(cl.latitude,cl.longitude);

  }



  Future<void> getpaths(String id) async {
    print("getting paths for "+id);

   QuerySnapshot querySnapshot=await Firestore.instance.collection("users").where("users",isEqualTo: id).orderBy("time").getDocuments();
   print("path points "+querySnapshot.documents.length.toString());
   querySnapshot.documents.forEach((e) {
     DocumentSnapshot documentSnapshot=e ;
     GeoPoint point=documentSnapshot["location"];

     var lat=LatLng(point.latitude,point.longitude);
     path.add(lat);
     setState(() {

     });



   });
   _controller.future.then((value) => {
   value.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(bearing: 0.0,target: path.last,zoom: 10.0)))

   });
   print("path is added ");
   
    
  }




//    CameraPosition _kGooglePlex = CameraPosition(
//    target: path.last,
//    zoom: 14.4746,
//  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcurrentlocation();
    path2.add(LatLng(37.42796133580664, -122.085749655962));
    path2.add(LatLng(37.41796133580664, -122.185749655962));
    path2.add(LatLng(37.41396133580664, -122.185743655962));



    

  }
  @override
  Widget build(BuildContext context) {
        double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 10),

            //////map container
            width: width,
            height: height-120,
            color: Colors.redAccent,


            child: GoogleMap(

              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },

              mapToolbarEnabled: true,


        mapType: MapType.normal,
        zoomControlsEnabled: false,
        polylines: {
          Polyline(
            polylineId: PolylineId("id"),
            color: Colors.black,
            width: 2,
            points:path!=null?path:path2,


          )
        },

        myLocationEnabled: true,

initialCameraPosition: CameraPosition(
  target:LatLng(32.184514,70.6058493),
  zoom: 10,
),
//        initialCameraPosition: clocation!=null?CameraPosition(
//          target: clocation,
//          zoom: 14,
//        ):_kGooglePlex,
        
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
//                    getpaths("10196103294911101361497751");
                  },
                  child: Icon(Icons.menu,size: 20,color: Colors.white,)),
                SizedBox(width: width/30,),
                Text('Menu',textScaleFactor: 1.4,style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
         Bottombar(getpaths)
          
        ],
      ),
      
    );
  }
}
