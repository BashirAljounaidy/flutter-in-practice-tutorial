import 'package:emailapp/MessageList.dart';
import 'package:flutter/material.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey, accentColor: Colors.red),
      home: MessageList(title: 'Flutter Demo Home Page'),
    );
  }
}

/* in this version we dont need to specify every kind of elements like 
:::::Message.dart:::::
Message.fromJson(Map<String, dynamic> json)
      : subject = json['subject'],
        body = json['body'];
SO json will fetch elemets like subject and body them automaticlly
*/