import 'dart:convert';

import 'package:hr_veract/src/features/201_files/domain/files.dart';
import 'package:hr_veract/src/features/auth/repository/token_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'files_repository.g.dart';

@riverpod
class FilesRepository extends _$FilesRepository {
  @override
  FutureOr<List<Files>> build() async {
    return await files();
  }

  Future<List<Files>> files() async {
    try {
      final tokenRepo = ref.watch(tokenRepositoryProvider);
      final authToken = await tokenRepo.getToken();

      final url = Uri.parse('http://127.0.0.1:8000/api/employee/files');
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $authToken",
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        final List data = jsonResponse['files'];

        final filesMap = data.map((file) => Files.fromJson(file)).toList();
        return filesMap;
      } else {
        throw Exception("Failed to fetch profile: ${response.statusCode}");
      }
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }
}
