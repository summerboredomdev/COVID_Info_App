import 'dart:convert';

import 'package:covidapp/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Symptom {
  final String name;
  final String description;

  Symptom({required this.name, required this.description});

  factory Symptom.fromJson(Map<String, dynamic> json) {
    return Symptom(name: json['name'], description: json['description']);
  }
}

class SymptomsListScreen extends StatefulWidget {
  SymptomsListScreen() : super();
  @override
  _SymptomsScreenState createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsListScreen> {
  List<Symptom> symptoms = [];

  @override
  void initState() {
    super.initState();
    fetchSymptoms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            for (var symptom in symptoms)
              ListTile(
                title: Text(symptom.name),
                subtitle: Text(symptom.description),
                onTap: () => handleSymptomTapped(symptom),
              )
          ],
        ));
  }

  void handleSymptomTapped(Symptom symptom) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                title: Text(symptom.name),
                backgroundColor: Colors.grey,
              ),
              body: Center(
                  child:
                      Text(symptom.description, textAlign: TextAlign.center)));
        },
      ),
    );
  }

  void fetchSymptoms() async {
    final response = await http.get(
        Uri.parse("https://covidhackatonapi.azurewebsites.net/api/Symptoms"));
    List<dynamic> symptomListDyn = (json.decode(response.body))
        .map((data) => Symptom.fromJson(data))
        .toList();
    List<Symptom> symptomList = symptomListDyn.cast<Symptom>();
    symptoms = symptomList;
  }
}
