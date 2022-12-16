class NotificationMessage {
  String title;

  NotificationMessage({
    this.title,

  });

  NotificationMessage copyWith({
    String title,

  }) =>
      NotificationMessage(
        title: title ?? this.title,
      );

  factory NotificationMessage.fromJson(dynamic json) => NotificationMessage(
        title:
            json["title"] == null || json["title"] == "" ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
      };
}
