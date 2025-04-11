import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_veract/src/features/auth/ui/auth_login_controller.dart';
import 'package:hr_veract/views/custom_widgets/custom_button.dart';
import 'package:hr_veract/views/custom_widgets/custom_input_field.dart';
import 'package:hr_veract/views/custom_widgets/custom_input_field_obscure.dart';
import 'package:hr_veract/views/custom_widgets/custom_popup_dialog.dart';

class UserLoginPage extends ConsumerStatefulWidget {
  const UserLoginPage({super.key});

  @override
  ConsumerState<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends ConsumerState<UserLoginPage> {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void submit(String userName, String password) {
      if (userName.isEmpty || password.isEmpty) {
        String errorMessage = '';

        if (userName.isEmpty) {
          errorMessage = "Please input username!";
        } else if (password.isEmpty) {
          errorMessage = "Please input password!";
        }

        showDialog(
          context: context,
          builder:
              (context) => CustomPopupDialog(
                contents: [
                  Text(
                    errorMessage,
                    style: TextStyle(
                      fontFamily: "PoppinsRegular",
                      fontSize: 16,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
        );
        return;
      }

      ref
          .watch(authLoginControllerProvider.notifier)
          .signIn(userName, password);
    }

    ref.listen<AsyncValue<void>>(authLoginControllerProvider, (prev, next) {
      next.whenOrNull(
        data: (data) => Navigator.pushReplacementNamed(context, '/dashboard'),
        loading:
            () => showDialog(
              context: context,
              builder:
                  (context) => CustomPopupDialog(
                    contents: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 20),
                              Text(
                                'Logging in...',
                                style: TextStyle(
                                  fontFamily: "PoppinsRegular",
                                  fontSize: 16,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
            ),
        error:
            (e, st) => showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                    content: Text(
                      e.toString(),
                      style: TextStyle(
                        fontFamily: 'PoppinsRegular',
                        fontSize: 14,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
            ),
      );
    });

    // final loginState = ref.watch(authLoginControllerProvider);

    // loginState.when(

    // );

    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'VeraCT',
              style: TextStyle(
                letterSpacing: 5,
                fontSize: 64.0,
                color: Color.fromRGBO(44, 62, 80, 1),
                fontWeight: FontWeight.bold,
                fontFamily: 'PoppinsBold',
              ),
            ),
            InputField(
              textFieldWidth: 300,
              textHint: "User Name",
              textSize: 16,
              controller: usernameController,
            ),
            SizedBox(height: 20),
            InputFieldObscure(controller: passwordController),
            CustomButton(
              onPressed: () {
                final userName = usernameController.text;
                final password = passwordController.text;

                submit(userName, password);
              },
              buttonHeight: 35,
              buttonText: "Login",
              buttonTextSize: 14,
              buttonWidth: 135,
            ),
          ],
        ),
      ),
    );
  }
}
