import 'package:flutter/material.dart';
import 'package:code_labs/Friendly Chat/UI/home.dart';

void main(){
  runApp( new MaterialApp(
    home: ChatScreen(),
    theme: ThemeData(
      primaryColor: Colors.purple,
     
    ),
    title: 'Code Labs Tutorails',
  ));
}