import 'package:flughtinfo/view/flight_view.dart';
import 'package:flughtinfo/viewmodel/flight_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){

  runApp(
    ChangeNotifierProvider(
      create: (_)=> FlightViewModel(),
    child: const MyApp(),
    )
  );

}


class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '非機時刻表',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FlightView(),
    );
  }

}