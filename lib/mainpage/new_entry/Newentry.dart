import 'dart:ui';



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:qrscan/qrscan.dart' as scanner;




class Newentry extends StatefulWidget {
  @override
  _NewentryState createState() => _NewentryState();
}




class _NewentryState extends State<Newentry> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stat_scanning();


  }

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
            child: Center(
              child: FlatButton(
                onPressed: () async {

                   stat_scanning();



                },
                child: Text("Start Scan"),
              ),
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
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back,size: 20,color: Colors.white,)),
                SizedBox(width: width/30,),
                Text('New Entry',textScaleFactor: 1.4,style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
         
          
        ],
      ),
      
    );
  }

  void stat_scanning() async {
     LocationData currentLocation;
    var location = new Location();
    var cl=await location.getLocation();
    print("location "+cl.latitude.toString());
    print("location "+cl.longitude.toString());
    
    String cameraScanResult = await scanner.scan();
    print("datascaneed "+cameraScanResult);
    
    Firestore.instance.collection("users").document().setData({
      "time":FieldValue.serverTimestamp(),
      "location":GeoPoint(cl.latitude,cl.longitude),
      "users":cameraScanResult,
      "temp":100,
    }).then((value) => (){
      Flushbar(
        title:  "Updated",
        message:  "Location data is updated",
        duration:  Duration(seconds: 3),
      )..show(context);
    });
  }
}
