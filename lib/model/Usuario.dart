
import 'package:flutter/cupertino.dart';

class Usuario{
  String _login;
  String _senha;

  Usuario();

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {

      "login" : this.login,
      "senha" : this.senha

    };

    return map;

  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get login => _login;

  set login(String value) {
    _login = value;
  }
}