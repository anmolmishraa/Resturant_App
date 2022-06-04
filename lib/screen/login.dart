import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';

import '../bloc/login_bloc.dart';
import 'RegisterScreen.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBloc>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SizedBox(

            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    "Add your detail to login",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                StreamBuilder<String>(
                  stream: bloc.loginEmail,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 25,right: 25),
                      child: Container(
                        height:60 ,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius:  BorderRadius.circular(32),
                        ),

                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(

                              // errorText: snapshot.error.toString(),
                            hintText: "Enter email",
                            // labelText: "Your Email",
                            // labelStyle: TextStyle(color: Colors.grey),
                            hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 20,left: 20,bottom: 20),
                          ),
                          onChanged: bloc.changeloginEmail,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 30),
                StreamBuilder<String>(
                    stream: bloc.loginPassword,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25),
                        child: Container(
                          height:60 ,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:  BorderRadius.circular(32),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 20,left: 20,bottom: 20),

                              hintText: "password",
                              hintStyle: TextStyle(color: Colors.grey),
                              // labelText: "Password",
                              // labelStyle: TextStyle(color: Colors.grey),

                            ),
                            onChanged: bloc.changeLoginPassword,
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 30),
                _buildButton(),
                SizedBox(height: 30),
                Text("Forgot your password?",style: TextStyle(fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,),),
                SizedBox(height: 30,),
                Text("Or Login With",style: TextStyle(fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,),),
                SizedBox(height: 30,),
                _facebookloginButton(),
                SizedBox(height: 30,),
                _googleloginButton(),
                SizedBox(height: 40,),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Don't have an Account?",
                      style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                    WidgetSpan(child: SizedBox(width: 5)),
                    TextSpan(
                        text: "Sign Up",
                        style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ));
                          })
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    final bloc = Provider.of<LoginBloc>(context, listen: false);

    return StreamBuilder<Object>(
        stream: bloc.isValid,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: snapshot.hasError || !snapshot.hasData
                ? null
                : () {
              bloc.submit();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: snapshot.hasError || !snapshot.hasData
                      ? Colors.deepOrange
                      :Colors.deepOrange,
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
              ),
            ),
          );
        });
  }
  Widget _facebookloginButton() {
    final bloc = Provider.of<LoginBloc>(context, listen: false);

    return StreamBuilder<Object>(
        stream: bloc.isValid,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: snapshot.hasError || !snapshot.hasData
                ? null
                : () {
              bloc.submit();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: snapshot.hasError || !snapshot.hasData
                      ? Colors.blueAccent
                      :Colors.blueAccent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.facebook_sharp,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text(
                      "Login with Facebook",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
  Widget _googleloginButton() {
    final bloc = Provider.of<LoginBloc>(context, listen: false);

    return StreamBuilder<Object>(
        stream: bloc.isValid,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: snapshot.hasError || !snapshot.hasData
                ? null
                : () {
              bloc.submit();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: snapshot.hasError || !snapshot.hasData
                      ? Colors.red
                      :Colors.red,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text(
                      "Login with Google",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}