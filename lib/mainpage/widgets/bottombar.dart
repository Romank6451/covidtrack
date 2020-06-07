import 'package:covidtrack/helper/config.dart';
import 'package:covidtrack/mainpage/help_center/helpcenter.dart';
import 'package:covidtrack/mainpage/infected_areas/infected.dart';
import 'package:covidtrack/mainpage/new_entry/Newentry.dart';
import 'package:covidtrack/mainpage/track_path/track.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class Bottombar extends StatefulWidget {
  Function func;


  Bottombar(this.func);

  @override
  _BottombarState createState() => _BottombarState(func);
}

class _BottombarState extends State<Bottombar> {
 static String selectedid="";
 Function func;


 _BottombarState(this.func);

 @override
  Widget build(BuildContext context) {
        double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width,
              height: height/5.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                color: MyColors.backgroundcolor,
                boxShadow:[ BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3)
                )]
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top:5.0),
//                  child: Text('Click to expend',style: TextStyle(color: Colors.white),),
                ),
              )
              
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width,
              height: height/7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30,top: 4,right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Explore Nearby you'),
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Infected()));
                          },
                          child: Column(
                            children: <Widget>[
                              Image.asset('asstes/images/Component 8 GÇô 1.png',scale: 1.3,),
                              Text('Infected \n  areas')
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        InkWell(
                          onTap: () async {
//                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Track()));
                            String cameraScanResult = await scanner.scan();
                            print("datascaneed "+cameraScanResult);
                            func(cameraScanResult);

                          },
                          child: Column(
                            children: <Widget>[
                              Image.asset('asstes/images/Component 7 GÇô 1.png',scale: 1.3,),
                              Text('Track \n path')
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Helpcenter()));

                          },
                          child: Column(
                            children: <Widget>[
                              Image.asset('asstes/images/help.png',scale: 1.3,),
                              Text('Help \ncenter')
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        InkWell(
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Newentry()));


                          },
                          child: Column(
                            children: <Widget>[
                              Image.asset('asstes/images/Component 6 GÇô 1.png',scale: 1.3,),
                              Text('New \nEntry')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}