import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String text;
  final String uid;
  final AnimationController animationController;

  const Message({
  Key key,
  @required this.text,
  @required this.uid,
  @required this.animationController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          child: this.uid == '123' ? _myMessage() : _notMyMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all( 8.0 ),
        margin: EdgeInsets.only(
          bottom: 5,
          right: 5,
          left: 50
        ),
        child: Text( this.text, style: TextStyle( color: Colors.white )),
        decoration: BoxDecoration(
          color: Color(0xff4D9EF6),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }

  Widget _notMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all( 8.0 ),
        margin: EdgeInsets.only(
          bottom: 5,
          right: 50,
          left: 5
        ),
        child: Text( this.text, style: TextStyle( color: Colors.black87 )),
        decoration: BoxDecoration(
          color: Color(0xffE4E5E8),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}
