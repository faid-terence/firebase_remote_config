enum RemoteConfigKey {
  primaryColor('primaryColor'),
  buttonText('buttonText'),
  welcomeMessage('welcomeMessage');

  const RemoteConfigKey(this.key);

  final String key;

  String get defaultValue {
    switch (this) {
      case RemoteConfigKey.primaryColor:
        return 'blue';
      case RemoteConfigKey.buttonText:
        return 'Click Me!';
      case RemoteConfigKey.welcomeMessage:
        return 'Welcome to our app!';
    }
  }
}

extension RemoteConfigKeyExtension on RemoteConfigKey {
  static Map<String, String> get allDefaults {
    return {
      for (final key in RemoteConfigKey.values) key.key: key.defaultValue
    };
  }

  static List<String> get allKeys {
    return RemoteConfigKey.values.map((key) => key.key).toList();
  }

  static RemoteConfigKey? fromString(String keyString) {
    try {
      return RemoteConfigKey.values.firstWhere((key) => key.key == keyString);
    } catch (e) {
      return null;
    }
  }
}
