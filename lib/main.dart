import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:payment_integration/modules/ref_code/ref_code_screen.dart';
import 'modules/register/register_screen.dart';
import 'modules/toggle/toggle_screen.dart';
import 'shared/bloc_observer/bloc_observer.dart';
import 'shared/network/dio_helper.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RegisterScreen(),
    );
  }
}
