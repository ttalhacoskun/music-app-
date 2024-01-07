import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:music/model/music.dart';
import 'package:music/view/add_music_page.dart';
import 'package:music/view_model/add_music_view_model.dart';
import 'package:provider/provider.dart';

class MainViewModel with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<music> _musics = [];

  List<music> get musics => _musics;

  MainViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getmusics();
    });
  }

  void _getmusics() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection("musics").get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
        in snapshot.docs) {
      music Music = music.fromMap(
        documentSnapshot.id,
        documentSnapshot.data(),
      );
      _musics.add(Music);
    }
    notifyListeners();
  }

  void openAddmusicPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => AddmusicViewModel(),
        child: AddmusicPage(),
      ),
    );
    Navigator.push(context, pageRoute).then((value) {
      _musics.clear();
      _getmusics();
    });
  }
}
