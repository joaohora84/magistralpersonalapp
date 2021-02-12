
import 'package:dio/dio.dart';
import 'package:magistralpersonal/model/Token.dart';
import 'package:magistralpersonal/model/Usuario.dart';
import 'package:magistralpersonal/service/CustomDio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginRepository{

  login(Usuario usuario){
    var dio = CustomDio().instance;

    dio.post("http://api.magistralpersonal.com/login",
        data: usuario.toMap()
    ).then((res) async {

      String token;

      token = formataString(res.data.toString());

      String tk = token.substring(5);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.clear();

      await prefs.setString('token', tk);

    }).catchError((err) {
      throw Exception('Login ou senha inválidos' + usuario.toMap().toString());


    });

  }

  String formataString(String t){

    String tn;

    for (int i = 0; i < t.toString().length; i++) {

      tn = t.toString().replaceAll(RegExp(r'[:\" "\{\}]'), '');

    }

    return tn;

  }

}
