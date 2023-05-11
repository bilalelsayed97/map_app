import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mapapp/helpers/db.helper.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        location: null,
        image: pickedImage);
    _items.add(newPlace);
    DBhelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
    notifyListeners();
  }

  Future<void> fectchAndSetPlaces() async {
    final dataList = await DBhelper.getData('user_places');
    _items = dataList
        .map((item) => Place(
              id: item['id'],
              title: item['title'],
              image: File(item['image']),
              location: null,
            ))
        .toList();
    notifyListeners();
  }
}
