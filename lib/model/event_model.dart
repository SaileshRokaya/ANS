import 'dart:convert';

EventModel eventModelFromJson(String str) =>
    EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  EventModel({
    required this.id,
    required this.eventTitle,
    required this.eventMessage,
    required this.eventCreated,
  });

  String id;
  String eventTitle;
  String eventMessage;
  String eventCreated;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        eventTitle: json["event_title"],
        eventMessage: json["event_message"],
        eventCreated: json["event_created"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_title": eventTitle,
        "event_message": eventMessage,
        "event_created": eventCreated,
      };
}
