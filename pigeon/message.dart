import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/message.g.dart',
    kotlinOut:
        'android/app/src/main/kotlin/com/example/pigeon_example/Message.g.kt',
    swiftOut: 'ios/Runner/Message.g.swift',
  ),
)
@HostApi()
abstract class FlutterHostApi {
  @async
  int getBattery();

  @async
  void saveData(DataModel data);
}

class DataModel {
  final String name;
  final int age;

  DataModel({
    required this.name,
    required this.age,
  });
}
