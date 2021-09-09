import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'symptom.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}
//TODO: turn into stateful widgets so we can load data from api. Data gets from API, but the screen is painted before the data has loaded. Need a way to wait for the data and THEN paint the app.
Future<List<Symptom>> fetchSymptoms() async {
  final response = await http.get(
      Uri.parse("https://covidhackatonapi.azurewebsites.net/api/Symptoms"));
  List<dynamic> symptomListDyn = (json.decode(response.body))
      .map((data) => Symptom.fromJson(data))
      .toList();
  List<Symptom> symptomList = symptomListDyn.cast<Symptom>();
  return symptomList;
}

List<Symptom> symptomList() {
  List<Symptom> returnList = [];
  fetchSymptoms().then((value) => returnList = value);
  print("list");
  print(returnList);
  return returnList;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SymptomsListScreen(
        onTapped: handleSymptomTapped,
        symptoms: symptomList(),
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(55.93590298445013, -3.242209414912336),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid Test Center Map"),
        backgroundColor: Colors.grey,
      ),
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        myLocationEnabled: true,
        //myLocationButtonEnabled: true,
        compassEnabled: true,
        markers: _createMarker(),
      ),
    );
  }

  Set<Marker> _createMarker() {
    return {
      /**
      Marker(
        markerId: MarkerId("My position"),
        position: LatLng(55.93590298445013, -3.242209414912336),
      ),
      */

      Marker(
        markerId: MarkerId("Test Center 1"),
        position: LatLng(55.920230224640946, -3.234957402968305),
      ),
      Marker(
        markerId: MarkerId("Test Center 2"),
        position: LatLng(55.93320451435432, -3.1872647175562396),
      ),
      Marker(
        markerId: MarkerId("Test Center 3"),
        position: LatLng(55.9212733088685, -3.2840556527139495),
      ),
      Marker(
        markerId: MarkerId("Test Center 4"),
        position: LatLng(55.958084732616385, -3.3048607223109205),
      ),
      Marker(
        markerId: MarkerId("Test Center 5"),
        position: LatLng(55.97350586917549, -3.22980933856888),
      ),
      Marker(
        markerId: MarkerId("Test Center 6"),
        position: LatLng(55.977187619662764, -3.168123269739805),
      ),
      Marker(
        markerId: MarkerId("Test Center 7"),
        position: LatLng(55.96487539327647, -3.152084891844246),
      ),
      Marker(
        markerId: MarkerId("Test Center 8"),
        position: LatLng(55.9070591609747, -3.21274285952617),
      ),
    };
  }
}
