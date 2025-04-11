import 'package:hr_veract/src/features/auth/repository/token_repository.dart';
import 'package:hr_veract/src/features/exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signOut_repository.g.dart';

@riverpod
class SignoutRepository extends _$SignoutRepository {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> signOut() async {
    try {
      state = AsyncLoading();
      final tokenRepo = ref.read(tokenRepositoryProvider);
      tokenRepo.clearToken();
      state = AsyncData(null);
    } on ServerException catch (e, st) {
      state = AsyncError(e, st);
    } catch (e, st) {
      state = AsyncError(e, st);
    }

    //final authToken = tokenRepo.getToken();
    // final response = await http.post(
    //   Uri.parse('http://127.0.0.1:8000/api/user/profile'),
    //   headers: {
    //     "Content-Type": "application/json",
    //     "Accept": "application/json",
    //     "Authorization": "Bearer $authToken",
    //   },
    // );

    // if (response == 200) {
    //   final data = response.headers;
    //   print(data);
    // }

    // final url = Uri.parse('http://127.0.0.1:8000/api/user/logout');
    // final response = await http.post(
    //   url,
    //   headers: {
    //     "Content-Type": "application/json",
    //     "Accept": "application/json",
    //     "Authorization": "Bearer $authToken",
    //   },
    // );
  }
}
