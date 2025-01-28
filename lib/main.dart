import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pigeon_example/message.g.dart';

class PlatformChannel extends StatefulWidget {
  const PlatformChannel({super.key});

  @override
  State<PlatformChannel> createState() => _PlatformChannelState();
}

class _PlatformChannelState extends State<PlatformChannel> {
  final flutterHostApi = FlutterHostApi();

  String _batteryLevel = 'Battery level: unknown.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel = (await flutterHostApi.getBattery()).toString();
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_batteryLevel, key: const Key('Battery level label')),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _getBatteryLevel,
                  child: const Text('Refresh'),
                ),
              ),
              const SizedBox(height: 46),
              ElevatedButton(
                onPressed: () {
                  flutterHostApi.saveData(DataModel(name: 'John Doe', age: 42));
                },
                child: const Text('Save data'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: PlatformChannel()));
}
