import 'package:flutter/material.dart';

class MatiereModel{
  String name ;
  int tst;
  int notst;

  MatiereModel({required this.name, this.tst = 0,this.notst=0});

  @override
  String toString() {
    return 'MatiereModel{name: $name, tst: $tst, notst: $notst}';
  }
}