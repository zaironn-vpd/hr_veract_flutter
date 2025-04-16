import 'dart:convert';

import 'package:hr_veract/src/features/auth/repository/token_repository.dart';
import 'package:hr_veract/src/features/memo/domain/memo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'memo_repository.g.dart';

@riverpod
class MemoRepository extends _$MemoRepository {
  FutureOr<List<Memo>> build() async {
    return await memoList();
  }

  Future<List<Memo>> memoList() async {
    try {
      final tokenRepo = ref.watch(tokenRepositoryProvider);
      final authToken = await tokenRepo.getToken();

      final url = Uri.parse('http://127.0.0.1:8000/api/employee/memo');
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

        final List data = jsonResponse['memo'];
        final List memoData = [];

        int count = data.length;
        int index = 0;
        while (index != count) {
          memoData.add(data[index]['memo']);
          index++;
        }

        final filesMap = memoData.map((memo) => Memo.fromJson(memo)).toList();
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
