//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:magistralpersonal/CustomSearchDelegate.dart';
import 'package:magistralpersonal/model/Ativo.dart';
import 'package:magistralpersonal/repository/AtivoRepository.dart';
import 'package:magistralpersonal/views/AtivoView.dart';
import 'package:magistralpersonal/views/DrawerCustomizado.dart';

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

    if(widget.id == null || widget.id == ''){

      ativoFuture = _ativoRepository.findAll();

    }else{

      ativoFuture = _ativoRepository.buscaPorEspecialidade(widget.id);

    }



  }

  _ativoView(String id) async {

    Navigator.push(context, MaterialPageRoute(builder: (context) => AtivoView(id)));

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

        title: Text(

          "Ativos"

        ),

        actions: <Widget> [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String res = await showSearch(context: context, delegate: CustomSearchDelegate());
                setState(() {

                  if(res.isNotEmpty){
                    //_listarEspecialidadesPorNome(res);
                  }else{
                    // _especialidadeRepository = EspecialidadeRepository();
                    // especialidadeFuture = _especialidadeRepository.findAll();
                  }


                });
              }
          )
        ],
      ),
      drawer: DrawerCustomizado(),
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
                                   /** Expanded(
                                      child: Container(

                                        child: Image.asset(
                                            "",

                                        ),
                                      )

                                    ),**/

                                    Expanded(

                                      flex: 8,
                                      child: Container(

                                        child: RichText(
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                           style: DefaultTextStyle.of(context).style,
                                           children: <TextSpan> [
                                             TextSpan(
                                                 text: item.nome,
                                                 style: TextStyle(
                                                   fontWeight: FontWeight.bold,

                                                 )),
                                             TextSpan(text: "\n"),
                                             TextSpan(text: "\n"),
                                             TextSpan(

                                               text: item.indicacao,

                                             )
                                           ],

                                         ),
                                       ),
                                      ),

                                    ),
                                    Expanded(

                                    child: Container(

                                          child: IconButton(
                                            color: Colors.blueAccent,
                                            icon: Icon(Icons.open_in_new),
                                            onPressed: () {
                                                _ativoView(item.idativo.toString());
                                            },
                                          )
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(

                                          child: IconButton(
                                            color: Colors.redAccent,
                                            icon: Icon(Icons.picture_as_pdf),
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
