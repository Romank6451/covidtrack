import 'package:flutter/material.dart';


class TutorialOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 200);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.7);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
        double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          width:width,
          height: height/1.2,
          child: Image.asset('asstes/images/menu_backgroun.png',fit: BoxFit.fill,),
        ),
         Positioned(
            top: 17,
            left: width/15,
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close,size: 30,color: Colors.white.withOpacity(0.7),)),
                SizedBox(width: width/30,),
                
              ],
            ),
          ),
          Positioned(
            top: height/10,
            child: Container(
              width: width,
              height: 1,
              color: Colors.white.withOpacity(0.3),
            ),
          ),

          Positioned(
            top: height/4,
            left: width/6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Donate us',textScaleFactor: 1.1,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
                SizedBox(height: 15,),
                Text('Share this app',textScaleFactor: 1.1,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
                SizedBox(height: 15,),
                Text('Privacy and Polices',textScaleFactor: 1.1,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
                SizedBox(height: 15,),
                Text('About us',textScaleFactor: 1.1,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
                SizedBox(height: height/3.5,),
                Text('version 1.1.0',textScaleFactor: 1,style: TextStyle(color: Colors.white),),
              ],
              
            ),
          )

      ],
    );
  }

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: child
    );
  }
}