import 'package:flutter/material.dart';

class music with ChangeNotifier {
  String? id;
  String name;
  String type;
  String artist;

  music(this.name, this.type, this.artist);

  music.fromMap(this.id, Map<String, dynamic> map)
      : name = map["name"],
        type = map["type"],
        artist = map["artist"];

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "type": type,
      "artist": artist,
    };
  }
}
