import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'authenticator/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'authenticator/cubit/auth_cubit.dart';
import 'authenticator/repository/auth_repository.dart';
import 'package:asuka/asuka.dart' as asuka;

import 'common/presentation/presentation.dart';
void main() {
  Bloc.observer = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      builder: asuka.builder,
      debugShowCheckedModeBanner: false,
      title: 'Prajna',
      theme: ThemeData(
        fontFamily: "Nunito",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return LoadingPage();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return BlocProvider(
               create: (context) => AuthCubit(),
                child: AuthPage());
          }
          // Otherwise, show something whilst waiting for initialization to complete
          return LoadingPage();
        },
      ),
    );
  }
}


