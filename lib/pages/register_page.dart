import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_app/widgets/logo_widget.dart';
import 'package:chat_app/widgets/labels_widget.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/helpers/mostrar_alerta.dart';
import 'package:chat_app/widgets/blue_button_widget.dart';
import 'package:chat_app/widgets/custom_input_widget.dart';

class RegisterPage extends StatelessWidget {
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
                  Logo( title: 'Register' ),
                  _Form(),
                  Labels( ruta: 'login', question: 'Do you already have an account?', bluelab: 'enter now!',),
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
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: <Widget>[
            CustomInput(
              icon: Icons.perm_identity_outlined,
              paceholder: 'Name',
              keyboardType: TextInputType.text,
              textController: nameCtrl,
            ),
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
              text: 'Create',
              onPressed: authService.autenticando
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      final registerOk = await authService.register(
                          nameCtrl.text, emailCtrl.text.trim(), passCtrl.text);

                      if (registerOk == true) {
                        //TODO: Conectar a nuestro socket server
                        Navigator.pushReplacementNamed(context, 'users');
                      } else {
                        mostrarAlerta(context, 'Registro incorrecto',
                            registerOk);
                      }
                    },
            )
          ],
        ));
  }
}
