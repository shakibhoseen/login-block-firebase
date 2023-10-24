import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_bf/app.dart';
import 'package:login_bf/firebase_options.dart';
import 'package:user_repository/user_repository.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
 

  runApp( MyApp(FirebaseUserRepo()));
}

