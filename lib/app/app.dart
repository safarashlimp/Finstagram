import 'package:fingram/home/home.dart';
import 'package:fingram/login/loginpage.dart';
import 'package:fingram/register/registerpage.dart';
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
initialRoute: "login",
//home: HomeView(),
routes: {
  "register":(context) => Registerpage(),
  "login" : (context)=> Loginpage(),
},
  );

  }
  }
