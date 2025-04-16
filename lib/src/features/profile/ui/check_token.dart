import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_veract/src/features/auth/repository/token_repository.dart';
import 'package:hr_veract/src/features/exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_token.g.dart';

@riverpod
class CheckToken extends _$CheckToken {
  @override
  FutureOr<void> build() {
    return null;
  }

  void isTokenValid() async {
    try {
      state = const AsyncLoading();

      final tokenRepo = ref.watch(tokenRepositoryProvider);
      bool tokenValid = await tokenRepo.isTokenValid();

      if (!tokenValid) {
        state = AsyncError(Exception('Token is invalid'), StackTrace.current);
        return;
      }

      state = AsyncData(null);
    } on ServerException catch (e, st) {
      state = AsyncError(e, st);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
