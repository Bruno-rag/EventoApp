
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/pages/appbar.page.dart';
import 'package:uesb_eventos/src/pages/login.page.dart';
import '../services/auth.service.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => AuthCheckState();
}

class AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    auth.visitante = false;

    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      setState(() => null);
      return  LoginPage();
    } else {
      setState(() => null);
      return  AppBarPage();
    }
  }

  loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
