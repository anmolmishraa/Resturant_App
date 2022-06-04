
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_app/bloc/login_bloc.dart';
import 'package:restaurants_app/screen/RegisterScreen.dart';
import 'package:restaurants_app/screen/login.dart';

class options_Page extends StatefulWidget {
  const options_Page({Key? key}) : super(key: key);

  @override
  _options_PageState createState() => _options_PageState();
}

class _options_PageState extends State<options_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "Image/options.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(

            child: Column(


              children: [

                Text("Discover the best foods from over 1,000 \nrestaurants and fast delivery to your \ndoorstep",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade500),),
                SizedBox(height: 30,),
                _buildButton(),
                SizedBox(height: 30,),
                _CreateAccount()
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _buildButton() {


    return  GestureDetector(
      onTap:  () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      },

      child: Padding(
        padding: const EdgeInsets.only(left: 25,right: 25),
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color:Colors.deepOrange
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
  }
  Widget _CreateAccount() {


    return Padding(
        padding: const EdgeInsets.only(left: 25,right: 25),
        child: OutlineButton(
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,

            child: Text(
              "Create an Account",
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          borderSide: BorderSide(width: 2.0, color: Colors.deepOrange),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          onPressed: () => {
                () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  RegisterScreen()),
              );
            }
            

          },
        )
    );
  }


}
