import 'package:flutter/material.dart';

class AppDialog {

  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
  }

  static void showAlertDialog(BuildContext context, {required String content}) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(context),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
             
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  static void showError({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  
}
