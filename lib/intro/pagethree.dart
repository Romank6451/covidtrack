import 'package:flutter/material.dart';

class Pagethree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('asstes/images/LogoMakr_2nz3Ox.png'),
            SizedBox(height: 20,),
            Text('INFECTED AREAS',textScaleFactor: 1.7,style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text('Get the locations of infected areas',textScaleFactor: 1.2,style: TextStyle(color: Colors.grey),),
            Text('and avoid to visit those areas and',textScaleFactor: 1.2,style: TextStyle(color: Colors.grey),),
            Text('alse suspected paths.',textScaleFactor: 1.2,style: TextStyle(color: Colors.grey),),
            
          ],
        ),
      ),
    );
  }
}