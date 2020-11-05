import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getApi/Controller/Bindings/appBindings.dart';
import 'Views/MyHomePage.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialBinding: AppBinding(),
      theme: ThemeData(
   
        primarySwatch: Colors.blueGrey,
    
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    )
  );
}



