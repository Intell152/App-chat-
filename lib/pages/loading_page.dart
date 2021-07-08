import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:chat_app/pages/users_page.dart';
import 'package:chat_app/services/auth_service.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: chackLoginState(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future chackLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context);

    final autenticate = await authService.isLoggedIn();

    if (autenticate) {
      // TODO: conectar al socket server
      Navigator.pushReplacementNamed(context, 'users');

      // Navigator.pushReplacement(
      //   context,
      //   PageRouteBuilder(
      //       pageBuilder: (_, __, ___) => UsersPage(),
      //       transitionDuration: Duration(milliseconds: 0)
      //   )
      // );
    } else {
      Navigator.pushReplacementNamed(context, 'login');
    }
  }
}
