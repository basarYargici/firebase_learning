import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learning_app/models/friend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatabaseService with ChangeNotifier {
  // collection referance
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('Friends');

  // create new friend
  Future addFriend(BuildContext context, Friend friend) async {
    try {
      await _collectionReference.add(friend.toJson());
      notifyListeners();
    } on FirebaseException catch (e) {
      print('FirebaseException');
      _showSnackBar(context, e.message);
    } catch (e) {
      print(e.toString());
      _showSnackBar(context, e.message);
      return null;
    }
  }

  // delete friend
  Future deleteFriend(BuildContext context, String id)  async {
    try {
      await _collectionReference.doc(id).delete();
    } on FirebaseException catch (e) {
      print('FirebaseException');
      _showSnackBar(context, e.message);
    } catch (e) {
      print(e.toString());
      _showSnackBar(context, e.message);
      return null;
    }
  }

  // fetch all friends
  Stream<QuerySnapshot> fetchFriend(BuildContext context) {
    try {
      var querySnapshot = _collectionReference.snapshots();
      return querySnapshot;
    } on FirebaseException catch (e) {
      print('FirebaseException');
      _showSnackBar(context, e.message);
      return null;
    } catch (e) {
      print(e.toString());
      _showSnackBar(context, e.message);
      return null;
    }
  }

  void _showSnackBar(BuildContext context, String text) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
