import 'package:flutter/material.dart';
import 'package:code_labs/Friendly Chat/UI/chat_messages.dart';



class ChatScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new StateOfChatScreen();
  }

}

class StateOfChatScreen extends State<ChatScreen> with TickerProviderStateMixin{
  TextEditingController _textEditingController = new TextEditingController();
  List<ChatMessages> _messagesList =<ChatMessages>[];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Firendly Chat'),
      ),
      body:  new Column(                                        //modified
        children: <Widget>[                                         //new
          new Flexible(                                             //new
            child: new ListView.builder(                            //new
              padding: new EdgeInsets.all(8.0),                     //new
              reverse: true,                                        //to make the ListView start from the bottom of the screen
              itemBuilder: (_, int index) => _messagesList[index],      //new
              itemCount: _messagesList.length,                          //new
            ),                                                      //new
          ),
          Divider(height: 1.0,),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),

              alignment: Alignment.bottomCenter,
              margin:EdgeInsets.symmetric(horizontal: 8.0) ,
              child: new Row(
                children: <Widget>[
                  Flexible(
                      child: TextField(decoration: InputDecoration(hintText: 'Send a Message'),
                          controller: _textEditingController,
                          onSubmitted: _handleSubmitted
                      )
                  ),
                  Container(
                    margin: new EdgeInsets.symmetric(horizontal: 4.0),
                    child:  IconButton(
                      icon: Icon(Icons.send, color: Colors.orange.shade400, size: 30.0,),
                      onPressed: ()=> _handleSubmitted(_textEditingController.text.toString()),
                    ),
                  )

                ],
              ),
            ),
          ],
        ),

    );
  }

  void _handleSubmitted(String text){
    _textEditingController.clear();
    // send text to ChatMessages class, then add list item to widget
    ChatMessages newMessage= new ChatMessages(text: text,
    
    animationController: new AnimationController(vsync: this, duration: new Duration(milliseconds: 1000)),
    );

    setState(() {
      _messagesList.insert(0,newMessage);
    });

    newMessage.animationController.forward();

  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    for (ChatMessages x in _messagesList){
      x.animationController.dispose();
    }
  }


}




