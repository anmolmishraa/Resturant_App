
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/register_bloc.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RegisterBloc>(context, listen: false);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    "Add your detail to Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                StreamBuilder<Object>(
                    stream: bloc.name,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25),
                        child: Container(


                          height:60 ,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:  BorderRadius.circular(32),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.only(top:30),
                            child: TextFormField(
                              autovalidateMode:AutovalidateMode.onUserInteraction ,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: TextStyle(color: Colors.grey),
                                 errorText: snapshot.hasError ? snapshot.error.toString() : '',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 25,left: 20,bottom:5),
                              ),
                              onChanged: (value) => bloc.changeName(value),
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 30),
                StreamBuilder<Object>(
                    stream: bloc.emailId,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25),
                        child: Container(
                          height:60 ,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:  BorderRadius.circular(32),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey),
                                errorText: snapshot.hasError ? snapshot.error.toString() : '',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 20,left: 20,bottom: 5),
                              ),
                              onChanged: bloc.changeEmailId,
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 30),
                StreamBuilder<Object>(
                    stream: bloc.phoneNumber,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25),
                        child: Container(
                          height:60 ,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:  BorderRadius.circular(32),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: "Mobile No",
                                hintStyle: TextStyle(color: Colors.grey),
                                errorText: snapshot.hasError ? snapshot.error.toString() : '',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 20,left: 20,bottom: 5),
                              ),
                              onChanged: bloc.changePhoneNumber,
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 30),
                StreamBuilder<Object>(
                    stream: bloc.addess,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25),
                        child: Container(
                          height:60 ,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:  BorderRadius.circular(32),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: "Address",
                                hintStyle: TextStyle(color: Colors.grey),
                                errorText: snapshot.hasError ? snapshot.error.toString() : '',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 20,left: 20,bottom: 5),
                              ),
                              onChanged: bloc.changeaddess,
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 30),
                StreamBuilder<Object>(
                    stream: bloc.password,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25),
                        child: Container(
                          height:60 ,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:  BorderRadius.circular(32),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                errorText: snapshot.hasError ? snapshot.error.toString() : '',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 20,left: 20,bottom:5),
                              ),
                              onChanged: bloc.changePassword,
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 30),
                StreamBuilder<Object>(
                    stream: bloc.confirmPassword,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25),
                        child: Container(
                          height:60 ,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:  BorderRadius.circular(32),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              obscureText: isVisible,
                              decoration: InputDecoration(
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                errorText: snapshot.hasError ? snapshot.error.toString() : '',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 20,left: 20,bottom: 5),
                                suffixIcon: IconButton(
                                  icon: isVisible
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                ),
                              ),
                              onChanged: bloc.changeConfirmPassword,
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 30),
                _buildButton(),
                SizedBox(height: 30),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Already have an account?",
                      style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                    WidgetSpan(child: SizedBox(width: 5)),
                    TextSpan(
                        text: "Login here",
                        style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => Login(),
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
    final bloc = Provider.of<RegisterBloc>(context, listen: false);

    return StreamBuilder<Object>(
        stream: bloc.isValid,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: snapshot.hasError || !snapshot.hasError
                ? () {
              bloc.submit();
            }: null,


            child:Padding(
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
                  "sign Up",
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
}