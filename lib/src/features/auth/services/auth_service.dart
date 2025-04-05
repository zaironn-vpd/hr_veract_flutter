import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_veract/src/features/auth/domain/auth_user.dart';
import 'package:hr_veract/src/features/auth/repository/auth_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

class AuthService {
  AuthService({required this.authRepository});

  final AuthRepositoryImpl authRepository;

  Future<AuthUser> signIn(String userName, String password) async {
    return await authRepository.signIn(userName, password);
  }
}

@riverpod
AuthService authService(Ref ref) {
  return AuthService(authRepository: ref.watch(authRepositoryImplProvider));
}
