
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterhomemev1/listofPlaces.dart';
import 'selectionScreen.dart';



class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();

  String zip ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[600],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        title: Text('HomeMe'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: new Icon(Icons.search),
                    hintText: 'zipcode'),
                validator: (val) => val.isEmpty ? 'Enter zipcode' : null,
                onChanged: (val){
                  setState(() => zip = val);
                },
              ),

              SizedBox(height: 25.0),
              SizedBox(
                height: 50.0,
                child: RaisedButton(
                    child: Text('Press here after typing zipcode above'),
                    color: Colors.lightGreen,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondScreen()),
                      );
                    }),
              ),
              SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/homeMe.png',
                    height: 300.0, width: 400.0),
              ),
            ],
          ),
        ),

      ),
    );
  }
}

