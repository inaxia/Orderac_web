import 'package:flutter/material.dart';
import 'package:orderac/custom/custom_colors.dart';
import 'package:orderac/services/auth_service.dart';
import 'package:orderac/shared/loading.dart';
import 'package:orderac/shared/snack_bar.dart';

class Register extends StatefulWidget {
  final Function toogleView;

  Register({this.toogleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = 'No error';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: customDarkBlack,
      title: Text(
        'Register to orderac',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      elevation: 0.0,
      actions: [
        FlatButton.icon(
          color: Colors.transparent,
          label: Text(
            'Sign in',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
          onPressed: () {
            widget.toogleView();
          },
        )
      ],
    );

    final body = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/initials/register.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Register',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 15.0),
            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hoverColor: Colors.white,
                fillColor: Colors.white,
                focusColor: Colors.white,
                counterText: '',
                border: InputBorder.none,
                hintText: 'xyz@gmail.com',
                hintStyle: TextStyle(fontSize: 18.0, color: Colors.white54),
                labelText: "Enter email",
                labelStyle: TextStyle(fontSize: 18.0, color: Colors.white),
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              validator: (value) {
                if (value == '') {
                  return 'Enter an email';
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(height: 8.0),
            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hoverColor: Colors.white,
                fillColor: Colors.white,
                focusColor: Colors.white,
                counterText: '',
                border: InputBorder.none,
                hintText: '123456',
                hintStyle: TextStyle(fontSize: 18.0, color: Colors.white54),
                labelText: "Enter password",
                labelStyle: TextStyle(fontSize: 18.0, color: Colors.white),
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              validator: (value) {
                if (value.length < 6) {
                  return 'Password must be atleast 6 characters';
                } else {
                  return null;
                }
              },
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(height: 15.0),
            RaisedButton(
              child: Text('Register'),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    loading = true;
                  });
                  dynamic result = await _auth
                      .registerWithEmailAndPasswordWithFirebase(email, password);
                  setState(() {
                    loading = false;
                    error = result;
                  });
                }
              },
            ),
            SizedBox(height: 15.0),
            Text(
              error,
              style: TextStyle(
                color: Colors.red,
                fontSize: 18.0,  
              ),
            )
          ],
        ),
      ),
    );

    return (loading)
      ? Loading()
      : Scaffold(
          backgroundColor: customDarkBlack,
          appBar: appBar,
          body: body,
        );
  }
}
