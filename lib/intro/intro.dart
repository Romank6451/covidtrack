import 'package:covidtrack/helper/config.dart';
import 'package:covidtrack/intro/pageone.dart';
import 'package:covidtrack/intro/pagethree.dart';
import 'package:covidtrack/intro/pagetwo.dart';
import 'package:covidtrack/mainpage/dashboard.dart';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {

  final controller=PageController(
    initialPage: 0,
    keepPage: true
  );
int pagestart=0;
  pagechange(int index){
    setState(() {
      
      print("pagestart:$pagestart");
    controller.animateToPage(index, duration: Duration(milliseconds: 400), curve: Curves.linear);
      
    });

  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
            color: MyColors.backgroundcolor,
          ),
          Container(
            width: width,
            height: height/1.2,
            
            child: Image.asset("asstes/images/Component 2 GÇô 1.png",fit: BoxFit.fill,),
          ),
          Container(
            width: width,
            height: height/1.7,
            child: PageView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Pageone(),
                Pagetwo(),
                Pagethree(),
                
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(children: <Widget>[
                Text('${pagestart+1}/3',textScaleFactor: 1.3,style: TextStyle(color: Colors.white),),
                Expanded(child: SizedBox()),
                FloatingActionButton(onPressed: (){
                  setState(() {
                    pagestart+=1;
                    if(pagestart>2){
                      setState(() {
                        pagestart=0;
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
                      });
                    }
                    pagechange(pagestart);
                  });
                  

              },
              backgroundColor: MyColors.greencolor,
              child: Icon(Icons.arrow_forward_ios),
              ),
              ],)
            ),
          )
        ],
        
      ),
    );
  }
}