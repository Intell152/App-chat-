import 'package:chat_app/widgets/blue_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/widgets/logo_widget.dart';
import 'package:chat_app/widgets/labels_widget.dart';
import 'package:chat_app/widgets/custom_input_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Logo(title: 'Messenger',),
                  _Form(),
                  Labels( ruta: 'register', question: 'You do not have an account?', bluelab: 'Create one now!' ),
                  Text('Terms and use conditions',
                      style: TextStyle(fontWeight: FontWeight.w200))
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: <Widget>[
            CustomInput(
              icon: Icons.mail_outline,
              paceholder: 'Email',
              keyboardType: TextInputType.emailAddress,
              textController: emailCtrl,
            ),
            CustomInput(
              icon: Icons.lock_outlined,
              paceholder: 'Password',
              textController: passCtrl,
              isPassword: true,
            ),
            BlueButton(
              text: 'Ingrese',
              onPressed: () {
                print('Holi');
              },
            )
          ],
        ));
  }
}
