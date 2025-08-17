import 'package:cinebox_app_flutter/ui/core/themes/colors.dart';
import 'package:cinebox_app_flutter/ui/core/themes/resource.dart';
import 'package:flutter/material.dart';

class SignInGoogleButton extends StatelessWidget {
  const SignInGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
      onPressed: () {},
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(R.ASSETS_IMAGES_GOOGLE_LOGO_PNG),
          ),
          Text(
            'Entrar com o Google',
            style: TextStyle(fontSize: 14, color: AppcColors.darkGrey),
          ),
        ],
      ),
    );
  }
}
