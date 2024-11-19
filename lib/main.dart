import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt_app/presentation/cubits/main_screen/main_screen_cubit.dart';
import 'package:mqtt_app/presentation/screens/main_screen.dart';

class MqttApp extends StatelessWidget {
  const MqttApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (context) => MainCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MQTT App',
        home: MainScreen(),
      ),
    );
  }
}
void main() async{
  runApp(const MqttApp());
}
