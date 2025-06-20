import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  double? _deviceHieght, _deviceWidth;
  GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  String? _name, _email, _password;
  File? _image;
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
                    _profileImageWidget(),
                    _registrationForm(),
                    _registerButton()
                  ],
                ),
              ))),
    );
  }

  Widget _titleWidget() {
    return const Text(
      "Finstagram",
      style: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
    );
  }

  Widget _registrationForm() {
    return Container(
      height: _deviceHieght! * 0.30,
      child: Form(
          key: _registerFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _nameTextField(),
              _passwordTextField(),
              _emailTextField()
            ],
          )),
    );
  }

  Widget _profileImageWidget() {
    var _imageProvider = _image != null
        ? FileImage(_image!)
        : const NetworkImage('https://i.pravatar.cc/300');
    return GestureDetector(
      onTap: () {
        FilePicker.platform.pickFiles(type: FileType.image).then((_result) {
          setState(() {
            _image = File(_result!.files.first.path!);
          });
        });
      },
      child: Container(
        height: _deviceHieght! * 0.15,
        width: _deviceWidth! * 0.15,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: _imageProvider as ImageProvider)),
      ),
    );
  }

  Widget _nameTextField() {
    return TextFormField(
      decoration: InputDecoration(hintText: "Name...."),
      validator: (_value) =>
          _value!.length > 0 ? null : "Please enter the name.",
      onSaved: (_value) {
        setState(() {
          _name = _value;
        });
      },
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
          return _result ? null : "please enter a valid email";
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
          return _value!.length > 6
              ? null
              : "please enter a password is greater than 6 charector";
        });
  }

  Widget _registerButton() {
    return MaterialButton(
      onPressed: () {},
      minWidth: _deviceWidth! * 0.50,
      height: _deviceHieght! * 0.05,
      color: Colors.red,
      child: const Text(
        "Register",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
      ),
    );
  }
}
