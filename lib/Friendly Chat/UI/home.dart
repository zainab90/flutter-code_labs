import 'package:flutter/cupertino.dart';
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
  bool _isComposing=false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Firendly Chat'),
        elevation: Theme.of(context).platform==TargetPlatform.iOS?0.0:0.4,
      ),
      body:  Container(

        decoration: Theme.of(context).platform==TargetPlatform.iOS ? BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey[200]))
        ) : null,


        child: new Column(                                        //modified
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
                            onSubmitted: _handleSubmitted,
                          onChanged: (String myText){
                          setState(() {
                            _isComposing= myText.length>0;
                          });
                          },
                        )
                    ),
                    Container(
                      margin: new EdgeInsets.symmetric(horizontal: 4.0),
                      child:  Theme.of(context).platform == TargetPlatform.iOS ?  //modified
                      new CupertinoButton(                                       //new
                        child: new Text("Send"),                                 //new
                        onPressed: _isComposing                                  //new
                            ? () =>  _handleSubmitted(_textEditingController.text)      //new
                            : null,) :                                           //new
                      new IconButton(                                            //modified
                        icon: new Icon(Icons.send),
                        color: Theme.of(context).accentColor,
                        onPressed: _isComposing ?
                            () =>  _handleSubmitted(_textEditingController.text) : null,
                      )


                    )

                  ],
                ),
              ),
            ],
          ),
      ),

    );
  }


  void _handleSubmitted(String text){
    _textEditingController.clear();

    setState(() {                                                    //new
      _isComposing = false;                                          //new
    });


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




