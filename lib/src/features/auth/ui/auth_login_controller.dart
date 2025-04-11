import 'package:hr_veract/src/features/auth/repository/auth_state.dart';
import 'package:hr_veract/src/features/auth/repository/token_repository.dart';
import 'package:hr_veract/src/features/auth/services/auth_service.dart';
import 'package:hr_veract/src/features/exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_login_controller.g.dart';

@riverpod
class AuthLoginController extends _$AuthLoginController {
  @override
  FutureOr<void> build() {
    return null;
  }

  void signIn(String userName, String password) async {
    try {
      state = const AsyncLoading();

      final authService = ref.watch(authServiceProvider);
      final tokenRepo = ref.watch(tokenRepositoryProvider);

      final user = await authService.signIn(userName, password);
      await tokenRepo.writeToken(value: user.token);

      final authStateController = ref.watch(
        authStateControllerProvider.notifier,
      );
      await authStateController.checkState();

      state = const AsyncData(null);
    } on ServerException catch (e, st) {
      state = AsyncError(e, st);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
