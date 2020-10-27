import 'package:flutter/material.dart';
import 'package:flutterhomemev1/listofPlaces.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan[600],
        appBar: AppBar(
          centerTitle: true,
          title: Text('HomeMe'),
          backgroundColor: Colors.lightGreen,
        ),
        body: SelectionScreen(),
      ),
    );
  }
}


class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(50.0, 75.0, 50.0, 10.0),
          child: Row(

            children: [
              FlatButton(
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlacesScreen()),
                  );
                },
                child: Image.asset('images/icons8-prefab-house-100.png'),
              ),
              FlatButton(
                onPressed: (){},
                child: Image.asset('images/icons8-take-away-food-100.png'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50.0, 25.0, 50.0, 10.0),
          child: Row(
            children: [
              FlatButton(

                  onPressed: (){},
                  child: Image.asset('images/icons8-hospital-3-100.png')

              ),
              FlatButton(
                onPressed: (){},
                child: Image.asset('images/icons8-administrative-tools-100.png'),

              ),
            ],
          ),
        ),

      ],
    );
  }
}
