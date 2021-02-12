import 'package:flutter/material.dart';
import 'package:magistralpersonal/model/Ativo.dart';
import 'package:magistralpersonal/service/CustomDio.dart';

class AtivoRepository {

  var dio = CustomDio.withAuthentication().instance;

  Future<List<Ativo>> buscaPorEspecialidade(String idespecialidade){

    return dio.get("http://api.magistralpersonal.com/ativo/especialidade?id=" +
        idespecialidade).then((res) {

      return res.data.map<Ativo>((c) => Ativo.fromMap(c)).toList() as List<Ativo>;

    }).catchError((err) => print(err.toString()));

  }

}