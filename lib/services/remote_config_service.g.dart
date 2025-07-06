// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchRemoteConfigHash() => r'64f965aa2bdfe8323a7679049c386d5948685050';

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
    required RemoteConfigKey key,
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
    required RemoteConfigKey key,
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

  final RemoteConfigKey key;

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
  RemoteConfigKey get key;
}

class _FetchRemoteConfigProviderElement
    extends AutoDisposeFutureProviderElement<String> with FetchRemoteConfigRef {
  _FetchRemoteConfigProviderElement(super.provider);

  @override
  RemoteConfigKey get key => (origin as FetchRemoteConfigProvider).key;
}

String _$fetchStringConfigStreamHash() =>
    r'28e3c5cbdb5cf86ccd98fb3edf7c03cbcfed3be7';

/// See also [fetchStringConfigStream].
@ProviderFor(fetchStringConfigStream)
const fetchStringConfigStreamProvider = FetchStringConfigStreamFamily();

/// See also [fetchStringConfigStream].
class FetchStringConfigStreamFamily extends Family<AsyncValue<String>> {
  /// See also [fetchStringConfigStream].
  const FetchStringConfigStreamFamily();

  /// See also [fetchStringConfigStream].
  FetchStringConfigStreamProvider call({
    required RemoteConfigKey key,
  }) {
    return FetchStringConfigStreamProvider(
      key: key,
    );
  }

  @override
  FetchStringConfigStreamProvider getProviderOverride(
    covariant FetchStringConfigStreamProvider provider,
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
  String? get name => r'fetchStringConfigStreamProvider';
}

/// See also [fetchStringConfigStream].
class FetchStringConfigStreamProvider
    extends AutoDisposeStreamProvider<String> {
  /// See also [fetchStringConfigStream].
  FetchStringConfigStreamProvider({
    required RemoteConfigKey key,
  }) : this._internal(
          (ref) => fetchStringConfigStream(
            ref as FetchStringConfigStreamRef,
            key: key,
          ),
          from: fetchStringConfigStreamProvider,
          name: r'fetchStringConfigStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchStringConfigStreamHash,
          dependencies: FetchStringConfigStreamFamily._dependencies,
          allTransitiveDependencies:
              FetchStringConfigStreamFamily._allTransitiveDependencies,
          key: key,
        );

  FetchStringConfigStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.key,
  }) : super.internal();

  final RemoteConfigKey key;

  @override
  Override overrideWith(
    Stream<String> Function(FetchStringConfigStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchStringConfigStreamProvider._internal(
        (ref) => create(ref as FetchStringConfigStreamRef),
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
  AutoDisposeStreamProviderElement<String> createElement() {
    return _FetchStringConfigStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchStringConfigStreamProvider && other.key == key;
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
mixin FetchStringConfigStreamRef on AutoDisposeStreamProviderRef<String> {
  /// The parameter `key` of this provider.
  RemoteConfigKey get key;
}

class _FetchStringConfigStreamProviderElement
    extends AutoDisposeStreamProviderElement<String>
    with FetchStringConfigStreamRef {
  _FetchStringConfigStreamProviderElement(super.provider);

  @override
  RemoteConfigKey get key => (origin as FetchStringConfigStreamProvider).key;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
