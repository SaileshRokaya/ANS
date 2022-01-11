import 'package:ans/model/event_model.dart';
import 'package:ans/service/event_service.dart';
import 'package:flutter/cupertino.dart';

class EventProvider with ChangeNotifier {
  final eventServices = EventService();

  late String id;
  late String eventTitle;
  late String eventMessage;
  late String eventCreated;

  // Getters
  String get title => eventTitle;
  String get message => eventMessage;

  // Setters
  set changeTitle(String title) {
    eventTitle = title;
  }

  set changeMessage(String message) {
    eventMessage = message;
  }

  // Provider working with rest api
  List<EventModel> eventList = [];
  void updateEvent(List<EventModel> data) {
    this.eventList = data;
    notifyListeners();
  }

  // update function provider
  updatedEvent() {
    var updateEntry = EventModel(
        id: id,
        eventTitle: eventTitle,
        eventMessage: eventMessage,
        eventCreated: eventCreated);

    eventServices.updateEvent(updateEntry);
  }
}
