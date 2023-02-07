import 'package:flutter/material.dart';
import 'package:random/view/screen/Home_Page.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
      },
    )
  );
}