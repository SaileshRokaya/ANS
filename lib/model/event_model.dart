import 'dart:convert';

EventModel eventModelFromJson(String str) =>
    EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  // Create a constructor
  EventModel(
      {required this.id,
      required this.eventTitle,
      required this.eventMessage,
      required this.eventCreated,
      required this.eventStartDate,
      required this.eventEndDate});

  // Create an instance of class
  String id;
  String eventTitle;
  String eventMessage;
  String eventCreated;
  String eventStartDate;
  String eventEndDate;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
      id: json["id"],
      eventTitle: json["event_title"],
      eventMessage: json["event_message"],
      eventCreated: json["event_created"],
      eventStartDate: json["event_start_date"],
      eventEndDate: json["event_end_date"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_title": eventTitle,
        "event_message": eventMessage,
        "event_created": eventCreated,
        "event_start_date": eventStartDate,
        "event_end_date": eventEndDate
      };

  Map<String, dynamic> toJsonAdd() {
    return {
      "event_title": eventTitle,
      "event_message": eventMessage,
      "event_start_date": eventStartDate,
      "event_end_date": eventEndDate
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      "id": id,
      "event_title": eventTitle,
      "event_message": eventMessage,
      "event_created": eventCreated,
      "event_start_date": eventStartDate,
      "event_end_date": eventEndDate
    };
  }

  Map<String, dynamic> toJsonDelete() {
    return {
      "id": id,
    };
  }
}
