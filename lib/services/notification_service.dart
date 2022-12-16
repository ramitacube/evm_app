import '../core.dart';

class NotificationService {
  List<NotificationMessage> getMessageList() {
    return <NotificationMessage>[
      NotificationMessage(
        title: "Kochi",
      ),
      NotificationMessage(
        title: "Trivandrum",

      ),

    ];
  }

  List<String> getCity() {
    List<String> list =
        getMessageList().map((message) => message.title).toList();

    list.sort((b, a) => a.compareTo(b));

    return list;
  }
}
