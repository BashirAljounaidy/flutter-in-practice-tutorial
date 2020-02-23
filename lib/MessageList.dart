import 'dart:convert';

import 'package:emailapp/Message.dart'; //needed for message class
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var messages = const [];

  Future loadMessageList() async {
    String content = await rootBundle.loadString('data/message.json');
    // we put the type is string to be more specific 

    List collection = json.decode(content);
    // this is a collection of maps or a list of map

    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();
    //to be more spesfic we put List of Message and Message have a structure So we Create Message.dart in seprated file to handel this

    // map function means we have taking each elelments 


    setState(() {
      messages = _messages;
    });
  }

  void initState() {
    loadMessageList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          Message message = messages[index];
          // here we specfiy as Message it is an object from class Message 

          return ListTile(
            title: Text(message.subject),
            // now subject is a proprty of our class so we can access it easly than fetch it from data comming before it was message['subject'] 
            isThreeLine: true,
            leading: CircleAvatar(
              child: Text('PJ'),
            ),
            subtitle: Text(
              message.body,
              // it was message['body']
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    );
  }
}
