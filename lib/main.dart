import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_app/screen/New_Password.dart';
import 'package:restaurants_app/screen/Sent_Otp.dart';
import 'package:restaurants_app/screen/Splash_screen.dart';
import 'package:restaurants_app/screen/choice.dart';
import 'package:restaurants_app/screen/forget_password.dart';
import 'package:restaurants_app/screen/intro_screen.dart';

import 'bloc/login_bloc.dart';
import 'bloc/register_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginBloc>(create: (context) => LoginBloc()),
         Provider<RegisterBloc>(create: (context) => RegisterBloc())
      ],
      child: MaterialApp(
        title: 'Complete Authentication',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}

