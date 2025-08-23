import 'package:cinebox_app_flutter/ui/login/commands/login_with_google_command.dart';
import 'package:cinebox_app_flutter/ui/login/login_view_model.dart';
import 'package:cinebox_app_flutter/ui/login/widgets/sign_in_google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinebox_app_flutter/ui/core/themes/resource.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              R.ASSETS_IMAGES_BG_LOGIN_PNG,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color.fromARGB(
                      255,
                      18,
                      18,
                      18,
                    ).withValues(alpha: 1),
                  ],
                  stops: [0.0, 0.65],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      R.ASSETS_IMAGES_LOGO_PNG,
                      width: 200,
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Consumer(
                        builder: (context, ref, child) {
                          final state = ref.watch(
                            loginWithGoogleCommandProvider,
                          );

                          return SignInGoogleButton(
                            isLoading: state.isLoading,
                            onPressed: () {
                              final viewModel = ref.read(
                                loginViewModelProvider,
                              );

                              viewModel.googleLogin();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
