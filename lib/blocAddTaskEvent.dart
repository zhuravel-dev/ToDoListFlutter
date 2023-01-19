import 'dart:async';
import 'package:flutter/material.dart';

enum checkboxEvent {event_active, event_inactive}
enum ClickToButtonEvent {event_click, }

class BlocAddTaskEvent {

  AlertDialog _alertDialog = AlertDialog();

  final _inputEventController = StreamController<ClickToButtonEvent>();
  StreamSink<ClickToButtonEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<AlertDialog>();
  Stream<AlertDialog> get outputStateStream => _outputStateController.stream;

  void _mapEventToState(ClickToButtonEvent event) {
    if(event ==  ClickToButtonEvent.event_click) _alertDialog = AlertDialog();
    else {}

    _outputStateController.sink.add(_alertDialog);
  }

  //for listening output stream
  BlocAddTaskEvent() {
  _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}

