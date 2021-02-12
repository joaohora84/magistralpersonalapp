import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:magistralpersonal/repository/LoginRespository.dart';
import 'package:magistralpersonal/service/CustomDio.dart';
import 'package:magistralpersonal/views/InputCustomizado.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Usuario.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerLogin = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  Future<void> _logar() async {

    String login = _controllerLogin.text;
    String senha = _controllerSenha.text;

    Usuario usuario = Usuario();
    usuario.login = login;
    usuario.senha = senha;

    LoginRepository().login(usuario);



    Navigator.pushNamed(context, '/Especialidades');



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
    body: Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 32),
                child: Image.asset(
                  "imagens/logo_magistralpersonal.jpeg",
                  width: 200,
                  height: 150,
                ),
              ),
              InputCustomizado(
                controller: _controllerLogin,
                hint: "Login",
                autofocus: true,
                type: TextInputType.emailAddress,

              ),
              InputCustomizado(
                controller: _controllerSenha,
                hint: "Senha",
                obscure: true,
              ),

              RaisedButton(
                child: Text(
                  "Entrar",
                  style: TextStyle(
                    color: Colors.white, fontSize: 20,
                  ),
                ),
                color: Color(0xffbbdefb),
                padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                onPressed: (){
                  setState(() {
                    _logar();
                  });

                },
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}
