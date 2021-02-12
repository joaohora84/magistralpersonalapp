import 'package:flutter/material.dart';

class Token {

  String token;

  Token({this.token});

  factory Token.fromJson(Map<String, dynamic> parsedJson){
    return Token(
      token: parsedJson['token']
    );
  }

}