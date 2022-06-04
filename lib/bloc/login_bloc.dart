import 'dart:async';

import 'validators.dart';

import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {

  final _loginEmail = BehaviorSubject<String>();
  final _loginPassword = BehaviorSubject<String>();

  //Getters
  Stream<String> get loginEmail => _loginEmail.stream.transform(emailValidator);
  Stream<String> get loginPassword =>
      _loginPassword.stream.transform(loginPasswordValidator);

  Stream<bool> get isValid =>
      Rx.combineLatest2(loginEmail, loginPassword, (loginEmail, pass) => true);

  //Setters
  Function(String) get changeloginEmail => _loginEmail.sink.add;
  Function(String) get changeLoginPassword => _loginPassword.sink.add;

  Future<void> submit() async {
    // UserCredential user = await FirebaseAuth.instance
    //     .createUserWithEmailAndPassword(
    //     email: _loginEmail.value, password: _loginPassword.value).whenComplete(() =>
    //
    //     print("user.credential")
    // );
    //
    // if (user != null) {
    //
    //
    //   await FirebaseFirestore.instance.collection('Users').doc(
    //       _loginEmail.value).set({
    //
    //     'MobileNumber': _loginPassword.value,
    //     'Email': _loginEmail.value,
    //   });
    // }

    print(_loginEmail.value);
    print(_loginPassword.value);
  }

  void dispose() {
    _loginEmail.close();
    _loginPassword.close();
  }
}