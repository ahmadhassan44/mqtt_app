import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt_app/presentation/cubits/main_screen/main_screen_cubit.dart';
import 'package:mqtt_app/presentation/widgets/main_screen.dart';

import '../cubits/main_screen/main_screen_states.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainScreenState>(
      builder: (context, state) {
        if (state is MainScreenInitial) {
          return const MainScreenWidget(
            {
              'connected': false,
              'subscribed': false,
            },
          );
        } else if (state is MainScreenConnected) {
          return const MainScreenWidget(
            {
              'connected': true,
              'subscribed': false,
            },
          );
        } else if (state is MainScreenDisconnected) {
          return const MainScreenWidget(
            {
              'connected': false,
              'subscribed': false,
            },
          );
        } else if (state is MainScreenSubscribed) {
          return const MainScreenWidget(
            {
              'connected': true,
              'subscribed': true,
            },
          );
        } else if (state is MainScreenUnsubscribed) {
          return const MainScreenWidget(
            {
              'connected': true,
              'subscribed': false,
            },
          );
        } else if (state is MainScreenConnecting) {
          return const MainScreenWidget(
            {
              'connecting': true,
              'connected': false,
              'subscribed': false,
            },
          );
        } else if (state is MainScreenDisconnecting) {
          return const MainScreenWidget(
            {
              'disconnecting': true,
              'connected': false,
              'subscribed': false,
            },
          );
        } else if (state is MainScreenSubscribing) {
          return const MainScreenWidget(
            {
              'subscribing': true,
              'connected': true,
              'subscribed': false,
            },
          );
        } else {
          return const MainScreenWidget(
            {
              'unsubscribing': true,
              'connected': true,
              'subscribed': false,
            },
          );
        }
      },
    );
  }
}