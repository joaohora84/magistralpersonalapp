import 'package:flutter/material.dart';
import 'package:magistralpersonal/model/Especialidade.dart';
import 'package:magistralpersonal/views/AtivoView.dart';
import 'package:magistralpersonal/views/AtivosPorEspecialidade.dart';
import 'package:magistralpersonal/views/EspecialidadeView.dart';
import 'package:magistralpersonal/views/Home.dart';

final ThemeData temaPadrao = ThemeData(
  primaryColor: Color(0xffbbdefb),
  accentColor: Color(0xffbbdefb),
);

void main() => runApp(MaterialApp(



  home: Home(),
  debugShowCheckedModeBanner: false,
  theme: temaPadrao,
  initialRoute: "/",
  routes: {
    "/Login" : (context) => Home(),
    "/Especialidades" : (context) => EspecialidadeView(),
    //"/AtivosPorEspecialidade" : (context) => AtivosPorEspecialidade(),
    //"/AtivoView" : (context) => AtivoView(),

  },
));


