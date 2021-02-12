import 'package:flutter/material.dart';
import 'package:magistralpersonal/model/Ativo.dart';
import 'package:magistralpersonal/repository/AtivoRepository.dart';

class AtivosPorEspecialidade extends StatefulWidget {

  String id;

  AtivosPorEspecialidade(this.id);

  @override
  _AtivosPorEspecialidadeState createState() => _AtivosPorEspecialidadeState();
}

class _AtivosPorEspecialidadeState extends State<AtivosPorEspecialidade> {

  Future<List<Ativo>> ativoFuture;
  AtivoRepository _ativoRepository;

  _listarAtivosPorEspecialidade(){

    _ativoRepository = AtivoRepository();

    ativoFuture = _ativoRepository.buscaPorEspecialidade(widget.id);

  }

  @override
  void initState() {
    super.initState();

    _listarAtivosPorEspecialidade();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ativos"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: FutureBuilder(
                  future: this.ativoFuture,
                  builder: (BuildContext context, AsyncSnapshot<List<Ativo>> snapshot) {
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
                                                + "\n"
                                                + "\n"
                                                + item.indicacao
                                        ),
                                      ),

                                    ),
                                    Expanded(
                                      child: Container(

                                          child: IconButton(
                                            color: Colors.blueAccent,
                                            icon: Icon(Icons.open_in_new),
                                            onPressed: () {

                                            },
                                          )
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(

                                          child: IconButton(
                                            color: Colors.black54,
                                            icon: Icon(Icons.local_printshop_sharp),
                                            onPressed: () {

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