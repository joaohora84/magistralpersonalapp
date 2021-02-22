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
  //Unidade unidade;


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
      this.contra_indicacao,
      //this.unidade
  });

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
        contra_indicacao: map['contra_indicacao'],
        //unidade: map['unidade']
    );

  }

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {

      "idativo" : this.idativo,
      "nome" : this.nome,
      "sinonimo" : this.sinonimo,
      "dosagem_usual" : this.dosagem_usual,
      "dosagem_minima" : this.dosagem_minima,
      "dosagem_maxima" : this.dosagem_maxima,
      "indicacao" : this.indicacao,
      "beneficios" : this.beneficios,
      "mecanismo_acao" : this.mecanismo_acao,
      "estudos" : this.estudos,
      "contra_indicacao" : this.contra_indicacao,
      //"unidade" : this.unidade

    };

    return map;

  }


}

class Unidade {

  int idunidade;
  String unidade;
  String descricao;

  Unidade({
    this.idunidade,
    this.unidade,
    this.descricao
  });



}