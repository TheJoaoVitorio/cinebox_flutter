import 'package:cinebox_app_flutter/ui/core/themes/colors.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:delightful_toast/delight_toast.dart';

mixin LoaderAndMessages<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  var isOpen = false;

  void showloader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => LoadingAnimationWidget.halfTriangleDot(
          color: AppcColors.backgroundColor,
          size: 70,
        ),
      );
    }
  }

  void hideloader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }

  void _showToast(
    String message,
    Color color,
    Color shadowColor,
    IconData icon,
  ) {
    DelightToastBar(
      builder: (context) => ToastCard(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: color,
        shadowColor: shadowColor,
      ),
      animationDuration: Duration(seconds: 1),
      snackbarDuration: Duration(seconds: 3),
      autoDismiss: true,
    ).show(context);
  }

  void showErrorSnackbar(String message) {
    _showToast(
      message,
      Colors.red,
      Colors.redAccent,
      Icons.error,
    );
  }

  void showSuccessSnackbar(String message) {
    _showToast(
      message,
      Colors.green,
      Colors.greenAccent,
      Icons.check_circle,
    );
  }

  void showInfoSnackbar(String message) {
    _showToast(
      message,
      Colors.blue,
      Colors.blueAccent,
      Icons.info,
    );
  }
}
