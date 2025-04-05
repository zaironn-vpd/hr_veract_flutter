import 'auth_user.dart';

abstract class AuthRepository {
  Future<AuthUser> signIn(String username, String password);
  Future<void> signOut();
}
