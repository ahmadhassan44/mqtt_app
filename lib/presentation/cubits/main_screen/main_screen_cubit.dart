import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logging/logging.dart';
import 'package:mqtt_app/presentation/cubits/main_screen/main_screen_states.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MainCubit extends Cubit<MainScreenState> {
  MqttServerClient? client;

  MainCubit() : super(MainScreenInitial());

  void connect(String brokerUrl) {
    emit(MainScreenConnecting());
    client = MqttServerClient(brokerUrl, '');
    client?.connect().onError((error, stackTrace) {
      final Logger log = Logger('connect');
      log.severe('Exception during connection $error');
      Fluttertoast.showToast(
          msg: "Connection failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      emit(MainScreenDisconnected());
      return null;
    });
    client?.onConnected = () {
      Fluttertoast.showToast(
          msg: "Connected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      publish("sms", "i connected!");
      emit(MainScreenConnected());
    };
    //handle the connection failure
  }

  void subscribe(String topic) {
    emit(MainScreenSubscribing());
    Future.delayed(const Duration(seconds: 2), () {
      emit(MainScreenSubscribed());
    });
  }

  void disconnect() {
    emit(MainScreenDisconnecting());
    Future.delayed(const Duration(seconds: 2), () {
      emit(MainScreenDisconnected());
    });
  }

  void unsubscribe() {
    emit(MainScreenUnsubscribing());
    Future.delayed(const Duration(seconds: 2), () {
      emit(MainScreenUnsubscribed());
    });
  }
  void publish(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client?.publishMessage("sms", MqttQos.atMostOnce,builder.payload!);
  }
}