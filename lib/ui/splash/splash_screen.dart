import 'package:cinebox_app_flutter/ui/core/themes/resource.dart';
import 'package:cinebox_app_flutter/ui/core/widgets/loader_messages/loader_messages.dart';
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
