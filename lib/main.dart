import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:code_labs/Friendly Chat/UI/home.dart';

void main(){

  final ThemeData kIOSTheme = new ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light,
  );

  final ThemeData kAndroidTheme = new ThemeData(
    primarySwatch: Colors.purple,
    accentColor: Colors.orangeAccent[400],
  );



  runApp( new MaterialApp(
    home: ChatScreen(),
    theme: defaultTargetPlatform == TargetPlatform.iOS ? kIOSTheme : kAndroidTheme,
    title: 'Code Labs Tutorails',
  ));
}