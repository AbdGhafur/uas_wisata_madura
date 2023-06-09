// ignore_for_file: use_key_in_widget_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

import '../components/list_place.dart';
import '../dummy_data.dart';

class PlacesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final id = route['id'];
    final title = route['title'];
    final placeLists = PLACES_DUMMY_DATA.where((place) {
      return place.category == id;
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Wisata " + title!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListPlace(
            placeLists[index].id,
            placeLists[index].name,
            placeLists[index].image,
            placeLists[index].description,
          );
        },
        itemCount: placeLists.length,
      ),
    );
  }
}
