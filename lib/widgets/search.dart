import 'package:flutter/material.dart';

Widget search() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.green[200],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.0)),
    child: Container(
      padding: EdgeInsets.only(left: 16.0),
        child: TextField(
          decoration: InputDecoration(
              prefixIcon:
              Center(
                  child: Icon(Icons.search, color: Colors.white, size: 20)),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 20,
                maxWidth: 20,
              ),
              border: InputBorder.none,
              hintText: 'Search'),
        ),
    ),
  );
}