import 'package:flutter/material.dart';
import 'package:magistralpersonal/model/Ativo.dart';
import 'package:magistralpersonal/repository/AtivoRepository.dart';

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
        title: Text("Ativo"),
      ),
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
                  
                  children: <Widget> [
                      
                      RichText(
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                            
                            children: <TextSpan>[

                              TextSpan(

                                text: item.nome,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue

                                )
                              ),
                              TextSpan(
                                text: "\n"
                              ),
                              TextSpan(
                                text: "Indicação" + "\n",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                )

                              ),
                              TextSpan(
                                  text: item.indicacao,
                                  style: TextStyle(

                                  )

                              ),
                              TextSpan(
                                  text: "\n" + "Sinônimo" + "\n",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  )

                              ),
                              TextSpan(
                                  text: item.sinonimo,
                                  style: TextStyle(

                                  )

                              ),
                              TextSpan(
                                  text: "\n" + "Dosagem usual" + "\n",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  )

                              ),
                              TextSpan(
                                  text: item.dosagem_usual.toString(),
                                  style: TextStyle(

                                  )

                              ),
                              TextSpan(
                                  text: "\n" + "Dosagem mínima" + "\n",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  )

                              ),
                              TextSpan(
                                  text: item.dosagem_minima.toString(),
                                  style: TextStyle(

                                  )

                              ),
                              TextSpan(
                                  text: "\n" + "Dosagem máxima" + "\n",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  )

                              ),
                              TextSpan(
                                  text: item.dosagem_maxima.toString(),
                                  style: TextStyle(

                                  )

                              ),
                              TextSpan(
                                  text: "\n" + "Benefícios" + "\n",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  )

                              ),
                              TextSpan(
                                  text: item.beneficios,
                                  style: TextStyle(

                                  )

                              ),
                              TextSpan(
                                  text: "\n" + "Mecanismo de ação" + "\n",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  )

                              ),
                              TextSpan(
                                  text: item.mecanismo_acao,
                                  style: TextStyle(

                                  )

                              ),
                              TextSpan(
                                  text: "\n" + "Estudos" + "\n",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  )

                              ),
                              TextSpan(
                                  text: item.estudos,
                                  style: TextStyle(

                                  )

                              ),
                              TextSpan(
                                  text: "\n" + "Contra indicação" + "\n",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  )

                              ),
                              TextSpan(
                                  text: item.contra_indicacao,
                                  style: TextStyle(

                                  )

                              ),

                            ]
                          )
                      ),

                  ],

                );

              }
            }
          ),
      ),
    );
  }
}
