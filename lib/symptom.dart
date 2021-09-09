import 'package:flutter/material.dart';

class Symptom {
  final String name;
  final String description;

  Symptom({required this.name, required this.description});

  factory Symptom.fromJson(Map<String, dynamic> json) {
    return Symptom(name: json['name'], description: json['description']);
  }
}

class SymptomsListScreen extends StatelessWidget {
  final List<Symptom> symptoms;
  final ValueChanged<Symptom> onTapped;
  SymptomsListScreen({
    required this.symptoms,
    required this.onTapped,
  });
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
              onTap: () => onTapped(symptom),
            )
        ],
      ),
    );
  }
}

void handleSymptomTapped(Symptom symptom) {
  print(symptom.name);
}
