import 'package:flutter/material.dart';

class Especialidade{

  int idespecialidade;
  String nome;


  Especialidade({this.idespecialidade, this.nome});

  static Especialidade fromMap(Map<String, dynamic> map){

    if (map == null) return null;

    return Especialidade(
      idespecialidade: map['idespecialidade'],
      nome: map['nome']
    );
  }

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {

      "idespecialidade" : this.idespecialidade,
      "nome" : this.nome

    };

    return map;

  }


}


