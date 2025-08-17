import 'package:cinebox_app_flutter/ui/core/themes/resource.dart';
import 'package:cinebox_app_flutter/ui/core/widgets/loader_messages/loader_messages.dart';
import 'package:cinebox_app_flutter/ui/splash/commands/check_user_logged_command.dart';
import 'package:cinebox_app_flutter/ui/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with LoaderAndMessages {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashViewModelProvider).checkLoginAndRedirect();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(checkUserLoggedCommandProvider, (_, next) {
      next.whenOrNull(
        data: (data) {
          final path = switch (data) {
            true => '/home',
            false => '/login',
            null => '',
          };

          if (path.isNotEmpty && context.mounted) {
            Navigator.pushNamedAndRemoveUntil(context, path, (route) => false);
          }
        },
        error: (error, stack) {
          if (context.mounted) {
            showErrorSnackbar(
              'Error checking user login',
            );

            Navigator.pushNamedAndRemoveUntil(
              context,
              '/login',
              (route) => false,
            );
          }
        },
      );
    });

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
                  stops: [0.0, 0.8],
                ),
              ),
              child: Center(
                child: Image.asset(
                  R.ASSETS_IMAGES_LOGO_PNG,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
