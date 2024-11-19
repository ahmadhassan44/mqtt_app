import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt_app/presentation/cubits/main_screen/main_screen_states.dart';

class MainCubit extends Cubit<MainScreenState> {
  MainCubit() : super(MainScreenInitial()){

  }
  
}
