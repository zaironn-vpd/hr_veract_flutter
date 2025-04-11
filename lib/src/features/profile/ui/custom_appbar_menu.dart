import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_veract/src/features/auth/repository/auth_state.dart';
import 'package:hr_veract/src/features/auth/repository/token_repository.dart';
import 'package:hr_veract/src/features/profile/repository/profile_repository.dart';

class CustomAppbarMenu extends ConsumerWidget implements PreferredSizeWidget {
  final String appBarTitle;
  const CustomAppbarMenu({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      centerTitle: true,
      title: Text(
        appBarTitle,
        style: TextStyle(
          fontFamily: 'PoppinsBold',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 16,
          letterSpacing: 2,
        ),
      ),
      backgroundColor: Color.fromRGBO(106, 159, 106, 1),
      leading: Builder(
        builder:
            (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Opens the drawer
              },
            ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: GestureDetector(
            onTap: () {
              final tokenRepo = ref.watch(tokenRepositoryProvider);

              ref.watch(authStateControllerProvider.notifier).checkState();
              final authState = ref.watch(authStateNotifierProvider);
              switch (authState) {
                case AuthState.authenticated:
                  Navigator.pushNamed(context, '/profile');
                case AuthState.notAuthenticated:
                  tokenRepo.clearToken();
                  Navigator.pushReplacementNamed(context, '/');
                default:
                  tokenRepo.clearToken();
                  Navigator.pushReplacementNamed(context, '/');
              }
            },
            child: CircleAvatar(
              backgroundImage: AssetImage('images/profilePic.jpg'),
              radius: 18,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
