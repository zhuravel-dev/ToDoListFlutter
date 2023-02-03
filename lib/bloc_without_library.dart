import 'dart:async';

import 'package:flutter/material.dart';
enum checkboxEvent {event_active, event_inactive}
enum ClickToButtonEvent {event_click, }

//bloc class for Alert dialog on HomeScreen
class BlocAddTaskEvent {

  AlertDialog _alertDialog = AlertDialog();
  StreamSubscription<ClickToButtonEvent>? subscription;

  final _inputEventController = StreamController<ClickToButtonEvent>();
  StreamSink<ClickToButtonEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<AlertDialog>();
  Stream<AlertDialog> get outputStateStream => _outputStateController.stream.asBroadcastStream();

  void _mapEventToState(ClickToButtonEvent event) {
    if(event ==  ClickToButtonEvent.event_click) _alertDialog = AlertDialog();
    _outputStateController.sink.add(_alertDialog);
  }

  //for listening output stream
  BlocAddTaskEvent() {
  _inputEventController.stream.listen(_mapEventToState);
  Future.delayed(Duration(seconds: 5), () {
   dispose();
  });
  }


  /*Future<void> listenStream() async {
    _inputEventController.stream.listen(_mapEventToState);
    Future.delayed(Duration(seconds: 5), () {
      dispose();
    });
  }*/


  void dispose() {
    subscription?.cancel();
    _outputStateController.onPause;
    //_inputEventController.close();
    //_outputStateController.close();
  }
}