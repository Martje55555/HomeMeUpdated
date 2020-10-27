import 'dart:async';

import 'package:flutterhomemev1/place_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlacesService{
  static final _service = new PlacesService();

  static PlacesService get(){
    return _service;
  }

  final String fetchUrl = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=1500&keyword=housing&key=AIzaSyD8yB15l_1DmbKp8aEaEdeZyn01XEHj0kI';

  Future<List<Place>> getNearbyPlaces() async{
    var response = await http.get(fetchUrl,headers:{"Accept":"application/json"});

    var places = <Place>[];

    List data = json.decode(response.body)["results"];
    
    data.forEach((i) => places.add(new Place(i["name"],i["rating"].toString(), i["vicinity"])));
    return places;
  }

}
