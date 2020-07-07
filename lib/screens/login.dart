import 'package:flutter/material.dart';
import 'package:tih_mobile/services/auth_webclient.dart';
import 'package:tih_mobile/style.dart';
import 'package:tih_mobile/widgets/text_filed.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;
  String _errorMessage;
  bool _isLoading;

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  void nameChanged(String name) {
    setState(() {
      _email = name.trimRight();
    });
  }

  void passwordChanged(String password) {
    setState(() {
      _password = password.trimRight();
    });
  }

  void validateUser() async {
    setLoadingState(true);

    try {
      final user = await AuthWebClient.authenticate(_email, _password);
      setLoadingState(false);
      setState(() => _errorMessage = "");
    } catch (e) {
      setState(() => _errorMessage = e);
      setLoadingState(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _showForm(),
          _showCircularProgress(),
        ],
      ),
    );
  }

  Widget _showForm() {
    return Container(
      decoration: BoxDecoration(
        gradient: Style.bgGradient,
      ),
      padding: EdgeInsets.all(16.0),
      child: Form(
          child: ListView(
        shrinkWrap: false,
        children: <Widget>[
          _showLogo(),
          _showTextFieldLogin(),
          _showTextFieldPassword(),
          _showErrorMessage(),
          _showButtonConfirm(),
        ],
      )),
    );
  }

  Widget _showLogo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
      child: Image.asset(
        "assets/images/logo.png",
      ),
    );
  }

  Widget _showTextFieldLogin() {
    return TihTextFiled(
      label: 'Login',
      onChanged: nameChanged,
    );
  }

  Widget _showTextFieldPassword() {
    return TihTextFiled(
      label: 'Senha',
      onChanged: passwordChanged,
    );
  }

  Widget _showButtonConfirm() {
    return Padding(
      padding: const EdgeInsets.only(top: 90),
      child: SizedBox(
          width: double.maxFinite,
          height: 50.0,
          child: RaisedButton(
              onPressed: () => validateUser(),
              child: Text('Confirma'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                // side: BorderSide(color: Colors.red),
              ))),
    );
  }

  Widget _showErrorMessage() {
    if (_errorMessage != null && _errorMessage.length > 0) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.warning,
                color: Style.primaryColor,
              ),
            ),
            Text(
              _errorMessage,
              style: TextStyle(
                  fontSize: 16,
                  color: Style.primaryColor,
                  height: 1.0,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      );
    } else {
      return Container(
        height: 0,
      );
    }
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  setLoadingState(bool loading) => setState(() => _isLoading = loading);
}
