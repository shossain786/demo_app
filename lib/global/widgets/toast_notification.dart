import 'package:flutter/material.dart';

class ToastNotifierWidget {
  static showSuccessNotification({
    required BuildContext context,
    required String? message,
    required String? description,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Durations.extralong3,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        content: ListTile(
          visualDensity: const VisualDensity(vertical: -4, horizontal: 0),
          title: Text(
            message ?? 'Success',
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            description ?? '',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  static showFailureNotification({
    required BuildContext context,
    required String? message,
    required String? description,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Durations.extralong3,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        content: ListTile(
          visualDensity: const VisualDensity(vertical: -4, horizontal: 0),
          title: Text(
            message ?? 'Success',
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            description ?? '',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
