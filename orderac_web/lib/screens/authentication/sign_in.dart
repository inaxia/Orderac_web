import 'package:flutter/material.dart';
import 'package:orderac_web/services/auth_services.dart';
import 'package:orderac_web/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toogleView;

  SignIn({this.toogleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
      title: Text('Sign in to orderac'),
      elevation: 0.0,
      actions: [
        FlatButton.icon(
          color: Colors.transparent,
          label: Text(
            'Register',
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
            Text('Sign In'),
            TextFormField(
              cursorColor: Colors.black,
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
              cursorColor: Colors.black,
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
              child: Text('Sign In'),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    loading = true;
                  });
                  dynamic result = await _auth
                      .signInWithEmailAndPasswordWithFirebase(email, password);
                  setState(() {
                    loading = false;
                    error = result;
                  });
                }
                // final snackBar = showSnackBar(Icons.error_outline, error, Colors.red);
                // _scaffoldKey.currentState.showSnackBar(snackBar);
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
