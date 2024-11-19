import 'package:flutter/material.dart';
import 'package:mqtt_app/presentation/screens/main_screen.dart';

class MqttApp extends StatelessWidget {
  const MqttApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MQTT App',
      home: MainScreen(),
    );
  }
}
void main(){
  runApp(const MqttApp());
}
