import 'package:flutter/material.dart';
import 'package:magistralpersonal/views/AtivosPorEspecialidade.dart';

import 'AtivoView.dart';
import 'EspecialidadeView.dart';

class DrawerCustomizado extends StatelessWidget {

  final Widget meudrawer;

  DrawerCustomizado({this.meudrawer});

  @override
  Widget build(BuildContext context) {

    final drawer = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget> [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: null,

          ),
          ListTile(
            leading: Icon(Icons.account_tree_sharp),
            title: Text('Especialidades'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => EspecialidadeView() ));
            },
          ),
          ListTile(
            leading: Icon(Icons.font_download_rounded),
            title: Text('Ativos'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AtivosPorEspecialidade(null)));
            },
          ),
          ListTile(
            leading: Icon(Icons.font_download_outlined),
            title: Text('Ativos descontinuados'),

          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Conta'),

          ),

        ],
      ),
    );

    return Drawer(
      child: drawer,
    );

  }

}