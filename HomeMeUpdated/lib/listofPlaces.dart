import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterhomemev1/place_model.dart';
import 'package:flutterhomemev1/place_service.dart';
import 'package:http/http.dart' as http;





class PlacesScreen extends StatefulWidget {
  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[600],
      appBar: AppBar(
        centerTitle: true,
        title: Text('HomeMe'),
        backgroundColor: Colors.lightGreen,
      ),

      body: _createContent(),
    );
  }

  Widget _createContent(){
    if(_places ==null){
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }

    else{

      return new ListView(
        children: _places.map((e){

          return new Card(
            child: new ListTile(
              title: new Text(e.name),
              subtitle: new Text(e.vicinity),
              trailing: new Column(
                children: <Widget>[
                  new Icon(Icons.star),
                  new Text(e.rating),
                ],
              ),
            ),
          );
        }).toList(),
    );


  }

  }

List<Place> _places;
  @override void initState(){
    super.initState();
    
    PlacesService.get().getNearbyPlaces().then((value){
    this.setState(() {
      _places = value;
    });

    });

  }

}







































//
// Future<Place> fetchAlbum() async {
//   final response =
//   await http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&type=restaurant&keyword=cruise&key=AIzaSyD8yB15l_1DmbKp8aEaEdeZyn01XEHj0kI');
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Place.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
//
// }
//
//
//
//
//

//
// class Placesnearby extends StatefulWidget {
//   @override
//   _PlacesnearbyState createState() => _PlacesnearbyState();
// }
//
// class _PlacesnearbyState extends State<Placesnearby> {
//   Future<Place> futureAlbum;
//
//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<Place>(
//             future: futureAlbum,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data.title);
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }
//
//               // By default, show a loading spinner.
//               return CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//
//
//
//
//   }
// }
