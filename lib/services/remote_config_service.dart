import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'remote_config_service.g.dart';

@riverpod
Future<String> fetchRemoteConfig(Ref ref, {required String key}) async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(seconds: 5),
    ),
  );

  await remoteConfig.fetchAndActivate();
  final value = remoteConfig.getString(key);
  return value;
}

@riverpod
Stream<String> fetchStringConfigStream(Ref ref, {required String key}) async* {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(seconds: 10),
  ));
  
  await remoteConfig.fetchAndActivate();
  final initialValue = remoteConfig.getString(key);
  yield initialValue;
  
  await for (final _ in remoteConfig.onConfigUpdated) {
    try {
      await remoteConfig.activate();
      final newValue = remoteConfig.getString(key);
      yield newValue;
    } catch (e) {
      // Handle errors silently or yield previous value
    }
  }
}
