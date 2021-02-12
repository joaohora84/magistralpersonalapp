import 'package:flutter/material.dart';
import 'package:magistralpersonal/CustomSearchDelegate.dart';
import 'package:magistralpersonal/model/Especialidade.dart';
import 'package:magistralpersonal/repository/EspecialidadeRepository.dart';
import 'package:magistralpersonal/service/CustomDio.dart';
import 'package:magistralpersonal/views/AtivosPorEspecialidade.dart';

class EspecialidadeView extends StatefulWidget {


  @override
  _EspecialidadeViewState createState() => _EspecialidadeViewState();
}

class _EspecialidadeViewState extends State<EspecialidadeView> {

  Future<List<Especialidade>> especialidadeFuture;
  EspecialidadeRepository _especialidadeRepository;



  _listarEspecialidadesPorNome(String pesquisa){

    _especialidadeRepository = EspecialidadeRepository();

    especialidadeFuture = _especialidadeRepository.buscaPorNome(pesquisa);

  }

  _ativos(String id) async {

    print("ID: " + id);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AtivosPorEspecialidade(id = id))
    );

  }

  @override
  void initState() {
    super.initState();
    _especialidadeRepository = EspecialidadeRepository();
    especialidadeFuture = _especialidadeRepository.findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Especialidades'),
        actions: <Widget> [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String res = await showSearch(context: context, delegate: CustomSearchDelegate());
                setState(() {

                  if(res.isNotEmpty){
                    _listarEspecialidadesPorNome(res);
                  }else{
                    _especialidadeRepository = EspecialidadeRepository();
                    especialidadeFuture = _especialidadeRepository.findAll();
                  }


                });
              }
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: FutureBuilder(
                future: this.especialidadeFuture,
                builder: (BuildContext context, AsyncSnapshot<List<Especialidade>> snapshot) {
                  if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError){
                    return Center(
                      child: Column(

                        children: <Widget> [
                          Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 60,
                          ),
                          Text('Error: ${snapshot.error}'),
                        ],
                      ),
                    );
                  } else {

                    return ListView.builder(

                        itemCount: snapshot.data.length,
                        itemBuilder: (_, index) {
                          var item = snapshot.data[index];

                          return Card(
                         child: Container(
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.all(5),
                              child: Row(

                                children: <Widget>[

                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      child: Text(
                                        item.nome
                                      ),
                                    ),

                                  ),
                                  Expanded(
                                    child: Container(

                                      child: IconButton(
                                        color: Colors.blueAccent,
                                          icon: Icon(Icons.open_in_new),
                                          onPressed: () {
                                            _ativos(item.idespecialidade.toString());
                                          },
                                      )
                                    ),
                                  ),

                                ],
                              ),


                            ),

                          );
                        }
                    );
                  }
                }
              )
          ),
        ],
      ),
    );
  }
}
