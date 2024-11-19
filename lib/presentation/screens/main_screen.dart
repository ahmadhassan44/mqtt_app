import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter broker URL',
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.1,),
              ElevatedButton(onPressed: (){}, child: const Text("Connect")),
              const Expanded(child: SizedBox()),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Topic to Subscribe',
                ),
              ),
              ElevatedButton(onPressed: (){}, child: const Text("Subscribe")),
              const Expanded(child: SizedBox()),


            ],
          ),
        ),
      ),
    );
  }
}
