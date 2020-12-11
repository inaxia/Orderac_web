import 'package:flutter/material.dart';
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String email = '';
  String password = '';
  String error = 'No error';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Register to orderac'),
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
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Register'),
            TextFormField(
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
            TextFormField(
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
                final snackBar = showSnackBar(Icons.error_outline, error, Colors.red);
                _scaffoldKey.currentState.showSnackBar(snackBar);
              },
            ),
            SizedBox(height: 15.0),
            Text(
              error,
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
    );

    return (loading)
      ? Loading()
      : Scaffold(
          key: _scaffoldKey,
          appBar: appBar,
          body: body,
        );
  }
}
