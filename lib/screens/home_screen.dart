import 'package:chat_ui_app/widgets/category_selector.dart';
import 'package:chat_ui_app/widgets/favourite_contacts.dart';

import 'package:chat_ui_app/widgets/recent_chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 20,
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          'Chats',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              iconSize: 20,
              color: Colors.white,
              onPressed: () {})
        ],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          CategorySelector(),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    FavouriteContacts(),
                    RecentChats(),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
