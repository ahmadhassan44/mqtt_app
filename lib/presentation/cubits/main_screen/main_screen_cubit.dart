import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt_app/presentation/cubits/main_screen/main_screen_states.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MainCubit extends Cubit<MainScreenState> {
  MqttServerClient? client;

  MainCubit() : super(MainScreenInitial());

  void connect(String brokerUrl) {
    emit(MainScreenConnecting());
    client = MqttServerClient(brokerUrl, '');
    client?.connect();
    client?.onConnected = () {
      publish("sms", "i connected!");
      emit(MainScreenConnected());
    };
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