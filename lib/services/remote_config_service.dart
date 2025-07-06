import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_remote_config_app_example/models/remote_config_keys.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'remote_config_service.g.dart';

@riverpod
Future<String> fetchRemoteConfig(Ref ref,
    {required RemoteConfigKey key}) async {
  final remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setDefaults(RemoteConfigKeyExtension.allDefaults);

  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(seconds: 1),
    ),
  );

  await remoteConfig.fetchAndActivate();
  final value = remoteConfig.getString(key.key);
  return value;
}

@riverpod
Stream<String> fetchStringConfigStream(Ref ref,
    {required RemoteConfigKey key}) async* {
  final remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setDefaults(RemoteConfigKeyExtension.allDefaults);

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(seconds: 1),
  ));

  await remoteConfig.fetchAndActivate();
  final initialValue = remoteConfig.getString(key.key);
  yield initialValue;

  await for (final _ in remoteConfig.onConfigUpdated) {
    try {
      await remoteConfig.activate();
      final newValue = remoteConfig.getString(key.key);
      yield newValue;
    } catch (e) {
      // Continue with previous value on error
    }
  }
}
