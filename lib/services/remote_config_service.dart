import 'dart:developer';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'remote_config_service.g.dart';

@riverpod
Future<String> fetchRemoteConfig(Ref ref, {required String key}) async {
  log('Fetching remote config for key: $key');

  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(seconds: 5),
    ),
  );

  log('Fetching and activating remote config...');
  await remoteConfig.fetchAndActivate();

  final value = remoteConfig.getString(key);
  log('Remote config value for key "$key": $value');

  return value;
}
