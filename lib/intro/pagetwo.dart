import 'package:flutter/material.dart';

class Pagetwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('asstes/images/LogoMakr_5VFiXi.png'),
            SizedBox(height: 20,),
            Text('PATH TRACK',textScaleFactor: 1.7,style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text('this app will help you to track any person',textScaleFactor: 1.2,style: TextStyle(color: Colors.grey),),
            Text('path using his id and you can also check',textScaleFactor: 1.2,style: TextStyle(color: Colors.grey),),
            Text('entry time of any person.',textScaleFactor: 1.2,style: TextStyle(color: Colors.grey),),
            
          ],
        ),
      ),
    );
  }
}