import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learning_app/config/constants/color_constants.dart';
import 'package:firebase_learning_app/models/friend.dart';
import 'package:firebase_learning_app/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../friend_form_screen.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var friends = [];
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          var database = Provider.of<DatabaseService>(context);
          return buildStreamBuilder(database, context, friends);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.BLUE_GREY,
        child: Icon(Icons.add, color: ColorConstants.WHITE),
        onPressed: () {
          Navigator.pushNamed(context, FriendForm.routeName);
        },
      ),
    );
  }

  StreamBuilder<QuerySnapshot> buildStreamBuilder(DatabaseService database, BuildContext context, List friends) {
    return StreamBuilder<QuerySnapshot>(
      stream: database.fetchFriend(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          friends = snapshot.data.docs.map<Friend>((doc) => Friend.fromMap(doc.data(), doc.id)).toList();
          return ListView.separated(
            itemCount: friends.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(friends[index].id),
                leading: Text(friends[index].name),
                subtitle: Text(friends[index].age.toString()),
                onTap: () async {
                  await database.deleteFriend(context, friends[index].id);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                thickness: 0.3,
                color: ColorConstants.WHITE,
              );
            },
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
