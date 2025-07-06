// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchRemoteConfigHash() => r'ec0c009c2f8302775b65384728c3686ba6f3d8a8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchRemoteConfig].
@ProviderFor(fetchRemoteConfig)
const fetchRemoteConfigProvider = FetchRemoteConfigFamily();

/// See also [fetchRemoteConfig].
class FetchRemoteConfigFamily extends Family<AsyncValue<String>> {
  /// See also [fetchRemoteConfig].
  const FetchRemoteConfigFamily();

  /// See also [fetchRemoteConfig].
  FetchRemoteConfigProvider call({
    required String key,
  }) {
    return FetchRemoteConfigProvider(
      key: key,
    );
  }

  @override
  FetchRemoteConfigProvider getProviderOverride(
    covariant FetchRemoteConfigProvider provider,
  ) {
    return call(
      key: provider.key,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchRemoteConfigProvider';
}

/// See also [fetchRemoteConfig].
class FetchRemoteConfigProvider extends AutoDisposeFutureProvider<String> {
  /// See also [fetchRemoteConfig].
  FetchRemoteConfigProvider({
    required String key,
  }) : this._internal(
          (ref) => fetchRemoteConfig(
            ref as FetchRemoteConfigRef,
            key: key,
          ),
          from: fetchRemoteConfigProvider,
          name: r'fetchRemoteConfigProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchRemoteConfigHash,
          dependencies: FetchRemoteConfigFamily._dependencies,
          allTransitiveDependencies:
              FetchRemoteConfigFamily._allTransitiveDependencies,
          key: key,
        );

  FetchRemoteConfigProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.key,
  }) : super.internal();

  final String key;

  @override
  Override overrideWith(
    FutureOr<String> Function(FetchRemoteConfigRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchRemoteConfigProvider._internal(
        (ref) => create(ref as FetchRemoteConfigRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        key: key,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _FetchRemoteConfigProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchRemoteConfigProvider && other.key == key;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchRemoteConfigRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `key` of this provider.
  String get key;
}

class _FetchRemoteConfigProviderElement
    extends AutoDisposeFutureProviderElement<String> with FetchRemoteConfigRef {
  _FetchRemoteConfigProviderElement(super.provider);

  @override
  String get key => (origin as FetchRemoteConfigProvider).key;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
