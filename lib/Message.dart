import 'package:json_annotation/json_annotation.dart'; // needed to autoserialisation 

part 'Message.g.dart';

@JsonSerializable()// needed to autoserialisation 
class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
/* in this version we dont need to specify every kind of elements like 
:::::Message.dart:::::
Message.fromJson(Map<String, dynamic> json)
      : subject = json['subject'],
        body = json['body'];
SO json will fetch elemets like subject and body them automaticlly
*/
