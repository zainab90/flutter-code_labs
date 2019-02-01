import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget{

  ChatMessages({this.text , this.animationController});
  final String text;
  final AnimationController animationController;


  @override
  Widget build(BuildContext context) {
    return new FadeTransition(
      opacity: new CurvedAnimation(parent: animationController,
        curve: Curves.fastOutSlowIn)
      ,
      child:  Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,// the main axis for row is horizontal
          crossAxisAlignment: CrossAxisAlignment.start, // the cross axis for row is vertical
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text('Z', style: TextStyle(fontSize: 20.0, color: Colors.white)), backgroundColor: Colors.purple,),
            ),
            Expanded(
              //When a user sends a text that exceeds the width of the UI for displaying messages, the lines should wrap so the entire message displays.
              // Right now, lines that overflow are truncated and a error message is displayed. A simple way of making sure the text wraps correctly is to add an Expanded widget.
              //otherwise, the yellow and black tape will display and the text is truncated
              // Expand which forces its child to expand to fill the available space on the main axsis (here the main axsis is vertical).
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start, // the main axis for column is vertical , while th cross axis is horizontal
                children: <Widget>[
                  new Text("Sender Name", style: Theme.of(context).textTheme.subhead),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),




    );
  }


}