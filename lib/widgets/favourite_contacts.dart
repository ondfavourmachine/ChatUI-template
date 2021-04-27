import 'package:chat_ui_app/models/message_model.dart';
import 'package:chat_ui_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class FavouriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favourite Contacts',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
                IconButton(
                    iconSize: 30,
                    color: Colors.blueGrey,
                    icon: Icon(Icons.more_horiz),
                    onPressed: () {})
              ],
            ),
          ),
          Container(
            height: 120,
            color: Theme.of(context).accentColor,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: favourites.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ChatScreen(user: favourites[index]))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage(favourites[index].imageUrl),
                        ),
                        SizedBox(height: 7),
                        Text(
                          favourites[index].name,
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
