import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:music/model/music.dart';

class AddmusicViewModel with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addmusic(
      BuildContext context, String name, String type, String artist) async {
    music Music = music(name, type, artist);
    await _firestore.collection("musics").doc().set(Music.toMap());
    Navigator.pop(context);
  }
}
