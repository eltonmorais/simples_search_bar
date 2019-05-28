import 'package:flutter/material.dart';
import 'dart:async';

class AppBarController {

  bool state;
  StreamController<bool> stream = StreamController<bool>.broadcast();

  AppBarController(){
    stream.stream.listen((onData){
      state = onData;
    });
  }

}