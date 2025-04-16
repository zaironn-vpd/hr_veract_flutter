import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/auth_user.dart';
import '../repository/auth_repository_impl.dart';

part 'auth_service.g.dart';

class AuthService {
  AuthService({required this.authRepository});

  final AuthRepositoryImpl authRepository;

  Future<AuthUser> signIn(String username, String password) async {
    return await authRepository.signIn(username, password);
  }
}

@riverpod
AuthService authService(Ref ref) {
  return AuthService(authRepository: ref.watch(authRepositoryImplProvider));
}
