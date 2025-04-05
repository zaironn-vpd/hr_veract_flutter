// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authStateControllerHash() =>
    r'4cca4e75fcc0b27517a183443dd04a759d2269f3';

/// See also [AuthStateController].
@ProviderFor(AuthStateController)
final authStateControllerProvider =
    AsyncNotifierProvider<AuthStateController, void>.internal(
      AuthStateController.new,
      name: r'authStateControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$authStateControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AuthStateController = AsyncNotifier<void>;
String _$authStateNotifierHash() => r'b6c0111f0e540e2e0aed1e3e70eab676cd836b28';

/// See also [AuthStateNotifier].
@ProviderFor(AuthStateNotifier)
final authStateNotifierProvider =
    AutoDisposeNotifierProvider<AuthStateNotifier, AuthState>.internal(
      AuthStateNotifier.new,
      name: r'authStateNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$authStateNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AuthStateNotifier = AutoDisposeNotifier<AuthState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
