import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const BlueButton({
    Key key,
    this.text,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(      
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(2.0),
        // backgroundColor: MaterialStateProperty.resolveAs(value, states),
        // backgroundColor: MaterialStateProperty.all(Colors.blue),
        // overlayColor: MaterialStateProperty.all(Colors.grey),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      onPressed: this.onPressed,
      // onPressed: null,
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
          text,
          style: TextStyle(fontSize: 17),
          )
        ),
      ),
    );
  }
}
