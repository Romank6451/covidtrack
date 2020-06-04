import 'dart:ui';

import 'package:covidtrack/helper/config.dart';
import 'package:covidtrack/mainpage/Drawer.dart';
import 'package:covidtrack/mainpage/widgets/bottombar.dart';
import 'package:flutter/material.dart';

class Infected extends StatefulWidget {
  @override
  _InfectedState createState() => _InfectedState();
}

class _InfectedState extends State<Infected> {
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
                Text('Infected Areas',textScaleFactor: 1.4,style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
         
          
        ],
      ),
      
    );
  }
}
