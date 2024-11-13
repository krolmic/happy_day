import 'package:flutter/material.dart';
import 'package:happy_day/bootstrap.dart';
import 'package:local_storage_structures_api/local_storage_structures_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final structuresApi = LocalStorageStructuresApi(
    plugin: await SharedPreferences.getInstance(),
  );

  bootstrap(structuresApi: structuresApi);
}
