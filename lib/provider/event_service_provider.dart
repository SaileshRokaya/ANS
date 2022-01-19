import 'package:ans/model/event_model.dart';
import 'package:ans/service/event_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventProvider with ChangeNotifier {
  final eventServices = EventService();

  late String id;
  late String eventTitle;
  late String eventMessage;
  late String eventCreated;
  late String eventStartDate;
  late String eventEndDate;

  late EventModel eventModel;
  bool loading = false;

  fetchData(context) async {
    loading = true;
    eventModel = await eventServices.getEventData(context);
    loading = false;
    notifyListeners();
  }

  // Getters
  String get title => eventTitle;
  String get message => eventMessage;
  String get startDate => eventStartDate;
  String get endDate => eventEndDate;

  // Setters
  set changeTitle(String title) {
    eventTitle = title;
  }

  set changeMessage(String message) {
    eventMessage = message;
  }

  set changeStartDate(String start) {
    eventStartDate = start;
  }

  set changeEndDate(String end) {
    eventEndDate = end;
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
        eventCreated: eventCreated,
        eventStartDate: eventStartDate,
        eventEndDate: eventEndDate);

    eventServices.updateEvent(updateEntry);
  }
}
