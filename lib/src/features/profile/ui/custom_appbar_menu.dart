import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_veract/src/features/auth/repository/token_repository.dart';
import 'package:hr_veract/src/features/profile/ui/check_token.dart';

class CustomAppbarMenu extends ConsumerWidget implements PreferredSizeWidget {
  final String appBarTitle;
  const CustomAppbarMenu({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // void click() {
    //   ref.watch(checkTokenProvider.notifier).isTokenValid();
    // }

    // final tokenRepo = ref.watch(tokenRepositoryProvider);
    // ref.listen<AsyncValue<void>>(checkTokenProvider, (prev, next) {
    //   next.whenOrNull(
    //     data: (_) {
    //       if (ModalRoute.of(context)?.settings.name != '/profile') {
    //         Navigator.pushNamed(context, '/profile');
    //       }
    //     },
    //     error: (e, st) {
    //       tokenRepo.clearToken();
    //       Navigator.pushReplacementNamed(context, '/');
    //     },
    //     loading: () {},
    //   );
    // });

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
              // click();
              // final tokenRepo = ref.watch(tokenRepositoryProvider);
              // tokenRepo.clearToken();
              Navigator.pushNamed(context, '/profile');
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
