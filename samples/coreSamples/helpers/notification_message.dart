class NotificationMessage {
  String id;
  String title;
  String content;
  DateTime createdAt; // 2002-02-27T14:00:00-0500
  DateTime? expiredAt; // 2002-02-27T14:00:00-0500
  bool isEnabled;

  NotificationMessage(
      {required this.id,
      required this.title,
      required this.content,
      required this.createdAt,
      this.expiredAt,
      this.isEnabled = true});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'is_enabled': isEnabled,
      'created_at': createdAt.toIso8601String(),
      'expire_at': expiredAt?.toIso8601String(),
    };
  }

  factory NotificationMessage.fromJson(Map<String, dynamic> json) {
    NotificationMessage notificationMessage = NotificationMessage(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        isEnabled: json['is_enabled'],
        createdAt: DateTime.parse(json['created_at'] as String));

    if (json.containsKey('expire_at') && json['expire_at'] != null) {
      notificationMessage.expiredAt = DateTime.parse(json['expire_at'] as String);
    }

    return notificationMessage;
  }
}

// Sample
// [
//   {
//     "id": "0001",
//     "title": "Message 01",
//     "content": "Will expire soon",
//     "is_enabled": true,
//     "created_at": "2022-09-03T23:06:00-0400",
//     "expire_at": "2022-09-04T01:30:00-0400"
//   },
//   {
//     "id": "0002",
//     "title": "Message 02",
//     "content": "Disabled",
//     "is_enabled": false,
//     "created_at": "2022-09-03T23:08:00-0400",
//     "expire_at": "2022-09-03T23:08:00-0400"
//   },
//   {
//     "id": "0003",
//     "title": "Message 03",
//     "content": "Never exprire",
//     "is_enabled": true,
//     "created_at": "2022-09-03T23:08:00-0400",
//     "expire_at": null
//   }
// ]