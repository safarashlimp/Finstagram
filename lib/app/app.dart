import 'package:fingram/home/home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key?key}):super(key: key);
  
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
title: "Finstagram",
theme: ThemeData(
  primarySwatch: Colors.red
),
home: HomeView(),
  );

  }
  }
