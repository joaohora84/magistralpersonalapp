//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:magistralpersonal/CustomSearchDelegate.dart';
import 'package:magistralpersonal/model/Ativo.dart';
import 'package:magistralpersonal/repository/AtivoRepository.dart';
import 'package:magistralpersonal/views/DrawerCustomizado.dart';

class AtivoView extends StatefulWidget {

  String idativo;

  AtivoView(this.idativo);

  @override
  _AtivoViewState createState() => _AtivoViewState();
}

class _AtivoViewState extends State<AtivoView> {

  Future<Ativo> ativoFuture;
  AtivoRepository _ativoRepository;


  @override
  void initState() {
    super.initState();

    _ativoRepository = AtivoRepository();
    ativoFuture = _ativoRepository.buscaPorId(widget.idativo);



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ativo "),

      ),
      drawer: DrawerCustomizado(),
      body: SingleChildScrollView(

          padding: EdgeInsets.all(16),
          child: FutureBuilder(
            future: this.ativoFuture,
            builder: (BuildContext context, AsyncSnapshot<Ativo> snapshot){
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

                var item = snapshot.data;



               return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget> [

                    Text(

                      item.nome,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent
                      ),
                    ),

                    Text(''),
                    Text('Dosagem usual = ' + item.dosagem_usual.toString() + ''),
                    Text('Dosagem mínima = ' + item.dosagem_minima.toString()),
                    Text('Dosagem máxima = ' + item.dosagem_maxima.toString()),
                    Text(''),
                    Text('Indicação',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(''),
                    Text(item.indicacao),
                    Text(''),

                    Text('Sinônimo',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(''),
                    Text(item.sinonimo),

                    Text(''),
                    Text('Benefícios',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    Text(''),
                    Text(item.beneficios,

                      style: TextStyle(

                      ),
                    ),
                    Text(''),
                    Text('Mecanismo de ação',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(''),
                    Text(item.mecanismo_acao),
                    Text(''),
                    Text('Estudos',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(''),
                    Text(item.estudos),
                    Text(''),
                    Text('Contra indicação',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(''),
                    Text(item.contra_indicacao),

                  ],

                );

              }
            }
          ),
      ),
    );
  }
}
