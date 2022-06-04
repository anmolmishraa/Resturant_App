import 'dart:ui';

import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25,bottom: 15),
              child: Text(
                "New Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            Text("Please enter your email to receive a \nlink to create a new password via email", textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 30,
            ),
            StreamBuilder<Object>(
                // stream: bloc.name,
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
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "New Password",
                          hintStyle: TextStyle(color: Colors.grey),
                          // errorText: snapshot.error.toString(),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 20,left: 20,bottom: 20),
                        ),
                        // onChanged: (value) => bloc.changeName(value),
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 30,
            ),
            StreamBuilder<Object>(
              // stream: bloc.name,
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
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(color: Colors.grey),
                          // errorText: snapshot.error.toString(),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 20,left: 20,bottom: 20),
                        ),
                        // onChanged: (value) => bloc.changeName(value),
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.deepOrange
                ),
                child: MaterialButton(
                  child: Text("Next",style: TextStyle(color: Colors.white ,fontSize: 18,fontWeight: FontWeight.bold)),
                  // onPressed: _enableButton ? _onSubmitOtp : null,
                  //
                  // child: _setUpButtonChild(),
                  onPressed: (){},

                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
