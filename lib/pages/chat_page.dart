import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:chat_app/widgets/message_widget.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  List<Message> _messages = [];

  bool _isWriting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: SafeArea(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                child: Text('Te', style: TextStyle(fontSize: 12)),
                backgroundColor: Colors.blue[100],
                maxRadius: 14,
              ),
              SizedBox(height: 3),
              Text(
                'Aranzazu Arce',
                style: TextStyle(color: Colors.black87, fontSize: 12),
              )
            ],
          ),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _messages.length,
              itemBuilder: (_, i) => _messages[i],
              reverse: true,
            )),
            Divider(height: 1),
            Container(
              color: Colors.white,
              child: _inputChat(),
              //TODO: Caja de texto
            )
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
              child: TextField(
            controller: _textController,
            onSubmitted: _handleSubmit,
            onChanged: (String texto) {
              setState(() {
                _isWriting = texto.trim().length > 0 ? true : false;
              });
            },
            decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje'),
            focusNode: _focusNode,
          )),
          //Boton de enviar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: Platform.isIOS
                ? CupertinoButton(
                    child: Text('Send'),
                    onPressed: _isWriting
                        ? () => _handleSubmit(_textController.text.trim())
                        : null)
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.blue[400]),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: Icon(Icons.send),
                        onPressed: _isWriting
                            ? () => _handleSubmit(_textController.text.trim())
                            : null,
                      ),
                    ),
                  ),
          )
        ],
      ),
    ));
  }

  _handleSubmit(String text) {
    if (text.length == 0) return;
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = new Message(
      uid: '123',
      text: text,
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 400)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _isWriting = false;
    });
  }

  @override
  void dispose() {
    //TODO: Off del socket

    for (Message message in _messages) {
      message.animationController.dispose();
    }

    super.dispose();
  }
}
