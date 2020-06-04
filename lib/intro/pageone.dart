import 'package:flutter/material.dart';

class Pageone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('asstes/images/Screenshot 2020-06-01 at 8.43.04 PM.png'),
            SizedBox(height: 20,),
            Text('COVID TRACKER',textScaleFactor: 1.7,style: TextStyle(fontWeight: FontWeight.bold),),
             SizedBox(height: 10,),
            Text('A solution to track all the infected',textScaleFactor: 1.2,style: TextStyle(color: Colors.grey),),
            Text('areas and find all suspects',textScaleFactor: 1.2,style: TextStyle(color: Colors.grey),),
            
          ],
        ),
      ),
    );
  }
}