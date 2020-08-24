import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  register() async{
    print("here");
    var response = await http.post(
      'http://103.78.181.95:3000/api/signup',
      body: json.encode({
        "name": name,
        "email": email,
        "password": password
      }),
      // headers: {Headers.contentTypeHeader: 'application/json'}
    );
    print(json.decode(response.body));
    if(response.statusCode == 200){
      print('Registered');
    }
    else{
      print("Error");
    }
  }

  String email, name, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter name',
                ),
                onSaved: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter email',
                ),
                onSaved: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter password',
                ),
                onSaved: (value) {
                  setState(() {
                    password = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _formKey.currentState.save();
            register();
          }, 
          label: Text('SignUp')),
    );
  }
}
