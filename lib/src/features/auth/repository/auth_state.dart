import 'package:hr_veract/src/features/auth/repository/token_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state.g.dart';

enum AuthState { authenticated, notAuthenticated }

@Riverpod(keepAlive: true)
class AuthStateController extends _$AuthStateController {
  @override
  Future<void> build() async {
    checkState();
  }

  Future<void> checkState() async {
    final tokenRepo = ref.read(tokenRepositoryProvider);
    final authStateNotifier = ref.read(authStateNotifierProvider.notifier);
    bool isTokenValid = await tokenRepo.isTokenValid();
    if (!isTokenValid) {
      authStateNotifier.notAuthenticated();
    }

    authStateNotifier.authenticate();
  }
}

@riverpod
class AuthStateNotifier extends _$AuthStateNotifier {
  @override
  AuthState build() {
    return AuthState.notAuthenticated;
  }

  void authenticate() {
    state = AuthState.authenticated;
  }

  void notAuthenticated() {
    state = AuthState.notAuthenticated;
  }
}
