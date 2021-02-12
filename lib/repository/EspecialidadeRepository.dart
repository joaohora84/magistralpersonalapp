import '../model/Especialidade.dart';
import 'package:magistralpersonal/service/CustomDio.dart';

class EspecialidadeRepository {

  var dio = CustomDio.withAuthentication().instance;

  Future<List<Especialidade>> buscaPorNome(String pesquisa){

    return dio.get("http://api.magistralpersonal.com/especialidadeprescritor/pornome?nome=" + pesquisa).then((res) {

      return res.data.map<Especialidade>((c) => Especialidade.fromMap(c)).toList() as List<Especialidade>;

    }).catchError((err) => print(err.toString()));

  }


  Future<List<Especialidade>> findAll() {


    return dio.get("http://api.magistralpersonal.com/especialidadeprescritor/").then((res) {

      return res.data.map<Especialidade>((c) => Especialidade.fromMap(c)).toList() as List<Especialidade>;

    }).catchError((err) => print(err.toString()));
  }

  
}