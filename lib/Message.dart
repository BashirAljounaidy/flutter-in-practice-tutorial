class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);
/*
mapping json to object . 
Map<String,dynamic> means we have String and convert into dynamics object (dynamics means any kind of data ((numbers , string ,boolean)))
*/
  Message.fromJson(Map<String, dynamic> json)
      : subject = json['subject'],
        body = json['body'];
}
