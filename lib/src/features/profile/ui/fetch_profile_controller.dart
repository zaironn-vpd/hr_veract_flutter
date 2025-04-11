import 'package:hr_veract/src/features/auth/repository/auth_state.dart';
import 'package:hr_veract/src/features/auth/repository/token_repository.dart';
import 'package:hr_veract/src/features/exception.dart';
import 'package:hr_veract/src/features/profile/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'fetch_profile_controller.g.dart';

@riverpod
class FetchProfileController extends _$FetchProfileController {
  @override
  FutureOr<void> build() {
    return null;
  }

  void fetchProfile() async {
    try {
      state = AsyncLoading();
      final tokenRepo = ref.watch(tokenRepositoryProvider);
      final authToken = tokenRepo.getToken();
      final authState = ref.watch(authStateNotifierProvider);
      switch (authState) {
        case AuthState.authenticated:
          final profRepo = ref.watch(profileRepositoryProvider.notifier);
          profRepo.fetchProfile(authToken);
        case AuthState.notAuthenticated:
        default:
      }
    } on ServerException catch (e, st) {
      state = AsyncError(e, st);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
