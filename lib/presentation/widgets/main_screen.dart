import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt_app/presentation/cubits/main_screen/main_screen_cubit.dart';

class MainScreenWidget extends StatelessWidget {
  final Map<String, bool> flags;
  final TextEditingController brokerUrlController = TextEditingController();
  final TextEditingController subscribeController = TextEditingController();

  MainScreenWidget(this.flags, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MQTT App'),
      ),
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: Center(
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              TextField(
                controller: brokerUrlController,
                decoration: const InputDecoration(
                  labelText: 'Enter broker URL',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              _buildConnectButton(context),
              const Expanded(child: SizedBox()),
               TextField(
                 controller: subscribeController,
                decoration: const InputDecoration(
                  labelText: 'Enter Topic to Subscribe',
                ),
              ),
              _buildSubscribeButton(context),
              const Expanded(child: SizedBox()),
              _buildBroadcastButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConnectButton(BuildContext context) {
    if (flags['connecting'] == true) {
      return const ElevatedButton(
        onPressed: null,
        child: Text("Connecting"),
      );
    } else if (flags['connected'] == true) {
      return ElevatedButton(
        onPressed: () {
          context.read<MainCubit>().disconnect();
        },
        child: const Text("Disconnect"),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          //get the url from field here and pass it to connect
          final brokerUrl = brokerUrlController.text;
          context.read<MainCubit>().connect(brokerUrl);
        },
        child: const Text("Connect"),
      );
    }
  }

  Widget _buildSubscribeButton(BuildContext context) {
    if (flags['subscribing'] == true) {
      return const ElevatedButton(
        onPressed: null,
        child: Text("Subscribing"),
      );
    } else if (flags['subscribed'] == true) {
      return ElevatedButton(
        onPressed: () {
          context.read<MainCubit>().unsubscribe();
        },
        child: const Text("Unsubscribe"),
      );
    } else if (flags['connected'] == true) {
      return ElevatedButton(
        onPressed: () {
          final topic = subscribeController.text;
          context.read<MainCubit>().subscribe(topic);
        },
        child: const Text("Subscribe"),
      );
    } else {
      return const ElevatedButton(
        onPressed: null,
        child: Text("Subscribe"),
      );
    }
  }

  Widget _buildBroadcastButton(BuildContext context) {
    return ElevatedButton(
      onPressed: flags['connected'] == true ? () {} : null,
      child: const Text("Broadcast"),
    );
  }
}