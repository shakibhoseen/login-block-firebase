import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bf/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:login_bf/screens/auth/welcome_screen.dart';
import 'package:login_bf/screens/home/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Firebase app',
      theme: ThemeData(
        colorScheme:  ColorScheme.light(
          background: Colors.white,
          onBackground: Colors.black,
          primary: Colors.redAccent.shade200, //color.fromRGBD(206,147, 216,1),
          onPrimary: Colors.black,
          secondary: Colors.pink.shade700, //color.fromRGBD(244,143, 177 ,1)
          onSecondary: Colors.white,
          tertiary: Colors.lime, //color.fromRGBD(255,204, 128,1),
          error: Colors.red,
          outline: Color(0xFF424242),
        )
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, state) {
          if (AuthenticationStatus.authenticated == state.status) {
            return const HomeScreen();
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}
