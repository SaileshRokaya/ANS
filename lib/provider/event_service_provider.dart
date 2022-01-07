import 'package:ans/model/event_model.dart';
import 'package:ans/service/event_service.dart';
import 'package:flutter/cupertino.dart';

class EventProvider with ChangeNotifier {
  // Provider working with rest api
  List<EventModel> eventList = [];
  void updateEvent(List<EventModel> data) {
    this.eventList = data;
    notifyListeners();
  }
}
