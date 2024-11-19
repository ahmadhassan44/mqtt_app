import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt_app/presentation/cubits/main_screen/main_screen_states.dart';

class MainCubit extends Cubit<MainScreenState> {
  MainCubit() : super(MainScreenInitial());

  void connect(String brokerUrl) {
    emit(MainScreenConnecting());
    Future.delayed(const Duration(seconds: 2), () {
      emit(MainScreenConnected());
    });
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
}