import 'package:chat_ui_app/models/message_model.dart';
import 'package:chat_ui_app/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Widget _buildMessageWidget(Message m, bool me) {
    final BorderRadius radius = me
        ? BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15))
        : BorderRadius.only(
            topRight: Radius.circular(15), bottomRight: Radius.circular(15));
    final Icon iconToshow =
        m.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border);
    final Color colorOfICon =
        m.isLiked ? Theme.of(context).primaryColor : Colors.blueGrey;

    final Container msg = Container(
      width: MediaQuery.of(context).size.width * 0.75,
      margin: me
          ? EdgeInsets.only(top: 8, bottom: 8, left: 80)
          : EdgeInsets.only(top: 8, bottom: 8),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      decoration: BoxDecoration(
          color: me ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
          borderRadius: radius),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            m.time,
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          SizedBox(
            height: 9,
          ),
          Text(m.text,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 19)),
        ],
      ),
    );

    if (me) {
      return msg;
    }
    return Row(
      children: [
        msg,
        IconButton(
            icon: iconToshow,
            iconSize: 30,
            color: colorOfICon,
            onPressed: () {})
      ],
    );
  }

  Widget _buildTextInputBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      color: Colors.white,
      height: 90,
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.photo),
              iconSize: 20,
              color: Theme.of(context).primaryColor,
              onPressed: () {}),
          Expanded(
              child: TextField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(hintText: 'Send a message...'),
          )),
          IconButton(
              icon: Icon(Icons.send),
              iconSize: 20,
              color: Theme.of(context).primaryColor,
              onPressed: () {})
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(
          widget.user.name,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
        ),
        centerTitle: true,
        // toolbarHeight: 150,
        elevation: 0,
        actions: [IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 15),
                      itemCount: messages.length,
                      reverse: true,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = messages[index];
                        bool isMe = message.sender.id == currentUser.id;
                        return _buildMessageWidget(message, isMe);
                      }),
                ),
              ),
            ),
            _buildTextInputBox()
          ],
        ),
      ),
    );
  }
}
