import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hr_veract/src/features/auth/secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_repository.g.dart';

class TokenRepository {
  TokenRepository({required this.secureStorage});

  FlutterSecureStorage secureStorage;

  Future<void> writeToken({
    String keyName = 'token',
    required String value,
  }) async {
    await secureStorage.write(key: keyName, value: value);
  }

  Future<String?> getToken() async {
    final token = await secureStorage.read(key: 'token');
    if (token == null) return null;
    return token;
  }

  Future<bool> isTokenValid() async {
    final token = await getToken();
    if (token == null) return false;
    bool isExpired = JwtDecoder.isExpired(token);
    if (isExpired) {
      await clearToken();
      return false;
    }
    return true;
  }

  Future<void> clearToken() async {
    await secureStorage.delete(key: 'token');
  }
}

@riverpod
TokenRepository tokenRepository(Ref ref) {
  return TokenRepository(secureStorage: ref.watch(secureStorageProvider));
}

@Riverpod(keepAlive: true)
Future<String?> getToken(Ref ref) {
  return ref.read(tokenRepositoryProvider).getToken();
}
