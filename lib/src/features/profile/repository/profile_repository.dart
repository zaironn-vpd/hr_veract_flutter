import 'package:hr_veract/src/features/auth/repository/auth_state.dart';
import 'package:hr_veract/src/features/auth/repository/token_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'profile_repository.g.dart';

@riverpod
class ProfileRepository extends _$ProfileRepository {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> fetchProfile(Future<String?> token) async {
    state = AsyncLoading();
    final url = Uri.parse('http://127.0.0.1:8000/api/user/profile');
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      state = AsyncData(response.headers);
    } else {
      throw Exception("Error making api request");
    }
  }
}
