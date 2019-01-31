import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget{

  ChatMessages({this.text , this.animationController});
  final String text;
  final AnimationController animationController;


  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(parent: animationController,
        curve: Curves.easeOut)
      ,
    axisAlignment: 0.0,
      child:  Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,// the main axis for row is horizontal
          crossAxisAlignment: CrossAxisAlignment.start, // the cross axis for row is vertical
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text('Y'), backgroundColor: Colors.purple,),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start, // the main axis for column is vertical , while th cross axis is horizontal
              children: <Widget>[
                new Text("Sender Name", style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                ),
              ],
            ),
          ],
        ),
      ),




    );
  }


}