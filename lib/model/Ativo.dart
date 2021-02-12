import 'dart:typed_data';

import 'package:flutter/material.dart';

class Ativo {

  int idativo;
  String nome;
  String sinonimo;
  double dosagem_usual;
  double dosagem_minima;
  double dosagem_maxima;
  String indicacao;
  String beneficios;
  String mecanismo_acao;
  String estudos;
  String contra_indicacao;

  Ativo({
      this.idativo,
      this.nome,
      this.sinonimo,
      this.dosagem_usual,
      this.dosagem_minima,
      this.dosagem_maxima,
      this.indicacao,
      this.beneficios,
      this.mecanismo_acao,
      this.estudos,
      this.contra_indicacao});

  static Ativo fromMap(Map<String, dynamic> map){

    if(map == null) return null;

    return Ativo(
        idativo: map['idativo'],
        nome: map['nome'],
        sinonimo: map['sinonimo'],
        dosagem_usual: map['dosagem_usual'],
        dosagem_minima: map['dosagem_minima'],
        dosagem_maxima: map['dosagem_maxima'],
        indicacao: map['indicacao'],
        beneficios: map['beneficios'],
        mecanismo_acao: map['mecanismo_acao'],
        estudos: map['estudos'],
        contra_indicacao: map['contra_indicacao']
    );

  }
}