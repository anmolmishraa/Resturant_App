import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class forget_Password extends StatefulWidget {
  const forget_Password({Key? key}) : super(key: key);

  @override
  _forget_PasswordState createState() => _forget_PasswordState();
}

class _forget_PasswordState extends State<forget_Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start ,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 15),
              child: Text("Forget Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            ),
            Text("Please enter your email to receive a \nlink to create a new password via email",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),textAlign: TextAlign.center,),

            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 55),
              child: Container(
                height:60 ,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius:  BorderRadius.circular(32),
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey),
                    // errorText: snapshot.error.toString(),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 20,left: 20,bottom: 20),
                  ),
                  // onChanged: bloc.changeEmailId,
                ),
              ),
            ),
            SizedBox(height: 30),
            _buildButton()
            
          ],
          
        ),

      ),

    );
  }
  Widget _buildButton() {
    // final bloc = Provider.of<RegisterBloc>(context, listen: false);

    return StreamBuilder<Object>(
        // stream: bloc.isValid,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: snapshot.hasError || !snapshot.hasData
                ? null
                : () {
              // bloc.submit();
            },
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
                  "Send",
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
