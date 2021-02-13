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
        title: Text("Ativo" + " "),
      ),
      body: Container(
          child: FutureBuilder(
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
                return Text(


                  item.nome



                );
              }
            }
          ),
      ),
    );
  }
}
