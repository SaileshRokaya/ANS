class EventModel {
  String? id;
  String? event_title;
  String? event_message;

  EventModel({this.id, this.event_title, this.event_message});

  // Create a model class named EventModel and convert JSON response into Dart Object.
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
        id: json['id'],
        event_title: json['event_title'],
        event_message: json['event_message']);
  }

  Map<String, dynamic> toJsonAdd() {
    return {
      "event_title": event_title,
      "event_message": event_message,
    };
  }

  // Map<String, dynamic> toJsonUpdate() {
  //   return {
  //     "id": id,
  //     "event_title": event_title,
  //     "event_message": event_message,
  //   };
  // }

  // Map<String, dynamic> toJsonDelete() {
  //   return {
  //     "id": id,
  //   };
  // }
}
