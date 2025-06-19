import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  double? _deviceHieght, _deviceWidth;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  @override
  Widget build(BuildContext context) {
    _deviceHieght = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(),
                _loginFormWidget(),
                _loginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return const Text(
      "Finstagram",
      style: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
    );
  }

  Widget _loginButton() {
    return MaterialButton(
      onPressed: () {},
      minWidth: _deviceWidth! * 0.70,
      height: _deviceHieght! * 0.06,
      color: Colors.red,
      child: const Text(
        "Login",
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _loginFormWidget() {
    return Container(
      height: _deviceHieght! * 0.20,
      child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _emailTextField(),
              _passwordTextField(),
            ],
          )),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'email...',
        ),
        onSaved: (_value) {
          setState(() {
            _email = _value;
          });
        },
        validator: (_value) {
          bool _result = _value!.contains(
              RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'));
          _result ? null : "please enter a valid email";
        });
  }

  Widget _passwordTextField() {
    return TextFormField(
        decoration: InputDecoration(
          hintText: 'password...',
        ),
        onSaved: (_value) {
          setState(() {
            _password = _value;
          });
        },
        validator: (_value) {
          _value!.length > 6
              ? null
              : "please enter a password is greater than 6 charector";
        });
  }
}
